---
id: project:example
type: project
title: Example Project
lifecycle_status: active
operational_status: active
revision: 1
created_at: 2026-10-28
updated_at: 2026-10-28
authority:
  domain: project_governance
  level: canonical
confidence: confirmed
sensitivity: public
active_decisions:
  - decision:example:canonical-memory
relationships:
  - type: relates_to
    target: knowledge:minimum-sufficient-context
conflicts: []
sources: []
---

# Example Project

## Purpose

Demonstrate a minimal working Master Tape without private data.

## Success State

An AI can resolve this project by title, load its active decision, and explain the current direction without scanning the repository.

## Current State

The example is active and uses Git-versioned Markdown as canonical memory.

## Constraints

- Do not store task status or credentials here.
- Keep the example generic.

## AI Instructions

- Treat Current State as canonical for this example.
- Resolve every active decision before changing direction.
