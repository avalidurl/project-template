# CLAUDE

`AGENTS.md` is the **canonical** repo guide — read it first. Everything below is the Claude-Code-specific delta only.

- The **source of truth** is `bible/`. When the user calls this repo's knowledge "the bible," they mean that folder.
- `reference/` = read-only lineage / early ideas: skim once for context, **never integrate without asking**; `bible/` supersedes it.
- When the user says **`sync`**, execute the runbook in `bible/06-integrations-and-sync.md` end to end (filesystem mirror via `scripts/sync-to-obsidian.sh`; Notion + Linear via MCP tools; session note + `sync-log.md` append).
- Targets (don't hardcode elsewhere; they live in `bible/06-integrations-and-sync.md`):
  - Obsidian: `~/Obsidian/zettelkasten/projects/{{PROJECT}}/`
  - Linear team: **Gokhan**
  - Notion: **{{PROJECT}}** hub page
- Respect the vault's own `AGENTS.md` when writing into `~/Obsidian/zettelkasten` (frontmatter, kebab-case, `_index.md`, wiki-links).
- Hard rules live in `AGENTS.md` — follow them (secrets hygiene; no agent financial actions; publication discipline; safety P0).
