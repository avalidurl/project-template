---
type: index
status: template
created: 2026-06-08
updated: 2026-06-08
domain: TODO
tags: [{{PROJECT}}, source-of-truth]
---

# {{PROJECT}} Bible

The **single source of truth** for {{PROJECT}}. Code, Notion, Linear, and the Obsidian mirror all derive from here. If a fact lives in two places and they disagree, **this folder wins**.

> Status: **template — fill me in.** Part number **{{PREFIX}}-00**. No contract deployed, no value at stake.

## Governing sentence (working)

> *(One sentence that captures the whole project. Replace me.)*

## Reading order

1. [00-vision](./00-vision.md) — north star; what it is and is not; lineage
2. [01-glossary](./01-glossary.md) — canonical terms
3. [02-domain-model](./02-domain-model.md) — entities, relationships, schemas
4. [03-architecture](./03-architecture.md) — stack, surfaces, where it sits
5. [04-roadmap](./04-roadmap.md) — milestones
6. [05-open-questions](./05-open-questions.md) — live questions (#1 = the biggest unresolved fork)
7. [06-integrations-and-sync](./06-integrations-and-sync.md) — Obsidian / Notion / Linear sync spec + the `sync` runbook
8. [decisions/](./decisions/) — ADRs (the decision log)

## How this bible is maintained

- Every material decision becomes an ADR in `decisions/` (copy `decisions/_template.md`).
- `04-roadmap` and `05-open-questions` are living — update them as reality changes.
- On `sync`, this folder is mirrored to Obsidian, Notion, and Linear (see 06).
