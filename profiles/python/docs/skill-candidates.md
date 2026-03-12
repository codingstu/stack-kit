# Skill Candidates — Python Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. module-scaffold
- **Trigger:** Add a new module (core, service, or adapter) from a short spec.
- **Inputs:** Module name, responsibility, public interface.
- **Steps:**
  1. Create module directory under the appropriate layer (`core/`, `services/`, `adapters/`).
  2. Add `__init__.py` with public exports.
  3. Add implementation file with typed function stubs.
  4. Add test file with at least one test per public function.
- **Output:** Compilable module with typed stubs and passing skeleton tests.
- **Verification:** `mypy` + `pytest` pass.

### 2. cli-command-add
- **Trigger:** Add a new CLI command or subcommand.
- **Inputs:** Command name, arguments, expected behavior.
- **Steps:**
  1. Add command function in `cli.py` with argument parsing.
  2. Wire to service layer for business logic.
  3. Add CLI smoke test.
  4. Update help text and usage examples.
- **Output:** New command with tests and documentation.
- **Verification:** `pytest` passes, `python -m <project> <command> --help` works.

### 3. adapter-replace
- **Trigger:** Replace or upgrade an external integration (DB driver, API client, etc.).
- **Inputs:** Old adapter, new adapter, reason for change.
- **Steps:**
  1. Define the interface the adapter must satisfy (Protocol or ABC).
  2. Implement the new adapter behind the same interface.
  3. Write integration tests for the new adapter.
  4. Swap in services — no service code should change.
  5. Remove old adapter if no longer needed.
  6. Record decision in `docs/decisions.md`.
- **Output:** New adapter, preserved service layer, decision record.
- **Verification:** All tests pass, no service code changed.

### 4. test-diagnose-repair
- **Trigger:** Failing tests after a change.
- **Inputs:** Failing test names, error output.
- **Steps:**
  1. Identify root cause (regression, env issue, flaky, spec change).
  2. Fix at the appropriate layer (core, service, adapter, or test).
  3. Run full quality gate.
- **Output:** All tests green, root cause explained.
- **Verification:** `ruff check` + `mypy` + `pytest` pass.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Skill 候选清单 — Python Profile

扩展 base `docs/skill-candidates.md` 中的通用候选。

**1. module-scaffold（模块脚手架）**
- **触发：** 根据简短规格添加新模块（core/service/adapter）。
- **步骤：** 在适当层下创建模块目录 → 添加带公开导出的 `__init__.py` → 添加带类型化函数 stub 的实现文件 → 添加每个公开函数至少一个测试。
- **输出：** 可编译的模块，带类型化 stub 和通过的骨架测试。

**2. cli-command-add（CLI 命令添加）**
- **触发：** 添加新的 CLI 命令或子命令。
- **步骤：** 在 `cli.py` 中添加带参数解析的命令函数 → 连接到 service 层 → 添加 CLI 冒烟测试 → 更新帮助文本和使用示例。
- **输出：** 新命令，带测试和文档。

**3. adapter-replace（Adapter 替换）**
- **触发：** 替换或升级外部集成（DB 驱动、API 客户端等）。
- **步骤：** 定义 Adapter 必须满足的接口（Protocol 或 ABC）→ 在同一接口后面实现新 Adapter → 编写集成测试 → 在 Service 中替换（service 代码不应变化）→ 如不再需要则移除旧 Adapter → 在 `docs/decisions.md` 记录决策。
- **输出：** 新 Adapter，保留的 Service 层，决策记录。

**4. test-diagnose-repair（测试诊断修复）**
- **触发：** 变更后测试失败。
- **步骤：** 识别根因（回归/环境问题/不稳定/规格变化）→ 在适当层（core/service/adapter/测试）修复 → 运行质量门控。
- **输出：** 所有测试绿色，根因解释。

</details>
