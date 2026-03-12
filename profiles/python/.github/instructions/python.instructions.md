---
applyTo: "src/**/*.py,tests/**/*.py"
---

General Python project (library / CLI / worker). See `AGENTS.md` for full workflow rules.

- All importable code under `src/<project_name>/`. Use `src/` layout.
- Core: pure logic, no I/O. Services: orchestration. Adapters: I/O boundaries.
- Explicit type hints on all public functions. Use `dataclasses` / `TypedDict`.
- Config centralized in `pyproject.toml`. No mutable module-level state.
- Run quality gate after changes: ruff check → ruff format --check → mypy → pytest.
- Use code review checklist in `AGENTS.md` §7 before submitting.
