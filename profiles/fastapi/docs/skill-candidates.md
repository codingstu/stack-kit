# Skill Candidates — FastAPI Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. endpoint-scaffold
- **Trigger:** Add a CRUD or query endpoint from a short contract.
- **Inputs:** Resource name, HTTP method, request/response fields.
- **Steps:**
  1. Create Pydantic schemas (request + response) in `schemas/`.
  2. Create service function in `services/` with business logic stub.
  3. Create repository function in `repositories/` with data access stub.
  4. Create route in `api/routes/` wiring schema → service → repository.
  5. Register route in `main.py` or router aggregation.
  6. Add route tests with `TestClient`.
- **Output:** Compilable endpoint with schemas, service, repository, and passing test.
- **Verification:** `mypy` + `pytest` + `ruff check` pass.

### 2. api-test-repair
- **Trigger:** Failing API tests.
- **Inputs:** Failing test names, error output.
- **Steps:**
  1. Read failing test and trace to root cause.
  2. Classify: regression, schema change, data issue, environment issue.
  3. Fix route, schema, service, or test as needed.
  4. Run tests — confirm green.
  5. Run full quality gate.
- **Output:** All tests green, root cause summary.
- **Verification:** Full quality gate passes.

### 3. schema-change-review
- **Trigger:** Pydantic request or response model changed.
- **Inputs:** Old and new schema, reason for change.
- **Steps:**
  1. Identify all routes using the changed schema.
  2. Check client impact (breaking change?).
  3. Update tests for all affected routes.
  4. Add migration notes if the change is breaking.
  5. Run quality gate.
- **Output:** Impact analysis, updated routes and tests, migration notes.
- **Verification:** `mypy` + `pytest` pass, breaking changes documented.

### 4. dependency-audit
- **Trigger:** New dependency added or existing dependency version changed.
- **Inputs:** Package name, version, reason.
- **Steps:**
  1. Check if the dependency is actively maintained and well-tested.
  2. Check license compatibility.
  3. Add to `pyproject.toml` in the correct section.
  4. Update `docs/decisions.md` with rationale.
  5. Verify install works cleanly.
- **Output:** Updated `pyproject.toml`, decision record.
- **Verification:** `pip install -e .` succeeds, `pytest` passes.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Skill 候选清单 — FastAPI Profile

扩展 base `docs/skill-candidates.md` 中的通用候选。

**1. endpoint-scaffold（端点脚手架）**
- **触发：** 根据简短契约添加 CRUD 或查询端点。
- **步骤：** 在 `schemas/` 创建 Pydantic Schema（请求+响应）→ 在 `services/` 创建 Service 函数 → 在 `repositories/` 创建 Repository 函数 → 在 `api/routes/` 创建路由连接各层 → 在 `main.py` 注册路由 → 添加 `TestClient` 路由测试。
- **输出：** 可编译的端点，带 schema、service、repository 和通过的测试。

**2. api-test-repair（API 测试修复）**
- **触发：** API 测试失败。
- **步骤：** 读取失败测试并追踪到根因 → 分类（回归/schema 变化/数据问题/环境问题）→ 修复路由/schema/service 或测试 → 确认全部通过 → 运行质量门控。
- **输出：** 所有测试绿色，根因摘要。

**3. schema-change-review（Schema 变更审查）**
- **触发：** Pydantic 请求或响应模型发生变更。
- **步骤：** 识别所有使用该 Schema 的路由 → 检查客户端影响（是否破坏性变更）→ 更新所有受影响路由的测试 → 如破坏性变更则添加迁移说明 → 运行质量门控。
- **输出：** 影响分析、更新的路由和测试、迁移说明。

**4. dependency-audit（依赖审计）**
- **触发：** 新增依赖或变更现有依赖版本。
- **步骤：** 检查依赖是否积极维护 → 检查许可证兼容性 → 添加到 `pyproject.toml` 正确分组 → 在 `docs/decisions.md` 记录理由 → 验证安装无误。
- **输出：** 更新的 `pyproject.toml`，决策记录。

</details>
