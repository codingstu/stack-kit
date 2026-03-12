# Commands — FastAPI Profile

## Bootstrap
```bash
python -m venv .venv
source .venv/bin/activate          # macOS/Linux
# .venv\Scripts\activate           # Windows
python -m pip install -U pip
python -m pip install "fastapi[standard]" pytest ruff mypy httpx
```

## Suggested pyproject.toml Baseline
```toml
[project]
name = "my-api"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = ["fastapi[standard]"]

[project.optional-dependencies]
dev = ["pytest", "ruff", "mypy", "httpx"]

[tool.fastapi]
entrypoint = "app.main:app"

[tool.ruff]
line-length = 88
target-version = "py311"

[tool.mypy]
strict = true
```

## Dev
```bash
fastapi dev
```

## Alternative Dev (explicit entrypoint)
```bash
fastapi dev app/main.py
```

## Test
```bash
pytest
```

## Test (verbose with coverage)
```bash
pytest -v --tb=short
```

## Lint
```bash
ruff check .
```

## Format
```bash
ruff format .
```

## Format Check (CI)
```bash
ruff format --check .
```

## Typecheck
```bash
mypy app tests
```

## Quality Gate (run all before commit)
```bash
ruff check . && ruff format --check . && mypy app tests && pytest
```

## Production Run
```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

## Notes
- Keep `.venv` in the repo root — it's the standard virtual environment directory.
- Use `httpx.AsyncClient` for async route tests, `TestClient` for sync.
- Add `pytest-cov` for coverage: `pytest --cov=app --cov-report=term-missing`.
