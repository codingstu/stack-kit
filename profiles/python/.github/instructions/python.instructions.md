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


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 通用 Python 项目约定

通用 Python 项目（库 / CLI / Worker）。完整工作流规则见 `AGENTS.md`。

- 所有可导入代码放在 `src/<project_name>/` 下。使用 `src/` 布局。
- Core：纯逻辑，无 I/O。Services：编排协调。Adapters：I/O 边界。
- 所有公共函数有显式类型提示。使用 `dataclasses` / `TypedDict`。
- 配置集中在 `pyproject.toml` 中。无可变模块级状态。
- 变更后运行质量门控：ruff check → ruff format --check → mypy → pytest。
- 提交前使用 `AGENTS.md` §7 中的代码审查清单。

</details>
