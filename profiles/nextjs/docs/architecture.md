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
- Default to **Server Components**. They render on the server with zero client JavaScript.
- Add `"use client"` only for interactive leaf components or browser-only APIs.
- Keep data fetching on the server to avoid client-side waterfalls.
- Use route handlers in `app/api/` for light HTTP endpoints. Do not bury domain logic in `route.ts`.

### Module Boundaries
- **Route files** (`page.tsx`, `layout.tsx`, `route.ts`): thin composition only — import from `features/`, `server/`, and `components/`.
- **Features**: co-locate domain logic, feature-specific hooks, and feature-specific components.
- **Server**: all server-only code including database access, external APIs, and auth. Never import from client components.
- **Components**: shared, reusable UI. No data fetching and no business logic.
- **Lib**: generic helpers, constants, and client instances. Keep it small and typed.

### Component Rules
- One component per file when the component is reused or exceeds 80 lines.
- Co-locate feature-specific styles, tests, and types in the same folder.
- Props interfaces should be explicit — no `any` and no unlabeled spread.
- Extract hooks when side-effect logic repeats across 2+ components.

### Data Flow
```
Request → Route Handler / Server Component
  → Server-side validation (`zod` / schema)
  → Service / domain logic (`src/server/` or `src/features/`)
  → Data access (database client, external API)
  → Serialized response / React tree
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Utilities, domain logic, schema validators | `tests/unit/` or co-located `*.test.ts` | Vitest |
| Integration | Route handlers, server functions, data boundaries | `tests/integration/` | Vitest + `msw` for mocking |
| Component | Key interactive components | co-located `*.test.tsx` | Vitest + Testing Library |
| E2E | Top 3–5 user journeys | `tests/e2e/` | Playwright (optional) |

## Key Conventions
- File naming: kebab-case for files and PascalCase for component files.
- Named exports preferred. Default exports only for `page.tsx`, `layout.tsx`, and `route.ts` as required by Next.js.
- Validate all external input including request bodies, search params, and environment variables at the boundary.
- Use `error.tsx` at route segments for error boundaries rather than `try/catch` in render.
