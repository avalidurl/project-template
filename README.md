# project-template

A scaffold for new **gokhan-vc** projects. It encodes the house "bible" working flow so every project starts identical and stays in sync across **repo ↔ Obsidian ↔ Notion ↔ Linear**. Reference implementations: `gokhan-vc/numetal`, `gokhan-vc/matchmaker`.

## Use it
```bash
gh repo create gokhan-vc/<project> --private --template gokhan-vc/project-template
gh repo clone gokhan-vc/<project> ~/GitHub/gokhan-vc/<project>
cd ~/GitHub/gokhan-vc/<project>
```
Then, in a Claude Code chat opened in the repo (`claude`):
1. Find-replace `{{PROJECT}}` → your project name (kebab-case) and `{{PREFIX}}` → a 2–4 letter doc prefix across the repo.
2. Fill `bible/00-vision.md` first; replace placeholder text as you go.
3. Create the Obsidian mirror folder, the Notion hub, and the Linear project (see `bible/06-integrations-and-sync.md`), then say **`sync`**.

## What's inside
- **`bible/`** — the single source of truth (numbered docs + `decisions/` ADRs + `sync-log.md`). Notion, Linear, and the Obsidian mirror all *derive* from here.
- **`AGENTS.md`** — canonical agent/human guide. **`CLAUDE.md`** — Claude Code delta only.
- **`reference/`** — read-only lineage / early ideas (never integrated without explicit approval).
- **`scripts/sync-to-obsidian.sh`** — filesystem half of the `sync` command (project name auto-derived from the repo dir).

## The rule
The **repo `bible/` wins.** If a fact lives in two places and they disagree, the bible is right — fix the mirror, never the bible by hand. See `bible/_index.md`.
