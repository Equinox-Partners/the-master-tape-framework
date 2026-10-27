---
id: system:architecture
type: system
title: The Master Tape Architecture
lifecycle_status: active
revision: 1
created_at: 2026-10-28
updated_at: 2026-10-28
authority:
  domain: system_rules
  level: canonical
confidence: confirmed
sensitivity: public
relationships: []
conflicts: []
sources: []
---

# Architecture

The Master Tape is a shared context system, not a chat archive, general file store, or task manager.

## Principles

1. Rule-driven context
2. Minimum sufficient context
3. One fact, one authority
4. Update before create
5. No save is valid
6. Evidence before confidence
7. Progressive structure
8. Human-readable and AI-operable
9. Explicit lifecycle
10. External task boundary

## Information types

- `project`: durable purpose, scope, constraints, and current state
- `decision`: an important choice and its rationale
- `research`: a question, evidence, analysis, and conclusion
- `knowledge`: reusable principles or methods
- `entity`: a persistent identity and durable attributes
- `source`: the location and reliability of external evidence
- `system`: rules governing The Master Tape itself

## Lifecycle

Documents are `active`, `contested`, or `archived`. Project execution uses a separate `operational_status`: `planned`, `active`, `paused`, `completed`, or `cancelled`.

## Writer capability

A Full Writer can complete all of these in one environment: inspect Git status, resolve context, verify revisions, run validation, selectively stage files, and commit. Other clients are Readers: they may read, analyze, and propose changes, but should not claim that canonical state was updated.

## Sensitivity boundary

Only `public` and `internal` content belongs in a Vault. Store confidential or restricted content elsewhere and reference only its safe location metadata.
