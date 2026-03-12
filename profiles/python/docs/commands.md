# Commands — Python Profile

## Bootstrap
```bash
python -m venv .venv
source .venv/bin/activate          # macOS/Linux
# .venv\Scripts\activate           # Windows
python -m pip install -U pip
python -m pip install -e ".[dev]"
```

## Suggested pyproject.toml Baseline
```toml
[build-system]
requires = ["setuptools>=68.0"]
build-backend = "setuptools.backends._legacy:_Backend"

[project]
name = "my-project"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = []

[project.optional-dependencies]
dev = ["pytest", "ruff", "mypy"]

[tool.setuptools.packages.find]
where = ["src"]

[tool.ruff]
line-length = 88
target-version = "py311"

[tool.mypy]
strict = true

[tool.pytest.ini_options]
testpaths = ["tests"]
```

## Dev (run the module directly)
```bash
python -m <project_name>
```

## Dev (if CLI with entry point)
```bash
<project_name> --help
```

## Test
```bash
pytest
```

## Test (verbose)
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
mypy src tests
```

## Quality Gate (run all before commit)
```bash
ruff check . && ruff format --check . && mypy src tests && pytest
```

## Notes
- Use `src/` layout so `import <project_name>` always resolves to the installed package, not the source tree.
- Install in editable mode (`pip install -e ".[dev]"`) for development.
- Add `pytest-cov` for coverage: `pytest --cov=src --cov-report=term-missing`.
