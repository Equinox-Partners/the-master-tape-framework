# The Master Tape

**A file-based canonical memory system for humans and AI agents.**

The Master Tape helps multiple AI tools find the right context without rereading your entire workspace or trusting stale chat history. It stores durable knowledge as small Markdown documents, resolves them through a registry, and validates the structure before changes are committed.

> One fact. One authority. Minimum sufficient context.

## Why it exists

AI assistants are useful inside a conversation, but long-running work breaks when context is scattered across chats, documents, and tools. The Master Tape provides a vendor-neutral memory layer that is:

- readable by humans and any AI that can open files;
- explicit about authority, confidence, lifecycle, and sensitivity;
- deterministic about which context to load;
- protected by schema and relationship validation;
- versioned with Git instead of hidden inside a proprietary memory store.

## How it works

```text
User request
    ↓
Exact target resolution through REGISTRY.yaml
    ↓
Load only required canonical documents
    ↓
Work / answer / decide
    ↓
NO_SAVE | UPDATE | CREATE | DEFER
    ↓
Validate → selectively commit
```

The framework uses seven information types: `project`, `decision`, `research`, `knowledge`, `entity`, `source`, and `system`. Tasks and rapidly changing execution state stay in the task system you already use.

## Quick start

Requirements: Git and Ruby 2.6 or newer. No gems are required.

The easiest path is to click **Use this template** on GitHub, create a private repository for your own memory, and open the cloned folder in Codex or Claude Code.

```bash
git clone https://github.com/Equinox-Partners/the-master-tape-framework.git
cd the-master-tape-framework
ruby scripts/validate.rb
ruby scripts/resolve_context.rb "Example Project"
```

Expected result:

```text
PASS: 5 documents, 5 registry entries
```

Then:

1. Copy a file from `Templates/`.
2. Give it a stable ID and add it to `System/REGISTRY.yaml`.
3. Point your AI tool to `AGENTS.md` or `System/AI_ENTRY_POINT.md`.
4. Run `ruby scripts/validate.rb` before committing.

For a real workspace, keep the generated repository private unless every stored document is safe to publish.

## Repository map

```text
System/       Rules, registry, and schema
Templates/    Reusable information-unit templates
Examples/     A small working example
scripts/      Dependency-free resolver and validator
AGENTS.md     Drop-in instructions for coding agents
```

## What makes it different

| Common approach | The Master Tape |
|---|---|
| Search everything | Resolve the target first |
| Treat every note equally | Record authority and confidence |
| Copy current task state into memory | Keep volatile execution state external |
| Let chat history become truth | Prefer current canonical files |
| Add automation for every edge case | Add structure only after observed need |

## Use with AI tools

The framework is intentionally vendor-neutral. Any agent that can read files can use it as a Reader. An agent is a Full Writer only when it can inspect Git status, resolve context, verify revisions, run validation, stage only its own files, and commit the result.

See [System/AI_ENTRY_POINT.md](System/AI_ENTRY_POINT.md) for the complete operating contract.

## Status

This public repository is an early framework release extracted from a working personal system. The architecture is usable now; feedback from different tools and workflows is especially valuable.

## Contributing

Issues and pull requests are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md). Please do not include private workspace content in bug reports or fixtures.

## License

MIT © 2026 nightwalker. See [LICENSE](LICENSE).

Japanese documentation: [README.ja.md](README.ja.md)
