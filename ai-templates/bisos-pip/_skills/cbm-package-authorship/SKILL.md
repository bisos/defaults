---
name: cbm-package-authorship
description: Use when creating a new bisos-pip CBM package that runs a common open-source program as a BISOS capability (e.g. bisos.kafka, bisos.prometheus, bisos.grafana) — or adding a second program to one. Covers the decisions to settle first (install source, usage side, login, integrations), the banna registrations (ports, .here IP, uid/gid), pinning and verifying upstream releases, scaffolding the repo from a model package (tools/cbmPkgScaffold.sh), the files to write and their contracts (<name>Info.py as the single source of facts, the server/usage/bundle sbom trio, units, dns, vhost, assemble, CBS, CBM pointer, <name>Admin.cs with driftCheck, quick<Name>.cs, verify.sh, README), generating the .cs files (tools/makeCs.py), installing, verifying read-only, materializing, and the pitfalls already found. Load `cbm-authorship` for the CBM leaf itself and the sbom-split rules, `sysd-pcs-authorship` for unit details, `banna-lookup` for the registries.
---

# Creating a pip CBM Package for an Open-Source Program

A *CBM package* is a bisos-pip package that makes one open-source program a BISOS capability:
installed from pinned sources, run by systemd as its own account, reachable as `<name>.here`
through nginx, materialized by one CBS that a CBM leaf points at. Three packages follow the
pattern exactly and are the models:

| Package | Shape | Use it as the model when |
|---|---|---|
| `bisos.prometheus` | 2 units, YAML config, no login, usage = promtool | the program has no login; **default model** |
| `bisos.grafana` | 1 unit, INI + provisioning files, rawBisos login, usage = gcx | the program has a login or provisioning |
| `bisos.kafka` | 2 units, Java, storage format step, usage = a built C library | something must be built or formatted |

`bisos.airflow` and `bisos.postgres` predate the pattern in parts (airflow: one sbom; postgres:
bedrock, no web UI). Do not copy their deviations.

The leaf-level CBM rules (pointer, gate, `cbm_*` verbs) and the sbom-split rules are in
`cbm-authorship`. This skill is the package around them.

## 1. Settle these with the user first

Each is a real decision; propose a default, do not silently pick.

1. **Install source.** Default: the upstream release, pinned with its published checksum, when
   Debian lacks the program or lags a major version (Grafana: absent; Prometheus: 2.x vs 3.x;
   Kafka: absent). Use apt when Debian's version is current. One method across packages is part
   of the consistency.
2. **Usage side.** What a host needs to *use* the service without running it: the separately
   packaged tools that talk to it (promtool, gcx, a client C library). Python libraries are
   *named* in the usage sbom's readme, not installed (they go in each consumer's venv). If
   there is genuinely nothing, ask before omitting the usage sbom.
3. **Login.** rawBisos (`bro_rawBisos`) is public and recognized as insecure. Convention: user
   `admin`, password = the service's name (`admin / grafana`), set where the program applies it
   once, stated in the readme. A program with no login listens on loopback only. A separate
   "secure it" layer, on top, owns real passwords, HTTPS (bisos.crypt) and non-loopback listeners.
4. **Integrations.** If the program talks to another capability (Grafana → Prometheus), take
   the other's port from `bisos.banna`, never import the other package. It must still work, with
   the integration unreachable, when the other is absent.
5. **Architectures.** Pin amd64; the install script refuses others with a clear message. Add an
   architecture by adding its checksum.

## 2. Register in bisos.banna (load `banna-lookup`)

- `tcpPorts.py`: next ports in the 24xxx service series; `hereIp` = the next free 127.0.22.x,
  *stored* on the port (never derived); `hereName` only if it differs from `portName`. Ports with
  no web UI (exporters, controllers) get no `hereIp`.
- `sysAccts.py`: the next uid in the single-account range (504–509 at the time of writing);
  `homeDir` = the data dir's parent. A helper process (node_exporter) runs as the main account.
- Before choosing: `getent passwd <uid>; getent group <gid>; ss -ltn | grep <port>`.
- Update banna's README.org (the uid list) and AI-DevStatus.org. Banna's import-time check rejects
  a duplicate IP/name; import it once to confirm.

## 3. Pin and verify the upstream release

```bash
curl -fsSL "https://api.github.com/repos/<org>/<repo>/releases?per_page=6" | python3 -c '...'   # tags, assets
```

Download each tarball into the scratchpad, check it against the *published* checksum
(`sha256sums.txt`, `<tarball>.sha256`, or the GitHub asset `digest`), and `tar -tzf` it: note the
top directory name (with or without the architecture) or its absence (gcx has none →
`hasTopDir=False`). Record version and checksum in `<name>Info.py` only after both match.

## 4. Scaffold the repo

```bash
cd /bisos/git/bxRepos/bisos-pip/<name>          # the cloned, empty GitHub repo
/bisos/venv/py3/devbin/aiActivity.cs -i initiate --activity=bisos-pip
<skill>/tools/cbmPkgScaffold.sh <name> prometheus   # copies the program-independent skeleton
```

