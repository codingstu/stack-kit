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
