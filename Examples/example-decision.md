---
id: decision:example:canonical-memory
type: decision
title: Use Git-versioned files as canonical memory
lifecycle_status: active
revision: 1
created_at: 2026-10-28
updated_at: 2026-10-28
authority:
  domain: project_governance
  level: canonical
confidence: confirmed
sensitivity: public
relationships:
  - type: applies_to
    target: project:example
conflicts: []
sources: []
---

# Use Git-versioned files as canonical memory

## Decision

Use plain Markdown and YAML tracked by Git as the durable context layer.

## Rationale

The format remains inspectable, portable, reviewable, and independent of any single AI vendor.

## Consequences

Writers must validate changes and manage revisions. Readers can operate without a database or proprietary API.
