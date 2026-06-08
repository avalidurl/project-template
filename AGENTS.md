# AGENTS

Canonical operating guide for the **{{PROJECT}}** repo. Read this before substantial work. `CLAUDE.md` and any other agent file are deltas on top of this one — keep shared rules here and let the others point back.

## What this is

{{PROJECT}} is … *(one paragraph: what it is, and what it is NOT)*. The full vision and scope live in [`bible/`](./bible/) — `bible/` is the **source of truth**; this file is only how to work in the repo.

## Map

```text
{{PROJECT}}/
  README.md                 entry point
  AGENTS.md                 this file — canonical agent guide
  CLAUDE.md                 Claude Code delta
  bible/                    source of truth (numbered docs)
    _index.md               map + reading order
    00-vision.md … 06-integrations-and-sync.md
    decisions/              ADRs (architecture decision records)
    sync-log.md             append-only record of `sync` runs
  reference/                lineage / early ideas — READ-ONLY (do not integrate without asking)
  scripts/
    sync-to-obsidian.sh     filesystem half of `sync`
```

## Before work

1. Read `bible/_index.md` and the doc closest to your task.
2. If you change a decision, add or update an ADR in `bible/decisions/` (copy `_template.md`) — do not silently contradict an existing one.
3. Prefer editing the strongest existing bible doc over adding a thin new file.
4. Skim `reference/` once for lineage context, but **never integrate anything from it without explicit human approval.**

## Conventions

- Markdown, lowercase kebab-case filenames, numbered docs (`NN-topic.md`).
- Light frontmatter on bible docs (`type/status/created/updated/domain/tags`) so they are first-class when mirrored into Obsidian.
- Use wiki-links `[[...]]` for vault-resident concepts; relative links for in-repo files.
- Bias toward fewer strong, interconnected docs over many thin ones. Preserve nuance; if a new fact weakens an old claim, revise the synthesis.
- Safety / minor-safety / sanctions is **P0** wherever the product touches user content — never design it away.

## The `sync` command

When the user says **`sync`**, run the runbook in [`bible/06-integrations-and-sync.md`](./bible/06-integrations-and-sync.md):

1. `bash scripts/sync-to-obsidian.sh` — mirror `bible/` → the Obsidian project folder (deterministic, filesystem).
2. Append a session note to the Obsidian `sessions/` folder.
3. Update the **Notion** hub (append to its log; update the body if the bible changed materially).
4. Update **Linear** (create/refresh issues from `04-roadmap.md` + `05-open-questions.md`).
5. Append a line to `bible/sync-log.md` and the Obsidian `sync-log.md`.

Notion + Linear steps run via MCP tools (not shell). The script only does the filesystem mirror.

## Hard rules (non-negotiable)

- **Secrets/identifiers hygiene:** never echo API keys, tokens, account/gateway IDs, or wallet addresses in chat or files — refer indirectly; values go to chmod-600 stores (`~/.config/agent-secrets/<provider>/.env`); verify masked only. (Public token CAs are fine.)
- **No agent-executed financial actions** — trades/transfers/swaps/burns/claims/wallet sign-submit stay the founder's.
- **Publication discipline** — unlaunched-token / sensitive material is private-by-default; surface + confirm before any public or legal-sensitive deploy.
- **No self-modification of access controls/permissions** — guide the user; don't change sharing/roles directly.
- **Paid-tool discipline** — default to free WebSearch/WebFetch; paid tools only on explicit OK.
- **Mentorship mode** — real adversarial pushback, not sycophancy.

## Git

- Branch before committing non-trivial work; do not push unless asked.
- Conventional, present-tense commit subjects.
