---
applyTo: "app/**/*.ts,app/**/*.tsx,src/app/**/*.ts,src/app/**/*.tsx"
---

Use Next.js App Router conventions. See `AGENTS.md` for full workflow rules.

- Default to Server Components. `"use client"` only for interactive leaves.
- Keep domain logic in `src/features/`, `src/server/`, `src/lib/` — not in page/route files.
- Route handlers: validate input → call service → return typed response. No inline business logic.
- Server-side data fetching preferred. Avoid client waterfalls.
- Split page components > 200 lines into server functions + child components.
- Run quality gate after changes: lint → typecheck → test → build.
- Use the code review checklist in `AGENTS.md` §7 before submitting.
