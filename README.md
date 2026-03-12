# Stack Kit

> One base, five stack overlays. Production-grade AI coding rules for any project.

Stack Kit gives every AI coding assistant (Claude Code, GitHub Copilot, Cursor, OpenClaw, Windsurf, and others) a shared understanding of your project's architecture, commands, and quality standards. Core rules are maintained once; each tech stack only overrides the differences.

## Why

AI assistants write better code when they know:
- **What** you're building (`docs/spec.md`)
- **Where** things live (`docs/architecture.md`)
- **How** to check their work (`docs/commands.md`)
- **What** decisions were made and why (`docs/decisions.md`)

Without this context, AI assistants hallucinate file paths, invent APIs, skip tests, and ignore your project's conventions. Stack Kit solves this by installing a structured `docs/` folder and tool-specific adapter files into your repository.

## Supported Stacks

| Profile | Use Case | Key Tools |
|---------|----------|-----------|
| `nextjs` | Full-stack web app (App Router) | Next.js, React, TypeScript, Vitest |
| `react` | Client-side SPA / dashboard | Vite, React, TypeScript, Vitest |
| `vue` | Vue 3 SPA | Vite, Vue 3, TypeScript, Vitest |
| `fastapi` | HTTP API / backend service | FastAPI, Pydantic, pytest, ruff, mypy |
| `python` | Library / CLI / worker / automation | pyproject.toml, src/ layout, pytest, ruff, mypy |

See [PROFILE_SELECTION.md](PROFILE_SELECTION.md) for detailed selection guidance.

## Quick Start

### Install into a project

```bash
bash scripts/install.sh <target-dir> <profile>
```

**Examples:**
```bash
bash scripts/install.sh ~/code/my-app nextjs
bash scripts/install.sh ~/code/my-api fastapi
bash scripts/install.sh ~/code/my-admin react
bash scripts/install.sh ~/code/my-vue-app vue
bash scripts/install.sh ~/code/my-tool python
```

### Options

```bash
bash scripts/install.sh ~/code/my-app nextjs --dry-run    # preview without writing
bash scripts/install.sh ~/code/my-app nextjs --force       # overwrite without prompt
bash scripts/install.sh ~/code/my-app nextjs --no-backup   # skip .bak files
```

### After installation

1. Fill `docs/spec.md` — describe your project's problem, users, and core flows.
2. Review `docs/commands.md` — adjust commands for your actual setup.
3. Review `docs/architecture.md` — customize the module layout.
4. Start planning in `docs/plan.md` — add your first milestone.

## What Gets Installed

```
your-repo/
├── AGENTS.md                        # AI workflow rules (map-first, verify-always)
├── CLAUDE.md                        # Claude-specific adapter
├── .cursor/rules/00-core.mdc        # Cursor rules
├── .github/
│   ├── copilot-instructions.md      # GitHub Copilot instructions
│   └── prompts/
│       ├── plan.prompt.md           # Task planning prompt
│       ├── implement.prompt.md      # Implementation prompt
│       └── review.prompt.md         # Code review prompt
└── docs/
    ├── spec.md                      # Product spec (fill this first)
    ├── architecture.md              # Module boundaries, data flow, testing strategy
    ├── plan.md                      # Current milestone, active work, next steps
    ├── decisions.md                 # Architecture decision records
    ├── commands.md                  # Dev, test, lint, build commands
    └── skill-candidates.md          # Repeatable workflow candidates
```

## Design Principles

1. **Single source of truth.** `docs/` is the authority. `AGENTS.md` navigates to it. Tool adapters (Cursor, Copilot) point to the same docs.
2. **No duplication.** Rules are written once in `AGENTS.md`. Tool adapters reference it, they don't rewrite it.
3. **Thin overlays.** Each profile overrides only `docs/architecture.md`, `docs/commands.md`, and `docs/skill-candidates.md`. Everything else comes from base.
4. **Opt-in complexity.** No Tailwind, Pinia, React Query, SQLAlchemy, or Celery pre-installed. Add what you need, when you need it.
5. **Verify-always.** Every change must pass the quality gate before it's considered done.

## What the AI Rules Cover

| Rule | Section in AGENTS.md |
|------|---------------------|
| Read docs first, code second | §1 Before You Touch Code |
| Minimal diffs, no silent changes | §2 Core Principles |
| Break tasks into small verifiable pieces | §3 Task Splitting |
| Test-first implementation | §4, §6 |
| Self-verify after every change | §5 Self-Verification |
| Structured code review | §7 Code Review Checklist |
| When and how to split modules | §8 Component & Module Splitting |
| Maintain context across sessions | §9 Context & Memory |
| Prevent hallucinated code | §10 Anti-Hallucination Rules |
| Clear definition of done | §11 Definition of Done |

## Compatibility

Stack Kit works with any AI tool that reads markdown files from the repo:

| Tool | Reads From |
|------|-----------|
| Claude Code / Claude CLI | `AGENTS.md`, `CLAUDE.md`, `docs/` |
| GitHub Copilot | `.github/copilot-instructions.md`, `.github/prompts/` |
| Cursor | `.cursor/rules/00-core.mdc` |
| OpenClaw | `AGENTS.md`, `docs/` |
| Windsurf | `AGENTS.md`, `docs/` |
| Any LLM via manual prompt | Paste from `AGENTS.md` or `docs/` |

## Contributing

PRs welcome. Please:
1. Keep the base thin — add to profiles, not base, for stack-specific rules.
2. Don't add second-layer library opinions (no specific CSS framework, state library, ORM, etc.).
3. Test the install script: `bash scripts/install.sh /tmp/test-repo <profile>`.

## License

MIT
