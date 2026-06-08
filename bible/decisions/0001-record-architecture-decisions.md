---
type: adr
status: accepted
created: 2026-06-08
updated: 2026-06-08
tags: [{{PROJECT}}, adr]
---

# ADR 0001 · Record architecture decisions

## Status
Accepted

## Context
We need a durable, low-friction record of *why* the project is built the way it is — so future sessions (human or agent) don't silently re-litigate or contradict settled choices.

## Decision
We record every material decision as an **Architecture Decision Record (ADR)** in `bible/decisions/`, numbered sequentially (`NNNN-title.md`), using `_template.md`. An ADR is immutable once accepted; to change a decision, write a new ADR that supersedes it (and link both ways).

## Consequences
- The bible's prose stays current; the *history* of decisions lives in the ADR log.
- Reviewers can see the reasoning, not just the outcome.
- Agents are instructed (in `AGENTS.md`) never to contradict an accepted ADR without writing a superseding one.
