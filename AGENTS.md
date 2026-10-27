# Agent Instructions

The Master Tape is the canonical context layer in this repository.

1. Start with `git status --short`.
2. Read `System/AI_ENTRY_POINT.md` and `System/ARCHITECTURE.md`.
3. Do not scan the entire repository to guess context.
4. Resolve the target with `ruby scripts/resolve_context.rb --candidates "<selector>"`.
5. Read only the returned canonical documents needed for the task.
6. Before writing, choose `NO_SAVE`, `UPDATE`, `CREATE`, or `DEFER`.
7. For an update, confirm the revision has not changed, then increment it.
8. Run `ruby scripts/validate.rb`.
9. Stage only files changed for the current task.

Never store credentials, confidential data, task status, deadlines, or assignees in The Master Tape.
