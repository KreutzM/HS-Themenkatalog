Für die tägliche Arbeit mit Codex CLI würde ich dir diese **Prompt-Form** empfehlen:

```text
Read AGENTS.md, README.md, and the relevant files in docs/ first.

Work from the repository root.

Task:
[klare, konkrete Aufgabe]

Constraints:
- keep student-facing text in German
- prefer minimal diffs
- preserve the registry/status architecture
- do not delete old topics to hide them
- keep the committed default on student view unless explicitly asked otherwise

Verification:
- run the documented build command
- if none is documented, use latexmk on main.tex
- report changed files and verification result
```

Das ist nah an den offiziellen Prompting-Empfehlungen: auf End-to-End-Erledigung zielen, vernünftige Annahmen treffen, Verhalten bewahren, bestehende Konventionen respektieren, Änderungen verifizieren und nicht in Vorab-Plänen oder endlosen Rückfragen hängen bleiben. ([OpenAI Entwickler][5])

Drei gute konkrete Prompts für dein Repo wären:

```text
Read AGENTS.md, README.md, and docs/ first.
Audit the repository in read-only mode.
Check for broken \input references, semester strings hardcoded outside tex/catalog_settings.tex, registry inconsistencies, and mismatches between README/docs and the actual tree.
Do not modify files. Report findings first, ordered by severity.
```

```text
Read AGENTS.md, README.md, and docs/ first.
Add a new topic on [Thema] using the existing template and conventions.
Place it in the correct tex/topics subtree, register it once in the matching tex/registries file with status draft, and update docs only if the workflow needs clarification.
Verify the project still builds.
```

```text
Read AGENTS.md, README.md, and docs/ first.
Prepare the catalog for SoSe 2027.
Update only tex/catalog_settings.tex for semester/version values, review registry statuses, keep the committed default on student view, and synchronize any outdated maintenance notes in README.md and docs/.
Verify with a full LaTeX build.



```

[1]: https://help.openai.com/en/articles/11096431-openai-codex-ci-getting-started "CLI – Codex | OpenAI Developers"
[2]: https://developers.openai.com/codex/guides/agents-md "Custom instructions with AGENTS.md – Codex | OpenAI Developers"
[3]: https://platform.openai.com/docs/models "Models | OpenAI API"
[4]: https://platform.openai.com/docs/docs-mcp "Docs MCP | OpenAI Developers"
[5]: https://developers.openai.com/cookbook/examples/gpt-5/codex_prompting_guide "Codex Prompting Guide"
[6]: https://developers.openai.com/codex/agent-approvals-security "Agent approvals & security – Codex | OpenAI Developers"