The scaffold copies fto/tree markers, `py3/` packaging files, the namespace `__init__`, and the
panel tree, renaming the model's name; it never overwrites. Everything below is written by hand.

## 5. The files to write

| File (`py3/`) | Role | Copy from |
|---|---|---|
| `bisos/<name>/<name>Info.py` | the single source of facts and generators (§6) | prometheusInfo.py |
| `bin/<name>-sbom.pcs` | the server: account, dist, config | prometheus-sbom.pcs |
| `bin/<name>Usage-sbom.pcs` | the usage side (§1.2) | prometheusUsage-sbom.pcs |
| `bin/<name>Cbs-sbom.pcs` | bundle of the two, for the CBS (see `cbm-authorship`) | `sed s/prometheus/<name>/` of prometheusCbs-sbom.pcs |
| `bin/<name>[-part]-sysd.pcs` | one per unit (load `sysd-pcs-authorship`) | prometheus-sysd.pcs |
| `bin/<name>-here-dns.pcs` | `/etc/hosts` entry | `sed` of prometheus-here-dns.pcs |
| `bin/<name>-wvd.pcs` | nginx vhost → `listenIp:port` (§8) | prometheus-wvd.pcs / grafana-wvd.pcs |
| `bin/<name>-assemble.cs` | hereDns + webVirtDom | `sed` of prometheus-assemble.cs, fix prose |
| `bin/<name>-cbs.pcs` | the CBS: bundle sbom + units + assemble | prometheus-cbs.pcs |
| `bin/cbmProc-<name>.spcs` | CBM pointer (absolute `cbsSpec` under `/bisos/git/bxRepos`) | `sed` of cbmProc-prometheus.spcs |
| `bin/<name>Admin.cs` | hostInfo, servicesInfo, `<x>Info`, driftCheck, fullUpdate | `tools/makeCs.py` (§9) |
| `bin/quick<Name>.cs` | flat cheat sheet of direct commands | `tools/makeCs.py` (§9) |
| `tests/verify.sh` | smoke test + `<name>Info` invariants | prometheus's |
| `../README.org` | the package's README (§11) | prometheus's / grafana's |

## 6. `<name>Info.py` --- the contract

Pure (no side effects at import). One frozen dataclass and singleton `<name>Info`, plus module
functions. Everything else imports it; nothing else holds a fact.

- `acctName`; `version` + `distSha256` as a tuple of `(debianArch, sha256)`; the same for each
  extra binary (exporter, CLI).
- Paths: `installBase=/opt/<name>`, `distDir`, `homeLink=/opt/<name>/current` (units and CLIs go
  through the link, never the versioned dir), `confDir=/etc/<name>`, `dataDir=/var/lib/<name>[/data]`,
  `envFile=/etc/default/<name>` (one per unit).
- `listenIp="127.0.0.1"`, ports via `_bannaPortNu(...)` (never literals), `fqdn="<name>.here"`,
  `baseUrl`, `localUrl`, and the login if any.
- `tarballSetupScript(url, sha256, dirName, link, base, hasTopDir=True)`: bash that picks the
  checksum by `dpkg --print-architecture`, downloads to a temp dir, verifies, unpacks root-owned
  once per version, then flips the link. Identical in every package (copy it verbatim).
- One generator per config file (`configFileContent`, `envFileContent`, ...): what the sbom
  writes *only when absent*, and what driftCheck compares against.
- `sysdServiceLines(envFile)` (`User=`, `Group=`, `EnvironmentFile=`), `unitDrift`, `kvDrift`
  (KEY=VALUE files), `textDrift` (unified diff, for YAML/INI/JSON).

## 7. The sboms and units

- Server sbom: `curl`, then func-bearing pseudo-packages in load-bearing order:
  `<name>AcctSetup` (`sysAccts.useraddScript()`, data dir chowned, 750), `<name>DistSetup`,
  extra binaries, `<name>ConfSetup` (each file written only when absent, `root:<acct> 640`; run
  the program's own config check if it has one, e.g. `promtool check config`). Every func runs on
  every `sbom_fullUpdate` and must be idempotent.
- Usage sbom: `curl` + one func per tool; may reuse the server's dist script (promtool lives in
  the Prometheus tarball: whichever sbom runs first unpacks it).
- Bundle sbom: the generic file, renamed.
- Units: `Type=simple`, identity lines from `sysdServiceLines`, `ExecStart=<homeLink>/... $ARGS`
  with flags in the EnvironmentFile (`$ARGS` splits into words; `${ARGS}` would not),
  `Restart=on-failure`. `sysdUnitFileFunc` returns `None` while the binary is absent. List units
  in the CBS in start order (what is scraped/needed first).

## 8. The vhost

Always `proxy_pass http://<listenIp>:<port>` (loopback), not the `.here` address. Add what the
program needs: Server-Sent Events → `proxy_buffering off` (Kafbat); WebSocket → a location with
`Upgrade`/`Connection "upgrade"` (Grafana Live at `/api/live/`). Set the program's external URL
(`--web.external-url`, `root_url`) to `http://<name>.here/` so its links are right.

