# AGENTS.md

Instructions for AI coding agents working in this repository.

## Purpose

This repository contains the LaTeX/Overleaf source for the Hauptseminar topics catalog
for BSc Ingenieur-Informatik at THM.

Primary goals:
- keep the catalog easy to maintain across semesters
- preserve the registry/status workflow for topics
- keep student-facing content clear, consistent, and in German
- make semester rollovers low-risk and low-effort

## Source of truth

Before making changes, read these files in this order:
1. `README.md`
2. `docs/`
3. `tex/catalog_settings.tex`
4. relevant `tex/registries/*.tex`
5. relevant files under `tex/topics/`

## Repository-specific rules

- Keep all student-facing texts, topic descriptions, and documentation intended for seminar use in German.
- Keep file names, identifiers, and LaTeX macro names stable unless there is a strong reason to rename them.
- Keep the committed default view in `tex/catalog_settings.tex` on student view unless the user explicitly asks to change the default.
- Change semester/version settings only in `tex/catalog_settings.tex`; do not hardcode semester strings in multiple files.
- Control topic visibility only through `tex/registries/*.tex` using status values such as `active`, `hidden`, `used`, or `draft`.
- Do not delete old topic files just to hide them; preserve content and change registry status instead.
- When adding a new topic, start from `tex/topics/_templates/topic_template.tex` if available.
- When adding or restructuring workflows, update both `README.md` and the relevant file(s) in `docs/`.
- Prefer minimal diffs and preserve existing structure and conventions.

## Expected workflows

### Add a new topic
- create the topic file in the correct subtree under `tex/topics/`
- fill metadata completely and keep the text concise and student-friendly
- add exactly one registry entry in the matching file under `tex/registries/`
- use `draft` until the topic is ready for release, then switch to `active`

### Hide or retire a topic
- do not delete the topic text
- change only the registry status unless the user explicitly asks for archival cleanup

### Semester rollover
- update `tex/catalog_settings.tex`
- review registries for `used` / `hidden` / `active`
- update `README.md` and `docs/` if the workflow changed

## Verification

Prefer the build/test commands documented in `README.md`.
The repository-local `.codex/config.toml` is an example/reference config for Codex CLI; do not assume
it is auto-loaded. For the observed Codex CLI 0.118.0 behavior, active config is loaded from
`~/.codex/config.toml`, with command-line overrides such as `-m`, `-s`, `-a`, and `-c`.

If no better project-specific command is documented, use:
- `latexmk -lualatex -outdir=build -interaction=nonstopmode -halt-on-error main.tex`
- `git diff --stat`
- `git status --short`

If you changed LaTeX structure, registries, or macros, verify by building before finishing.

## Safety and scope

- Do not commit generated PDFs, auxiliary LaTeX build artifacts, or temporary files unless explicitly requested.
- Do not rewrite large parts of the catalog when a local fix is sufficient.
- Do not remove or overwrite user changes you did not make.
- If the repository is dirty, work around unrelated changes instead of reverting them.

## Final response expectations

At the end of a task, report:
- which files changed
- what was verified
- any remaining risks or follow-up items

### Commit policy (required)
- Make progress via **frequent, small commits**.
- Each commit must be:
  - **Buildable** (the documented LaTeX build passes, unless the local TeX toolchain is unavailable),
  - **Focused** (one logical change),
  - **Documented** (clear message + brief rationale in body if non-obvious).
- When a change touches public behavior, settings, or architecture, update docs **in the same commit**.
- Push meaningful, review-ready commits automatically to the current branch's remote unless the user asks not to,
  no remote is configured, or pushing would require rewriting remote history.

**Commit message format**
- `area: short summary`
  - Examples: `docs: update semester workflow`, `topics: add mqtt topic draft`, `registries: mark assigned topics used`.

### End-of-run output (required)
- End every Codex run with a compact review packet that can be reviewed in chat or pasted into a PR.
- Do not wait for the user to request it explicitly; every run must include this packet by default.
- If a user prompt requests a different review format for that run, follow the user prompt.
- Use this exact structure:

```text
RUN REVIEW
Branch: <branch-name>
Remote push: <yes/no>
Compare/PR URL: <url-or-n/a>

Scope summary:

* <1 sentence>

Commits:

1. <sha> <subject>
2. <sha> <subject>

Files changed:

* <path>  <short purpose>
* <path>  <short purpose>

Checks run:

* <command>  <pass/fail/not run>
* <command>  <pass/fail/not run>

Behavior impact:

* <none / describe>

Risks / review focus:

* <item 1>
* <item 2>

Manual follow-up:

* <item or "none">

Open questions:

* <item or "none">
```
