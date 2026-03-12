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


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 命令参考 — FastAPI Profile

### 引导安装
```bash
python -m venv .venv
source .venv/bin/activate          # macOS/Linux
python -m pip install -U pip
python -m pip install "fastapi[standard]" pytest ruff mypy httpx
```

### 开发
```bash
fastapi dev
```

### 测试
```bash
pytest
```

### Lint
```bash
ruff check .
```

### 格式化
```bash
ruff format .
```

### 格式检查（CI）
```bash
ruff format --check .
```

### 类型检查
```bash
mypy app tests
```

### 质量门控（提交前运行全部）
```bash
ruff check . && ruff format --check . && mypy app tests && pytest
```

</details>
