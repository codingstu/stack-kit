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


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 架构说明 — Python Profile

本 Profile 假设**通用 Python 项目**：库、CLI 工具、自动化服务、Worker 或数据处理管道。不预设 Web 框架。

### 默认目录结构

```
pyproject.toml          # 项目配置的唯一来源
src/
  <project_name>/
    __init__.py
    __main__.py         # 如果是 CLI：python -m <project_name>
    cli.py              # 如果是 CLI：参数解析（argparse / click / typer）
    core/               # 领域逻辑——纯函数，业务规则
    services/           # 编排——协调 core + adapters
    adapters/           # I/O 边界——文件系统、网络、DB、外部 API
    types.py            # 共享类型、dataclasses、TypedDict
tests/
  conftest.py           # 共享 fixtures
  test_core/            # 核心逻辑单元测试
  test_services/        # Service 测试
  test_adapters/        # I/O 边界集成测试
  test_cli/             # CLI 冒烟测试（如有 CLI）
```

### 关注点分离

- **Core**（`core/`）：纯领域逻辑——无 I/O，无框架导入，无全局状态。可独立测试。
- **Services**（`services/`）：协调 core 逻辑与 adapters。可处理事务、重试、协调。
- **Adapters**（`adapters/`）：所有 I/O——文件系统、HTTP、数据库、消息队列。在接口后面。
- **CLI**（`cli.py` / `__main__.py`）：参数解析和接线。薄层——调用 services。

### 代码质量
- 公共接口的函数签名有显式类型提示。
- 使用 `dataclasses` 或 `TypedDict` 处理结构化数据——避免用原始字典处理领域对象。
- 不要在仓库根目录放有隐藏全局变量的大型脚本。
- 避免可变模块级状态。显式传递依赖。

### 数据流

```
入口点（CLI / main / scheduler）
  → Service（编排）
  → Core（业务逻辑，纯函数）
  → Adapter（I/O：文件、网络、DB）
  → Service（汇总结果）
  → 输出（stdout、文件、API 响应）
```

### 测试策略

| 层级 | 测试内容 | 位置 | 工具 |
|------|---------|------|------|
| 单元 | 核心逻辑、验证器、格式化器 | `tests/test_core/` | pytest |
| Service | Service 编排（mocked adapters） | `tests/test_services/` | pytest |
| 集成 | Adapters 真实 I/O | `tests/test_adapters/` | pytest + fixtures |
| CLI | 关键命令端到端 | `tests/test_cli/` | pytest + subprocess |

### 关键约定
- 文件命名：全部 snake_case。
- 公共函数：参数和返回值有显式类型提示。
- 内部辅助函数：以 `_` 前缀。
- 导入：优先绝对导入（`from <project_name>.core import ...`）。

</details>
