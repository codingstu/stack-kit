---
applyTo: "app/**/*.py,tests/**/*.py"
---

FastAPI service. See `AGENTS.md` for full workflow rules.

- Routes: thin — validate via Pydantic → call service → return typed response. No business logic.
- Services: pure logic. No DB or HTTP imports.
- Repositories: data access behind interfaces.
- Use `Depends()` for auth, DB sessions, config.
- `async def` for I/O-bound work only. No fake async for CPU work.
- All routes return explicit Pydantic response models.
- Run quality gate after changes: ruff check → ruff format --check → mypy → pytest.
- Use code review checklist in `AGENTS.md` §7 before submitting.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## FastAPI 服务约定

FastAPI 服务。完整工作流规则见 `AGENTS.md`。

- Routes（路由）：精简——通过 Pydantic 验证 → 调用 Service → 返回类型化响应。无业务逻辑。
- Services（服务）：纯逻辑，无 DB 或 HTTP 导入。
- Repositories（仓储）：数据访问在接口后面。
- 用 `Depends()` 处理认证、DB Session、配置。
- `async def` 仅用于 I/O 密集型工作。不要对 CPU 工作用假异步。
- 所有路由返回显式 Pydantic 响应模型。
- 变更后运行质量门控：ruff check → ruff format --check → mypy → pytest。
- 提交前使用 `AGENTS.md` §7 中的代码审查清单。

</details>
