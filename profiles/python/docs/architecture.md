# Architecture — Python Profile

This profile assumes a **general Python project**: library, CLI tool, automation service, worker, or data-processing pipeline. No web framework is pre-assumed.

## Default Shape

```
pyproject.toml          # single source of truth for project config
src/
  <project_name>/
    __init__.py
    __main__.py         # if CLI: python -m <project_name>
    cli.py              # if CLI: argument parsing (argparse / click / typer)
    core/               # domain logic — pure functions, business rules
    services/           # orchestration — coordinate core + adapters
    adapters/           # I/O boundaries — filesystem, network, DB, external APIs
    types.py            # shared types, dataclasses, TypedDict
tests/
  conftest.py           # shared fixtures
  test_core/            # unit tests for core logic
  test_services/        # service tests
  test_adapters/        # integration tests for I/O boundaries
  test_cli/             # CLI smoke tests (if CLI)
```

## Working Rules

### Package Structure
- All importable code lives under `src/<project_name>/`.
- Keep `pyproject.toml` as the single configuration file. `[build-system]` must always be present.
- Use `src/` layout to avoid accidental imports from the project root.

### Separation of Concerns
- **Core** (`core/`): pure domain logic — no I/O, no framework imports, no global state. Testable in isolation.
- **Services** (`services/`): orchestrate core logic with adapters. May handle transactions, retries, coordination.
- **Adapters** (`adapters/`): all I/O — filesystem, HTTP, database, message queues. Behind interfaces.
- **CLI** (`cli.py` / `__main__.py`): argument parsing and wiring. Thin — call services.

### Code Quality
- Prefer small functions with explicit types for public interfaces.
- Keep configuration centralized — one place to load env vars and defaults.
- Do not put large scripts with hidden globals at the repo root.
- Avoid mutable module-level state. Pass dependencies explicitly.
- Use `dataclasses` or `TypedDict` for structured data. Avoid raw dicts for domain objects.

### Virtual Environment
- Use `.venv` in the project root as the standard virtual environment.
- Never commit `.venv`. Add to `.gitignore`.
- Document activation in `docs/commands.md`.

### Data Flow
```
Entry Point (CLI / main / scheduler)
  → Service (orchestrate)
  → Core (business logic, pure)
  → Adapter (I/O: file, network, DB)
  → Service (aggregate results)
  → Output (stdout, file, API response)
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Core logic, validators, formatters | `tests/test_core/` | pytest |
| Service | Service orchestration with mocked adapters | `tests/test_services/` | pytest |
| Integration | Adapters with real I/O (filesystem, HTTP) | `tests/test_adapters/` | pytest + fixtures |
| CLI | Critical commands end-to-end | `tests/test_cli/` | pytest + subprocess or click.testing |

## Key Conventions
- File naming: snake_case everywhere.
- Public functions: explicit type hints on parameters and return.
- Internal helpers: prefix with `_`.
- Imports: absolute imports preferred (`from <project_name>.core import ...`).
