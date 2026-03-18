# Architecture

## Top-Level Modules
<!--
List the main folders and explain each one's responsibility.

Example:
`src/`    — application source code
`tests/`  — all test files mirroring `src/` structure
`docs/`   — project documentation
-->

| Folder | Responsibility |
|--------|----------------|
| | |

## Module Boundaries

<!--
Define what belongs where. Each concern should have exactly one home.
-->

| Concern | Where It Lives | Does NOT Belong In |
|---------|----------------|--------------------|
| UI / presentation | | route handlers, services |
| Domain / business logic | | UI components, data access |
| Data access / persistence | | domain logic, UI |
| External integrations | | domain logic |
| Configuration | | scattered across modules |
| Tests | | production bundles |

## Data Flow

<!--
Describe how data enters, gets validated, transformed, and persisted.
-->

```
Input → Validation → Domain Logic → Persistence / Output
```

<!--
Example:
1. HTTP request hits route handler
2. Request body is validated against a schema
3. Service layer applies business rules
4. Repository persists to the database
5. Response is serialized and returned
-->

## Key Conventions
<!--
Document your project-specific conventions below.
-->

- File naming: (e.g. kebab-case, PascalCase for components)
- Export style: (e.g. named exports preferred over default)
- Error handling: (e.g. typed errors, Result types, try/catch boundaries)
- Logging: (e.g. structured JSON, specific logger instance)

## Testing Strategy

| Level | What It Covers | Where It Lives | Run Command |
|-------|----------------|----------------|-------------|
| Unit | Pure functions, domain logic, utilities | `tests/unit/` or co-located | |
| Integration | Adapters, DB, external APIs | `tests/integration/` | |
| E2E / API | Full user flows or route contracts | `tests/e2e/` | |

## Dependency Rules
<!--
Dependencies flow inward: presentation → domain → infrastructure boundary.
Domain logic must not import from infrastructure or UI.
Shared code lives in a dedicated shared module, not in `utils` catch-all.
-->