## 9. Generate the .cs files

The `.cs` files carry the full COMEEGA dblock chain. `tools/makeCs.py` assembles one from
bisos.kafka's `kafkaAdmin.cs` framework parts (header dblocks, csuList, main, endOfFile) plus a
parts file that defines `SUMMARY`, `DESCRIPTION`, `IMPORTS` and `BODY`:

```bash
python3 <skill>/tools/makeCs.py <name>Admin.cs <name>Admin <parts>.py     # run in py3/bin
```

`tools/csParts.py` gives `cmndHead(name)`, `EXAMPLES_HEAD`, `desc(text)` (the generated classHead
blocks, in their exact form) and `DRIFT_HELPERS` (`_exists`, `_reportKvDrift`, `_reportTextDrift`,
`_reportUnitDrift`, `_reportLink`). `tools/exampleAdminParts.py` and `exampleQuickParts.py` are
prometheus's, to copy. The dblock bodies are what Blee would generate; a Blee dblock update later
refreshes them.

## 10. Install, verify read-only, materialize

```bash
# setup.py's scripts list is dblock-generated: until Blee regenerates it, list every
# bin/*.cs|.pcs|.spcs in generated form (see bisos-pip-setup-py)
/bisos/venv/py3/bisos3/bin/pip install --no-deps --no-build-isolation -e py3
cd /bisos/venv/py3/devbin && for f in <repo>/py3/bin/*; do ln -sfn "$f" "$(basename $f)"; done
```

`cbs_sbom` runs the sbom by bare name, so the devbin links are required. Then, without sudo:
each sbom's `-i readme` and `-i aptPkgs_list`, the bundle's `-i sbomSpecs_list`, the vhost's
`-i configFileStdout --cls=configFile_nginxVd`, `bash -n` of every generated script, every admin
Cmnd, and `cd py3/tests && bash -i ./verify.sh` (needs `lpDo`).

Materialize (needs sudo; ask unless the user granted it): `<name>-cbs.pcs -i cbs_materialize`.
Check: units active; `id <acct>` shows the banna numbers; `ss -ltn` shows loopback only; the
program's health endpoint; `curl http://<name>.here/...` 200 (poll: a first start can take 30 s+
and nginx returns 502 meanwhile); the integration works end to end; `<name>Admin.cs -i
driftCheck` agrees everywhere. Run `cbs_materialize` again: rc 0, nothing re-downloaded.

## 11. Document

- README.org sections: Overview; The BISOS <Name> Model (pattern, rawBisos stance, date
  materialized); [The Login]; What Gets Installed, and Where (table: what, where, owner);
  The 3 sboms; The systemd Unit(s); Listeners and Ports (banna names); Installation; Usage;
  Key Files; the standard BISOS/Blee/Support sections; Planned Improvements.
- The `_nodeBase_` panel: Overview + Entry points.
- AI-DevStatus.org and AI-WorkPlan.org of the new repo; banna's notes; an AI-Outputs entry for any
  framework finding.

Left for the user/Blee: dblock refresh (particulars, csInfo, setup.py, panel navigator), commits,
and planting the CBM leaf in `bro_rawBisos` (`sys/cbm/collective/hereWeb/<name>/`).

## Pitfalls already found

- **Runtime downloads.** Grafana fetches "preinstalled" plugins from grafana.com at every start,
  outside the sbom (`[plugins] preinstall_disabled = true`). Check every program for downloads,
  update checks and usage reporting at start, and turn them off in the generated config.
- **CLIs that want a desktop keychain.** gcx stores credentials in the OS keychain and refuses
  to fall back to a file (`GCX_KEYCHAIN=off` allows it). A BISOS host has no keychain service:
  run a usage tool's login once on the host, and carry the workaround in `<name>Info` (`gcxLogin`).
- **Login applied once.** Grafana applies `admin_password` only when it creates grafana.db.
  Changing the generator later does not change a live login.
- **750 config dirs.** When `/etc/<name>` is `root:<acct> 750` (it holds a password), the invoker
  cannot even `stat` the files: `Path.exists()` raises PermissionError. driftCheck uses `_exists`
  (falls back to `sudo test -e`); the sbom's tests use `sudo test`.
- **Planted files run at import.** A `.pcs` executes its seed when imported; to unit-test one of
  its functions, extract it with `ast` rather than importing the file.
- **Do not put `py3/` on PYTHONPATH**: its `bisos/__init__.py` shadows the bisos namespace.
- **Failures can look like success**: `g_csMain` exits 0 for a failed Cmnd, and
  `sbomSpecs_fullUpdate` carries on after a failed sub-sbom (both in AI-Outputs.org). Read the
  output of a materialization, not only its exit status.
- **Shared code is copied, not shared** (`tarballSetupScript`, the drift helpers): copy them
  verbatim so they stay identical until they move to a shared module (AI-Outputs.org).
