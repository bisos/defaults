---
name: readme-authorship
description: Use when writing or updating a bisos-pip package's `README.org` (repo root, human-oriented) or `py3/README.rst` (PyPI, converted form). Covers the standard section structure for command-only PyCS packages and the org→RST conversion conventions so both stay in sync.
---

# README.org Authorship and Conversion to README.rst

Every bisos-pip repo has two README files:

- **`README.org`** — the *source*, authored in org-mode, at the repo root.
  Human-oriented. Claude authors and maintains this file.
- **`py3/README.rst`** — the *converted* form, under `py3/`. This is what
  PyPI displays on the package page. Derived from `README.org`.

**`README.org` is authoritative.** When both need updating, edit `README.org`
first, then regenerate or manually sync `README.rst`.

## Standard section structure

For a **command-only PyCS package** (no RO/service/daemon layer), the
canonical `README.org` skeleton is:

1. **Header** — `#+title`, `#+DATE`, `#+AUTHOR`, `#+OPTIONS: toc:4`
2. **Top Controls dblock** — `#+BEGIN: b:org:pypi:readme/topControls` with
   `:pkgName "<pkgname>" :comment "basic"`
3. **Overview** — one paragraph: what the package does, in the developer's
   voice
4. **TOC** — `* Table of Contents     :TOC:` (org-mode auto-generates)
5. **Part of BISOS — ByStar Internet Services Operating System** — standard
   BISOS/ByStar boilerplate linking to the ecosystem (see below)
6. **`<package> is a Command-Only PyCS Facility`** — explains the package
   is a CLI tool via PyCS-Framework, links to `bisos.b`
7. **Post-Installation Setup** — user-config initialization if applicable
   (`userConfig_set --parName=... --parValue=...`)
8. **Installation** — subsections for pip and pipx; list the commands the
   package installs
9. **Usage** — one subsection per major operation. Each shows the CLI
   invocation as a `#+begin_src bash` block
10. **Key Files** — the `py3/bin/` and `py3/bisos/<pkg>/` files that matter,
    with one paragraph each
11. **Documentation and Blee-Panels** — points at
    `py3/panels/<pkg>/_nodeBase_/fullUsagePanel-en.org`
12. **Support** — standard Mohsen Banan contact block
13. **Planned Improvements** — org TODO items for open work

**Do NOT include** RO, performer, daemon, service, or worker sections in
command-only packages.

## Standard boilerplate: "Part of BISOS"

Use this text verbatim (adjust the package name in the last paragraph):

```org
* Part of BISOS — ByStar Internet Services Operating System

Layered on top of Debian, *BISOS* (By* Internet Services Operating System)
is a unified and universal framework for developing both internet services and
software-service continuums that use internet services. See
[[https://github.com/bxGenesis/start][Bootstrapping ByStar, BISOS and Blee]]
for information about getting started with BISOS.

*BISOS* is a foundation for *The Libre-Halaal ByStar Digital Ecosystem* which
is described as a cure for losses of autonomy and privacy in a book titled:
[[https://github.com/bxplpc/120033][Nature of Polyexistentials]]

/bisos.<pkgname>/ is part of BISOS. It is a standalone package that can
be used independently of the full BISOS environment.
```

## Standard boilerplate: "Command-Only PyCS Facility"

Use this section wording, adjusting the "uses the PyCS-Framework to" list
to match the actual package:

```org
* bisos.<pkgname> is a Command-Only PyCS Facility

bisos.<pkgname> is a command-line tool. It is a PyCS single-unit
command service. PyCS is a framework that converges development of CLI tools
and services. PyCS is an alternative to FastAPI, Typer and Click.

bisos.<pkgname> uses the PyCS-Framework to:

1) <what it does — one line>
2) <what it does — one line>
3) <what it does — one line>

The core of PyCS-Framework is the /bisos.b/ package (the PyCS-Foundation).
See [[https://github.com/bisos-pip/b][bisos.b]] for an overview.
```

## Standard boilerplate: "Support"

```org
* Support

For support, criticism, comments and questions; please contact the
author/maintainer\\
[[http://mohsen.1.banan.byname.net][Mohsen Banan]] at:
[[http://mohsen.1.banan.byname.net/contact]]
```

## Conversion from `README.org` to `README.rst`

Conversion is via pandoc or ox-rst from Emacs. **CI does not automate this.**
Regenerate manually after editing `README.org`:

- **From Emacs**: open `README.org`, `M-x org-rst-export-to-rst`, then move
  the output to `py3/README.rst`.
- **From shell**: `pandoc -f org -t rst README.org -o py3/README.rst`

When writing `README.rst` **directly** (without running pandoc/ox-rst),
follow the conventions the converters produce so a later regeneration
doesn't churn the file:

| org-mode                          | RST                                              |
|-----------------------------------|--------------------------------------------------|
| `* Section`                       | `Section` + `======` underline                   |
| `** Subsection`                   | `Subsection` + `------` underline                |
| `#+begin_src bash ... #+end_src`  | `.. code:: bash` + 3-space-indented content      |
| `=code=` (org verbatim)           | `` ``code`` `` (RST literal — double backticks) |
| `[[url][label]]`                  | `` `label <url>`__ `` (anonymous ref, 2 `_`s)   |
| `- item`                          | `- item` (single dash)                           |
| `1. item`                         | `#. item` (auto-numbered)                        |
| `\\` (org linebreak)              | `| line` (RST line block)                        |

Keep the RST closely parallel to the org source — same section order, same
bullets, same code examples. Cosmetic reformatting during conversion makes
future syncs painful.

## Table of Contents

`README.org` uses the `:TOC:` tag on the Table of Contents heading. The
`toc-org` package regenerates the TOC on save. If you add or reorder
sections, the TOC updates automatically — but only in Emacs. If editing
outside Emacs, either regenerate manually or note that the TOC will refresh
next time the file is opened in Emacs.

## Common pitfalls

- **Don't include RST-only content that has no org source.** Every section
  of `README.rst` should exist in `README.org` — the RST is derivative, not
  primary.
- **Don't hand-write PyPI badges into `README.org`.** The top-controls
  dblock handles PyPI and Github links.
- **PyPI RST rendering is strict.** Broken RST (mismatched indentation, bad
  reference syntax) shows as a plain-text README on PyPI. Test the conversion
  by uploading to Test-PyPI first (see the `bisos-pip-release` skill).
- **`py3/README.rst` is what `setup.py` reads for `long_description`.** If
  it's missing or malformed, the PyPI upload will fail or the package page
  will be empty.

## What NOT to do

- Do NOT edit `py3/README.rst` and forget to sync back to `README.org`.
  Always start from `README.org`.
- Do NOT include emojis or decorative unicode in `README.org` unless the
  developer explicitly requested it.
- Do NOT add RO / service / daemon sections to a command-only package's
  README.
- Do NOT link to internal `/bisos/panels/...` paths in the README — those
  are BISOS-internal and won't render for users reading on GitHub or PyPI.
  Link to public URLs and to `./py3/panels/...` (relative) instead.

## References

- Live example in this repo: `README.org` at the repo root and
  `py3/README.rst`
- Standard sections come from: `/bisos/git/bxRepos/bisos-pip/_github/profile/readme.org`
- For panel authorship (separate concern): see the `blee-panel-authorship` skill
