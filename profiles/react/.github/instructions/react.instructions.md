---
applyTo: "src/**/*.ts,src/**/*.tsx"
---

Vite-based React + TypeScript SPA. See `AGENTS.md` for full workflow rules.

- Keep render logic pure. Side effects in hooks or adapters.
- API calls in `lib/` or feature data modules — never in presentation components.
- Local state first. Shared state only when needed — record decision in `docs/decisions.md`.
- One component per file when reused or > 80 lines. Split by responsibility.
- Extract custom hooks when side-effect logic repeats in 2+ components.
- Run quality gate after changes: lint → typecheck → test → build.
- Use code review checklist in `AGENTS.md` §7 before submitting.
