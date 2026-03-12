# Architecture — Vue Profile

This profile assumes a **Vue 3 application scaffolded with create-vue and Vite**. Default API style is Composition API with `<script setup>`. Router and Pinia are opt-in, not pre-installed.

## Default Shape

```
src/
  router/               # Vue Router config (opt-in)
  views/                # route-level / page-level components
  components/           # shared, reusable UI components
  composables/          # shared composition functions (hooks)
  stores/               # Pinia stores (opt-in)
  services/             # API clients, external service wrappers
  lib/                  # constants, formatters, pure utilities
  types/                # shared TypeScript types
tests/
  unit/
  e2e/
```

## Working Rules

### Component Architecture
- **Views** (`views/`): page-level composition — assemble components and call composables.
- **Components** (`components/`): reusable, well-typed via `defineProps` / `defineEmits`.
- **Composables** (`composables/`): reusable stateful logic extracted from components.
- Use `<script setup>` with TypeScript by default.
- One component per `.vue` file. If a component exceeds 200 lines, split into child components or extract a composable.

### Props and Events
- Use `defineProps<T>()` with explicit TypeScript interface — no runtime-only prop validation.
- Use `defineEmits<T>()` with typed event signatures.
- Prefer explicit props and emits over `provide/inject` for parent-child communication.
- Use `provide/inject` only for deeply nested, contextual dependencies (theme, locale).

### State Management
- Start with component-local `ref()` / `reactive()`.
- Extract shared logic into composables first.
- Add **Pinia** only when state is shared across distant parts of the app. Record the decision.
- Keep stores thin: actions call services, getters derive state, no API calls in stores.

### Data Fetching
- Keep API calls in `services/` — never inline in components or stores.
- Composables can wrap `services/` calls with loading/error state management.
- Separate loading, error, and success states explicitly.

### Data Flow
```
User Interaction → Event (emit or handler)
  → Composable / store update
  → Service call (if server state involved)
  → Reactive state update
  → Template re-renders
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Composables, services, pure helpers | co-located `*.test.ts` | Vitest |
| Component | Critical interactive components | co-located `*.test.ts` | Vitest + Vue Test Utils |
| E2E | Main routes and user flows | `tests/e2e/` | Playwright or Cypress (optional) |

## Key Conventions
- File naming: PascalCase for `.vue` files, kebab-case for non-component TS files.
- Named exports for non-component modules; default export for `.vue` SFCs.
- Validate all external input (API responses, route params) at the boundary.
- Use Vue's built-in `<Suspense>` and `onErrorCaptured` for async and error boundaries.
