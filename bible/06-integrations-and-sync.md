---
type: doc
status: template
created: 2026-06-08
updated: 2026-06-08
domain: TODO
tags: [{{PROJECT}}, integrations, sync]
---

# 06 · Integrations & sync

The bible is the source of truth. Three surfaces **derive** from it; `sync` pushes one → the other three.

## Targets

| Target | Location | Role |
|---|---|---|
| **Obsidian** | `~/Obsidian/zettelkasten/projects/{{PROJECT}}/` (`_index`, `bible/`, `sessions/`, `sync-log`) | human-readable mirror |
| **Notion** | "{{PROJECT}}" hub page | shareable / collaborative surface |
| **Linear** | "{{PROJECT}}" project, team **Gokhan** | executable to-do (from 04 + 05) |

> Fill the exact Notion page URL + Linear project URL here after you create them, so future `sync` runs are deterministic.

## The `sync` runbook

Triggered when the user says **`sync`** in this repo's chat:

1. **Filesystem mirror** — `bash scripts/sync-to-obsidian.sh` (project name auto-derived from the repo dir). One-way, never `--delete`; the vault may hold extra local notes.
2. **Session note** — append a dated note to the Obsidian `sessions/` folder (what changed, decisions, next).
3. **Notion** — append to the hub's log; update the body only if the bible changed materially. Via the Notion MCP.
4. **Linear** — create/refresh issues from `04-roadmap.md` + `05-open-questions.md`. Via the Linear MCP.
5. **Log** — append one line to `bible/sync-log.md` and the Obsidian `sync-log.md`.

Steps 3–4 use MCP tools, not the shell. Step 1 is the only filesystem action.

## Conventions when writing the Obsidian mirror
Respect the vault's own `AGENTS.md`: frontmatter, kebab-case, `_index.md` as the folder MOC, wiki-links for vault concepts.
