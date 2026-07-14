---
name: bisos-pip-release
description: Use when preparing a bisos-pip package for release to PyPI — bumping the version, running the release-time linters (pyflakes, flake8, pylint, pycodestyle, mypy), regenerating `py3/README.rst` from `README.org`, building the sdist/wheel, and uploading via `pypiProc.sh`. Also covers the pipx install verification step and the Test-PyPI trial-upload workflow.
---

# bisos-pip Release Preparation

Each bisos-pip repo follows the same packaging structure and release
workflow driven by `py3/setup.py` and `py3/pypiProc.sh`. This skill covers
the end-to-end release checklist for a command-only PyCS package.

## Prerequisites

- `~/.pypirc` configured with credentials for both PyPI and Test-PyPI
- The repo's `AI-WorkPlan.org` and `AI-DevStatus.org` are up to date and
  reflect a stable release candidate
- All commits merged to the working branch; `git status` is clean

## Release-time linters

Linting is done **at release time**, not continuously. The linters live in
`/bisos/pipx/bin/`:

| Linter          | Purpose                                            |
|-----------------|----------------------------------------------------|
| `pyflakes`      | Undefined names, unused imports, obvious errors   |
| `flake8`        | Style + pyflakes + complexity                     |
| `pycodestyle`   | PEP 8 style                                       |
| `pylint`        | Deeper static analysis                            |
| `mypy`          | Type checking (uses `.mypy_cache/` for py3.11)   |

Run each against the package's Python source:

```bash
cd py3
/bisos/pipx/bin/pyflakes bisos/<pkgname>/ bin/*.cs
/bisos/pipx/bin/flake8    bisos/<pkgname>/ bin/*.cs
/bisos/pipx/bin/pycodestyle bisos/<pkgname>/ bin/*.cs
/bisos/pipx/bin/pylint    bisos/<pkgname>/ bin/*.cs
/bisos/pipx/bin/mypy      bisos/<pkgname>/
```

Address findings before proceeding. In BISOS, we do NOT gate every commit
on lint-clean — but a PyPI release should be.

## Release checklist

**1. Update the version.** In `py3/setup.py`, bump the `version=` string.
Convention: `0.1`, `0.2`, ..., `1.0` — no patch versions unless a hotfix.
Also bump `csInfo['version']` inside the main `.cs` file (the value looks
like `'202507111200'` — set to current YYYYMMDDHHmm).

**2. Sync `py3/README.rst` from `README.org`.** The RST is what PyPI
displays. Regenerate via Emacs `org-rst-export-to-rst` or `pandoc -f org -t rst`.
See the `readme-authorship` skill for the conversion conventions.

**3. Regenerate Blee-Panel captured output.** If any `runResult` dblocks in
`py3/panels/<pkg>/_nodeBase_/fullUsagePanel-en.org` reference commands
whose behavior changed, open the panel in Blee and "Update Buf Dblocks".
See the `blee-panel-authorship` skill.

**4. Update `AI-DevStatus.org`.** Reflect the release-candidate state:
what works, what is untested, key design decisions since last release.

**5. Run linters.** Address findings. See the linter table above.

**6. Trial upload to Test-PyPI first.**

```bash
cd py3
./pypiProc.sh          # inspect the script — it drives sdist + wheel + upload
```

Or explicitly:

```bash
cd py3
rm -rf build dist *.egg-info
python3 setup.py sdist bdist_wheel
twine check dist/*                          # RST validation for PyPI display
twine upload --repository testpypi dist/*
```

Verify on Test-PyPI:

```bash
pipx install --index-url https://test.pypi.org/simple/ \
             --pip-args="--extra-index-url https://pypi.org/simple/" \
             bisos.<pkgname>
```

Run one or two of the package's commands to smoke-test. If the Test-PyPI
package works, proceed to real PyPI.

**7. Upload to PyPI.**

```bash
cd py3
twine upload dist/*
```

**8. Verify pipx install from real PyPI.**

```bash
pipx uninstall bisos.<pkgname>    # if a Test-PyPI copy is installed
pipx install bisos.<pkgname>
<pkgname>.cs -i examples          # or another quick smoke command
```

**9. Tag the release in git.**

```bash
git tag -a v<version> -m "Release <version>"
```

Suggest the developer push the tag — do NOT push it yourself. Per BISOS
convention, all `git push` operations are done by the developer.

**10. Update `AI-WorkPlan.org`.** Close out the release TODO, add any
follow-up items surfaced by the release.

## `pypiProc.sh` — the driver script

Every bisos-pip repo has `py3/pypiProc.sh`. It typically:

- Cleans previous `build/`, `dist/`, `*.egg-info/`
- Runs `python3 setup.py sdist bdist_wheel`
- Runs `twine check dist/*`
- Uploads via `twine upload`

Inspect the script before running — some variants have interactive prompts
or environment-variable switches for Test-PyPI vs. real PyPI.

## Common pitfalls

- **`README.rst` malformed** → PyPI page shows plain text. Run
  `twine check dist/*` before every upload; it validates RST.
- **`long_description` missing from `setup.py`** → PyPI page is empty. Ensure
  `setup.py` reads `py3/README.rst` into `long_description` and sets
  `long_description_content_type="text/x-rst"`.
- **Version not bumped** → `twine upload` fails with "file already exists".
  PyPI does not allow re-uploading an existing version.
- **Blee-panel captured output is stale** → users see wrong examples in
  Blee. Regenerate before releasing.
- **`bisos.b` dependency version too old** — if the release requires a
  feature added to `bisos.b` recently (e.g., `parPermanence="userConfig"`),
  pin the minimum version in `setup.py`'s `install_requires`. Do NOT
  release against an unreleased `bisos.b`.
- **`.cs` file not `chmod +x`** in the source tree — the sdist preserves
  permissions; fix before packaging.

## Post-release: fresh-Debian pipx test

For confidence that the package works outside BISOS, install on a fresh
Debian machine (or vagrant VM) via `pipx install bisos.<pkgname>` and run
the smoke commands. This is Stage 9 in the workflow — track it in
`AI-WorkPlan.org` rather than blocking the PyPI release on it.

## What NOT to do

- Do NOT skip the Test-PyPI trial upload for a first release or a major
  version bump. PyPI won't let you delete or re-upload a bad version.
- Do NOT `twine upload` without running `twine check dist/*` first.
- Do NOT edit `py3/README.rst` directly — always sync from `README.org`.
- Do NOT push the git tag on the developer's behalf — suggest they push.
- Do NOT release with failing linters. Fix the findings first; if a
  specific check is intentionally suppressed, document why in the source.

## References

- bisos-pip packaging machinery panel:
  `/bisos/panels/bisos-core/PyCsFwrk/bisos-pip-packaging/_nodeBase_/fullUsagePanel-en.org`
- Comprehensive bisos-pip README:
  `/bisos/git/bxRepos/bisos-pip/_github/profile/readme.org`
- Every bisos-pip repo's `py3/pypiProc.sh` and `py3/setup.py` — read the
  target repo's own driver before running
- Complementary skills: `readme-authorship`, `blee-panel-authorship`
