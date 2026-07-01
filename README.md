<div align="center">

# project-template

**A GitHub template repo that scaffolds every new project around a single "bible" source of truth — and keeps it in sync with your notes, docs, and issue tracker.**

[![last commit](https://img.shields.io/github/last-commit/gokhan-vc/project-template?style=flat-square)](https://github.com/gokhan-vc/project-template/commits)
[![stars](https://img.shields.io/github/stars/gokhan-vc/project-template?style=social)](https://github.com/gokhan-vc/project-template/stargazers)

![Markdown](https://img.shields.io/badge/Markdown-000000?style=flat-square&logo=markdown&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white)
![GitHub CLI](https://img.shields.io/badge/GitHub%20CLI-181717?style=flat-square&logo=github&logoColor=white)
![Obsidian](https://img.shields.io/badge/Obsidian-7C3AED?style=flat-square&logo=obsidian&logoColor=white)

</div>

---

## What it is

`project-template` is a **GitHub repository template**. Create a new repo from it and you get a ready-made "house blueprint": a numbered `bible/` folder that is the **single source of truth** for the project, plus agent operating guides and a one-command mirror that pushes the bible out to your knowledge base, docs hub, and issue tracker.

The core idea: **facts live in one place — the repo `bible/` — and everything else *derives* from it.** No more three copies of the same decision drifting apart across your notes app, your wiki, and your tracker.

It's for anyone who starts a lot of projects and wants each one to begin identical, documentation-first, and wired for sync from commit zero.

## Highlights

- **Bible as source of truth** — a numbered doc set (`00-vision` → `06-integrations-and-sync`) plus Architecture Decision Records (`decisions/`) and an append-only `sync-log.md`. One folder, one truth; if two places disagree, the bible wins.
- **Agent-ready out of the box** — ships with `AGENTS.md` (canonical operating guide) and `CLAUDE.md` (a thin Claude Code delta), so coding agents know the conventions, the sync runbook, and the hard rules before they touch anything.
- **One-command sync** — `scripts/sync-to-obsidian.sh` does a deterministic, one-way filesystem mirror of `bible/` into a per-project notes folder. It auto-derives the project name from the repo directory, so it runs unedited on any project cloned from the template. External hubs (docs / issue tracker) are updated by agent tooling, not the shell.
- **Placeholder-driven setup** — find-and-replace `{{PROJECT}}` and `{{PREFIX}}`, fill in the vision doc, and you're off. Light YAML frontmatter on each doc makes them first-class the moment they land in a Markdown knowledge base.
- **Safe by convention** — a `reference/` folder holds lineage and early ideas as **read-only** context that must never be integrated without explicit approval, and `AGENTS.md` encodes non-negotiable rules (secrets hygiene, no agent-executed financial actions, publication discipline, safety-first).
- **Zero build, zero dependencies** — pure Markdown and a single Bash script. Nothing to install, nothing to compile.

## Repository layout

```text
project-template/
├── README.md                  entry point (this file)
├── AGENTS.md                  canonical agent + human operating guide
├── CLAUDE.md                  Claude Code delta (points back to AGENTS.md)
├── bible/                     ← source of truth
│   ├── _index.md              map + reading order
│   ├── 00-vision.md … 06-integrations-and-sync.md
│   ├── decisions/             Architecture Decision Records (+ _template.md)
│   └── sync-log.md            append-only record of sync runs
├── reference/                 lineage / early ideas — READ-ONLY
└── scripts/
    └── sync-to-obsidian.sh    filesystem half of the sync command
```

## Quick start

Create a new private repo from the template and clone it:

```bash
gh repo create <owner>/<project> --private --template gokhan-vc/project-template
gh repo clone <owner>/<project>
cd <project>
```

Then make it yours:

1. **Find-replace the placeholders** — `{{PROJECT}}` → your project name (kebab-case), `{{PREFIX}}` → a 2–4 letter doc prefix, across the repo.
2. **Fill `bible/00-vision.md` first** — the north star; replace placeholder text in the other numbered docs as you go.
3. **Wire the mirrors** — follow `bible/06-integrations-and-sync.md` to point the project at your notes folder, docs hub, and issue tracker.

### Running the sync

```bash
# preview what would change (no writes)
bash scripts/sync-to-obsidian.sh --dry-run

# mirror bible/ → the project's notes folder
bash scripts/sync-to-obsidian.sh
```

The script mirrors `bible/` into `<notes-root>/projects/<project>/bible/`. Override the destination with the `PROJECT_OBSIDIAN_DIR` environment variable. It uses `rsync` when available (falling back to `cp -R`) and **never deletes** files that exist only in the mirror, so local-only notes on the receiving side are preserved.

## Stack

| Layer            | Tool                        | Role                                                        |
| ---------------- | --------------------------- | ---------------------------------------------------------- |
| Content          | Markdown + YAML frontmatter | The bible docs, ADRs, and agent guides                     |
| Sync (files)     | Bash + `rsync` (`cp -R` fallback) | Deterministic one-way mirror of `bible/`             |
| Repo scaffolding | GitHub CLI (`gh`)           | Create projects from this template                         |
| Sync (external)  | Agent tooling / MCP         | Update the docs hub and issue tracker from the bible       |

There are **no package dependencies** — nothing to `npm install` or `pip install`. The only runtime requirements are a POSIX shell and, ideally, `rsync`.

## The one rule

**The repo `bible/` wins.** If a fact lives in two places and they disagree, the bible is right — fix the mirror, never the bible by hand. See [`bible/_index.md`](./bible/_index.md).

## Security & conventions

This is a documentation scaffold with no runtime, network surface, or secrets of its own. The `.gitignore` is pre-configured to keep credentials (`.env*`, `*.key`, `*.pem`, `secrets/`) out of version control, and `AGENTS.md` codifies the operating rules every project inherits:

- **Secrets hygiene** — never commit or echo API keys, tokens, or wallet keys; keep them in local, permission-restricted stores.
- **No agent-executed financial actions** — anything that moves value stays a human decision.
- **Publication discipline** — sensitive material is private by default; confirm before any public deploy.
- **Safety first** — where a project touches user content, safety is a P0 concern and is never designed away.

There is no `SECURITY.md` in this template. Projects created from it should add their own once they have a runtime and a disclosure contact.

## Credits & third-party

Built on open tools and formats, used per their own terms:

- **[Markdown](https://daringfireball.net/projects/markdown/)** — the content format for the entire bible.
- **[rsync](https://rsync.samba.org/)** (GPL-3.0) — the mirroring engine behind the sync script.
- **[GitHub CLI](https://github.com/cli/cli)** (`gh`, MIT) — used to spin new repos from this template.
- **[Obsidian](https://obsidian.md/)** — the default Markdown knowledge base the file mirror targets (any Markdown vault works).
- **[Architecture Decision Records](https://adr.github.io/)** — the `decisions/` folder follows the widely used ADR pattern (Michael Nygard's original format).
- **[Model Context Protocol](https://modelcontextprotocol.io/)** — the interface through which agent tooling updates external hubs.

The convention of a numbered, agent-readable "bible" as the single source of truth, and the `AGENTS.md` operating-guide pattern, are homegrown but draw on the broader "docs-as-code" and agent-instructions-in-repo movements.

## License

This project is licensed under the **MIT License** — remix freely with attribution. See [LICENSE](./LICENSE).


**TBD.** No license file is currently included — usage terms are at the discretion of the repository owner. A project created from this template should add its own `LICENSE`.

---

<div align="center">
<sub>A gokhan-vc house blueprint. Copy it, fill it in, keep it in sync.</sub>
</div>
