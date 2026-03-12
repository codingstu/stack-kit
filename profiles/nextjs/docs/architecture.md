# Architecture — Next.js Profile

This profile assumes a modern Next.js application using the **App Router**.

## Default Shape

```
app/                    # or src/app/ — route segments, layouts, pages, loading, error, route handlers
  (marketing)/          # public pages group
  (app)/                # authenticated pages group
  api/                  # route handlers
  layout.tsx
  page.tsx
src/
  components/           # shared UI components
  features/             # feature modules (co-located logic, hooks, components)
  lib/                  # shared utilities, clients, constants
  server/               # server-only code: DB queries, external API calls, auth
  types/                # shared TypeScript types and interfaces
tests/
  unit/
  integration/
  e2e/
```

## Working Rules

### Server vs Client
- Default to **Server Components**. They render on the server with zero client JS.
- Add `"use client"` only for interactive leaf components or browser-only APIs.
- Keep data fetching on the server — avoid client-side waterfalls.
- Use route handlers (`app/api/`) for light HTTP endpoints; do not bury domain logic in `route.ts`.

### Module Boundaries
- **Route files** (`page.tsx`, `layout.tsx`, `route.ts`): thin composition only — import from `features/`, `server/`, `components/`.
- **Features**: co-locate domain logic, feature-specific hooks, feature-specific components.
- **Server**: all server-only code (DB, external APIs, auth). Never imported from client components.
- **Components**: shared, reusable UI. No data fetching, no business logic.
- **Lib**: generic helpers, constants, client instances. Small and typed.

### Component Rules
- One component per file when the component is reused or exceeds 80 lines.
- Co-locate a component's styles, tests, and types in the same folder when feature-specific.
- Props interfaces should be explicit — no `any`, no unlabeled spread.
- Extract hooks when side-effect logic repeats across 2+ components.

### Data Flow
```
Request → Route Handler / Server Component
  → Server-side validation (zod / schema)
  → Service / domain logic (src/server/ or src/features/)
  → Data access (DB client, external API)
  → Serialized response / React tree
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Utilities, domain logic, schema validators | `tests/unit/` or co-located `*.test.ts` | Vitest |
| Integration | Route handlers, server functions, data boundaries | `tests/integration/` | Vitest + msw for mocking |
| Component | Key interactive components | co-located `*.test.tsx` | Vitest + Testing Library |
| E2E | Top 3–5 user journeys | `tests/e2e/` | Playwright (optional) |

## Key Conventions
- File naming: kebab-case for files, PascalCase for component files.
- Named exports preferred. Default exports only for `page.tsx`, `layout.tsx`, `route.ts` (Next.js convention).
- Validate all external input (request bodies, search params, env vars) at the boundary.
- Error boundaries: use `error.tsx` at route segments, not try/catch in render.
