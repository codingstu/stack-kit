# Architecture — React Profile

This profile assumes a **client-side React application built with Vite**, not a full-stack framework. Ideal for SPAs, internal dashboards, and shared UI packages.

## Default Shape

```
src/
  app/                  # app shell, providers, router setup
  routes/               # route-level components (pages)
  features/             # feature modules (co-located logic, hooks, components)
  components/           # shared, reusable UI components
  hooks/                # shared custom hooks
  lib/                  # API clients, constants, shared utilities
  types/                # shared TypeScript types
  styles/               # global styles, theme tokens
tests/
  unit/
  e2e/
```

## Working Rules

### Component Architecture
- **Route components** (`routes/`): thin composition — assemble features and layout, minimal logic.
- **Feature components** (`features/`): co-locate domain logic, state, hooks, and feature-specific UI.
- **Shared components** (`components/`): reusable, stateless or locally stateful, well-typed props.
- One component per file when the component is reused or exceeds 80 lines.
- Props interfaces must be explicit — no `any`, no unlabeled spread.

### State Management
- Start with **local state** (`useState`, `useReducer`).
- Lift state only when two or more distant components need the same data.
- Introduce shared state (Zustand, Jotai, Redux, etc.) only when local state and prop drilling become unmanageable — record the decision in `docs/decisions.md`.
- Do not default to global state. Most state is local.

### Data Fetching
- Keep API calls in `lib/` or feature data modules — never inline in presentation components.
- Use a data-fetching library (React Query, SWR, etc.) if the project has server state — record the choice.
- Separate loading, error, and success states explicitly.

### Hook Rules
- Extract a custom hook when side-effect logic repeats across 2+ components.
- Hooks should do one thing. If a hook manages state and fetches data and formats output, split it.
- Name hooks descriptively: `useOrderStatus`, not `useData`.

### Data Flow
```
User Interaction → Event Handler
  → State update / API call (via hook or `lib/`)
  → Component re-render
  → UI reflects new state
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Hooks, utilities, feature logic | co-located `*.test.ts` | Vitest |
| Component | Critical interactive UI states | co-located `*.test.tsx` | Vitest + Testing Library |
| E2E | Primary user flows | `tests/e2e/` | Playwright (optional) |

## Key Conventions
- File naming: kebab-case for files, PascalCase for component files.
- Named exports preferred over default exports.
- Validate all external input (API responses, URL params) at the boundary.
- Use error boundaries for critical sections rather than `try/catch` in render.
