# Architecture — FastAPI Profile

This profile assumes a **FastAPI service** with clear separation between API layer, business logic, and infrastructure.

## Default Shape

```
app/
  main.py               # FastAPI app instance, middleware, startup/shutdown
  api/
    routes/             # route modules, one per resource or domain
    dependencies.py     # shared dependencies (auth, DB session, etc.)
  schemas/              # Pydantic request/response models
  services/             # business logic — pure functions and domain rules
  repositories/         # data access — DB queries, external API clients
  core/
    config.py           # settings, env loading (pydantic-settings)
    exceptions.py       # custom exception classes and handlers
tests/
  conftest.py           # shared fixtures (TestClient, DB, mocks)
  test_routes/          # API route tests
  test_services/        # service unit tests
  test_repositories/    # data access integration tests
pyproject.toml          # project config, dependencies, tool.fastapi.entrypoint
```

## Working Rules

### Layer Responsibilities
- **Routes** (`api/routes/`): thin — validate input via schema, call service, return response. No business logic.
- **Schemas** (`schemas/`): Pydantic models at request/response boundaries. Validate and serialize.
- **Services** (`services/`): pure business logic. No DB imports, no HTTP imports. Testable in isolation.
- **Repositories** (`repositories/`): data access only. DB queries, external API calls. Abstracted behind interfaces.
- **Dependencies** (`api/dependencies.py`): FastAPI `Depends()` for auth, DB sessions, rate limiting.

### Async Rules
- Use `async def` for I/O-bound work (DB queries, HTTP calls, file I/O).
- Do **not** wrap CPU-heavy work in `async` — use `run_in_executor` or a task queue.
- Keep `sync` functions when no I/O is involved (pure logic, validation).

### Error Handling
- Define custom exceptions in `core/exceptions.py`.
- Register exception handlers in `main.py`.
- Routes catch expected errors; unexpected errors hit the global handler.
- Never expose internal error details to clients.

### Configuration
- Use `pydantic-settings` for config loading from environment.
- Centralize in `core/config.py` with a single `Settings` class.
- Access via dependency injection, not global imports.

### Data Flow
```
HTTP Request → Route (validate via schema)
  → Dependency injection (auth, DB session)
  → Service (business logic)
  → Repository (data access)
  → Service (transform result)
  → Route (return response schema)
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Services, validators, pure utilities | `tests/test_services/` | pytest |
| Integration | Repositories, DB, external adapters | `tests/test_repositories/` | pytest + test DB |
| API | Route tests with full request/response cycle | `tests/test_routes/` | pytest + `TestClient` or `httpx.AsyncClient` |

## Key Conventions
- File naming: snake_case everywhere.
- Pydantic models: use `model_` prefix for base, `Create`, `Update`, `Response` suffixes for variants.
- All route functions return explicit response models — no untyped dicts.
- Config via `pyproject.toml`: set `[tool.fastapi] entrypoint = "app.main:app"`.
