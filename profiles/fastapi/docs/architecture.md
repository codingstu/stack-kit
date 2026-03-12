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


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 架构说明 — FastAPI Profile

本 Profile 假设**FastAPI 服务**，API 层、业务逻辑和基础设施有清晰分离。

### 默认目录结构

```
app/
  main.py               # FastAPI 应用实例、中间件、启动/关闭
  api/
    routes/             # 路由模块，每个资源或领域一个
    dependencies.py     # 共享依赖（认证、DB Session 等）
  schemas/              # Pydantic 请求/响应模型
  services/             # 业务逻辑——纯函数和领域规则
  repositories/         # 数据访问——DB 查询、外部 API 客户端
  core/
    config.py           # 配置、环境变量加载（pydantic-settings）
    exceptions.py       # 自定义异常类和处理器
tests/
  conftest.py           # 共享 fixtures（TestClient、DB、mocks）
  test_routes/          # API 路由测试
  test_services/        # Service 单元测试
  test_repositories/    # 数据访问集成测试
pyproject.toml
```

### 层次职责

- **Routes**（`api/routes/`）：精简——通过 schema 验证输入，调用 service，返回响应。无业务逻辑。
- **Schemas**（`schemas/`）：请求/响应边界的 Pydantic 模型。验证并序列化。
- **Services**（`services/`）：纯业务逻辑。无 DB 导入，无 HTTP 导入。可独立测试。
- **Repositories**（`repositories/`）：仅数据访问。DB 查询、外部 API 调用。在接口后面抽象。
- **Dependencies**（`api/dependencies.py`）：认证、DB Session、限流的 `Depends()`。

### 异步规则
- I/O 密集型工作（DB 查询、HTTP 调用、文件 I/O）使用 `async def`。
- 不要将 CPU 密集型工作包装在 `async` 中——使用 `run_in_executor` 或任务队列。

### 错误处理
- 在 `core/exceptions.py` 中定义自定义异常。
- 在 `main.py` 中注册异常处理器。
- 永远不要向客户端暴露内部错误详情。

### 数据流

```
HTTP 请求 → Route（通过 schema 验证）
  → 依赖注入（认证、DB Session）
  → Service（业务逻辑）
  → Repository（数据访问）
  → Service（转换结果）
  → Route（返回响应 schema）
```

### 测试策略

| 层级 | 测试内容 | 位置 | 工具 |
|------|---------|------|------|
| 单元 | Services、验证器、纯工具函数 | `tests/test_services/` | pytest |
| 集成 | Repositories、DB、外部适配器 | `tests/test_repositories/` | pytest + 测试 DB |
| API | 完整请求/响应周期的路由测试 | `tests/test_routes/` | pytest + `TestClient` |

### 关键约定
- 文件命名：全部 snake_case。
- 所有路由函数返回显式响应模型——不返回未类型化的字典。
- 通过 `pyproject.toml` 配置。

</details>
