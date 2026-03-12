# AGENTS.md

This repository uses a **map-first, verify-always** workflow.

---

## 1. Before You Touch Code

Read these files in order — they are the single source of truth:

1. `docs/spec.md` — what we're building and why
2. `docs/architecture.md` — module boundaries, data flow, testing strategy
3. `docs/plan.md` — current milestone, active work, what's next
4. `docs/decisions.md` — past tradeoffs and their rationale
5. `docs/commands.md` — exact commands for dev, test, lint, build

**Do not start coding until you can explain how your change fits the spec and architecture.**

---

## 2. Core Principles

### Minimal Change
- Prefer the smallest diff that satisfies the requirement.
- One concern per commit. If a commit message needs "and", split it.
- Preserve existing file boundaries unless there is a documented reason to refactor.

### No Silent Side-Effects
- Do not add dependencies, rename directories, change build config, or alter public APIs without updating `docs/decisions.md`.
- Do not introduce new patterns (state management, error handling, data fetching) without recording the decision.

### Code Standards
- Follow the language/framework conventions defined in the profile's `docs/architecture.md`.
- Enforce consistent naming: files, variables, functions, components, routes.
- Keep functions under 50 lines; keep files under 200 lines. If exceeded, split by responsibility.
- Use early returns over deep nesting (max 3 levels).
- Avoid generic names (`utils`, `helpers`, `common`, `shared`). Use domain-specific names.
- Prefer existing libraries over custom implementations for non-domain logic.

---

## 3. Task Splitting

Break every non-trivial task before you start coding:

1. **Decompose** — list concrete subtasks, each completable and verifiable in isolation.
2. **Order** — identify dependencies; independent subtasks can run in parallel.
3. **Size** — each subtask should produce a reviewable diff (roughly one commit).
4. **Track** — use a todo list or plan file; mark each subtask in-progress → completed.

If a subtask grows beyond its scope, stop and re-split.

---

## 4. Implementation Workflow

For every subtask:

```
1. Read the relevant docs (spec, architecture, plan).
2. Write or update tests FIRST when behavior changes (see §6).
3. Implement the minimal code to pass.
4. Self-verify (see §5).
5. Update docs if API, behavior, or architecture changed.
6. Commit with a clear message: <type>(<scope>): <summary>
```

### Commit Types
`feat` · `fix` · `refactor` · `test` · `docs` · `chore` · `ci` · `style` · `perf`

---

## 5. Self-Verification (after every subtask)

Run the **narrowest check first**, then expand:

```
1. Compile / type-check the changed files.
2. Run tests covering the changed behavior.
3. Run lint + format checks on changed files.
4. Run the full quality gate from docs/commands.md.
5. Manually verify the behavior if it's UI or IO-facing.
```

**Do not mark a subtask complete until all checks pass.** If a check fails, fix it before moving on.

---

## 6. Testing Rules

- **New behavior → new test.** Changed behavior → updated test.
- Write the test before the implementation when possible (Red → Green → Refactor).
- Watch the test fail first to confirm it tests the right thing.
- Write minimal code to make the test pass — no speculative features.
- Keep tests focused: one behavior per test, clear name, no vague assertions.
- Prefer real code over mocks; use mocks only for external boundaries (network, DB, filesystem).
- Cover edge cases and error paths, not just happy paths.

---

## 7. Code Review Checklist

Before submitting any change for review:

### Correctness
- [ ] Change matches the spec or task description.
- [ ] Edge cases and error paths are handled.
- [ ] No broken existing behavior (regression).

### Quality
- [ ] Functions and files are reasonably small and focused.
- [ ] Naming is clear and domain-specific.
- [ ] No code duplication that should be extracted.
- [ ] No dead code, debug logs, or TODO hacks left behind.

### Testing
- [ ] New/changed behavior is covered by tests.
- [ ] All tests pass (not just the new ones).
- [ ] Test names describe behavior, not implementation.

### Architecture
- [ ] Change respects module boundaries from `docs/architecture.md`.
- [ ] No business logic in UI/route entry files.
- [ ] No infrastructure concerns (DB, API calls) in domain logic.
- [ ] Dependencies flow inward (presentation → domain → infrastructure boundary).

### Documentation
- [ ] `docs/` updated if API, behavior, or architecture changed.
- [ ] `docs/decisions.md` updated if a meaningful tradeoff was made.
- [ ] Public interfaces have clear types or docstrings.

---

## 8. Component & Module Splitting

### When to split
- A file exceeds ~200 lines or a function exceeds ~50 lines.
- A component mixes data fetching, business logic, and rendering.
- Multiple unrelated concerns live in the same module.
- A module is imported by many unrelated consumers.

### How to split
- Extract by **responsibility**: data access, business logic, presentation, configuration.
- Keep the public API small — expose only what consumers need.
- Co-locate tightly coupled pieces; separate loosely coupled ones.
- If a piece is reusable, move it to a shared location; if it's feature-specific, keep it in the feature folder.

---

## 9. Context & Memory Management

### Staying Oriented
- **Start of session**: read `docs/spec.md`, `docs/architecture.md`, `docs/plan.md`, `docs/commands.md`.
- **Before each subtask**: re-read the relevant section if the context is stale.
- **After completing work**: update `docs/plan.md` (move items to done, update "Now" and "Next").

### Maintaining Continuity
- Record every meaningful decision in `docs/decisions.md` with date, context, and rationale.
- When a session ends or context resets, the next session can fully reconstruct state from `docs/`.
- Keep `docs/plan.md` as a living document — it is the coordination point between sessions.

---

## 10. Anti-Hallucination Rules

These rules prevent fabricated information from entering the codebase:

1. **Verify before asserting.** Do not claim a file exists, a function is available, or an API works unless you have read or executed it.
2. **Never invent APIs.** Check documentation or source code before using any function, method, or endpoint.
3. **Do not assume dependency versions.** Read `package.json`, `pyproject.toml`, or lock files for actual versions.
4. **When unsure, say so.** "I'm not sure — let me verify" is always better than a confident wrong answer.
5. **Show your work.** When debugging, list what you checked and what you found, not what you guessed.
6. **Test proves correctness, not confidence.** A passing test is evidence; "it should work" is not.
7. **Do not fabricate terminal output.** Run the command and report actual results.
8. **Cross-reference changes.** After editing, re-read the file to confirm the edit is correct.
9. **Use web search to verify external facts.** When a library version, API signature, or official recommendation is uncertain, search the official docs or changelog before proceeding. Do not guess.
10. **Use MCP tools for real data.** If a tool is available (filesystem, git, GitHub, database), use it to get actual state rather than inferring from memory.

---

## 11. Tool Use Guidelines

Available tools extend what can be verified. Use them deliberately, not reflexively.

### Web Search
**Use when:**
- Verifying the current stable version of a library or framework.
- Checking whether an API, function, or CLI flag exists in the current version.
- Confirming official recommendations (e.g., Next.js App Router migration, FastAPI async patterns).
- Researching whether a known issue or breaking change exists before assuming a bug is local.

**Do not use when:**
- The answer is already in the codebase (read the file instead).
- The answer is in `docs/` (read the doc instead).
- You are generating speculative research not tied to the current task.

### MCP Tools
**Use when:**
- Reading or writing files that are outside the visible context window.
- Querying a connected database or external service for real state.
- Interacting with GitHub (PRs, issues, commits) via a GitHub MCP server.
- Running git operations when the terminal is not available.

**Boundaries:**
- Never use MCP tools to bypass the quality gate (lint, typecheck, test, build).
- Do not read sensitive files (credentials, secrets) unless the task explicitly requires it.
- When an MCP tool returns data, treat it as real state — do not override with cached assumptions.
- If an MCP tool is not configured or unavailable, fall back to terminal commands.

### Tool Configuration (optional)
If your team uses Claude Code, create a `.mcp.json` at the project root to configure MCP servers.
A template is provided at `docs/mcp.json.example` after installation.

---

## 12. Definition of Done

A task is **done** when ALL of these are true:

- [ ] Code compiles / type-checks with zero errors.
- [ ] All tests pass (existing + new).
- [ ] Lint and format checks pass.
- [ ] Changed behavior is covered by tests.
- [ ] Docs are updated if API, behavior, or architecture changed.
- [ ] Decisions are recorded if a meaningful tradeoff was made.
- [ ] Self-verification (§5) completed successfully.
- [ ] Final summary includes: **what changed**, **risks**, and **how it was verified**.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## AGENTS.md

本仓库使用 **先读地图、持续验证** 的工作流。

---

### 1. 动手之前

按顺序阅读以下文件——它们是唯一的事实源：

1. `docs/spec.md` — 构建什么以及为什么
2. `docs/architecture.md` — 模块边界、数据流、测试策略
3. `docs/plan.md` — 当前里程碑、进行中的工作、下一步
4. `docs/decisions.md` — 过去的权衡及其原因
5. `docs/commands.md` — 开发、测试、lint、构建的精确命令

**在能解释你的改动如何符合规格和架构之前，不要开始编码。**

---

### 2. 核心原则

**最小改动**
- 优先选择满足需求的最小 diff。
- 每次提交只做一件事。如果提交信息需要用"和"连接，就拆分提交。
- 除非有文档化的重构原因，否则保持现有文件边界。

**无静默副作用**
- 不要在未更新 `docs/decisions.md` 的情况下添加依赖、重命名目录、修改构建配置或变更公共 API。
- 不要引入新模式（状态管理、错误处理、数据获取）而不记录该决策。

**代码规范**
- 遵循 profile 的 `docs/architecture.md` 中定义的语言/框架约定。
- 强制统一命名：文件、变量、函数、组件、路由。
- 函数不超过 50 行；文件不超过 200 行。超出则按职责拆分。
- 使用早返回而非深层嵌套（最多 3 层）。
- 避免通用名称（`utils`、`helpers`、`common`、`shared`）。使用领域专用名称。
- 非领域逻辑优先使用已有库，而非自己实现。

---

### 3. 任务拆分

开始编码前，先拆解每一个非平凡任务：

1. **分解** — 列出具体子任务，每个子任务可独立完成且可验证。
2. **排序** — 识别依赖关系；独立子任务可并行进行。
3. **定大小** — 每个子任务应产生一个可审查的 diff（大约一次提交）。
4. **跟踪** — 使用待办列表或计划文件；将每个子任务标记为进行中 → 已完成。

如果子任务超出范围，停下来重新拆分。

---

### 4. 实现工作流

每个子任务：

1. 阅读相关文档（spec、architecture、plan）。
2. 行为变更时先写或更新测试（见 §6）。
3. 实现通过测试所需的最小代码。
4. 自我验证（见 §5）。
5. 如果 API、行为或架构发生变化，更新文档。
6. 用清晰的格式提交：`<类型>(<范围>): <摘要>`

---

### 5. 自我验证（每个子任务完成后）

先运行最小范围的检查，再扩大：

1. 编译/类型检查已修改的文件。
2. 运行覆盖已变更行为的测试。
3. 对已修改文件运行 lint + 格式检查。
4. 运行 `docs/commands.md` 中的完整质量门控。
5. 如果是 UI 或 IO 相关，手动验证行为。

**在所有检查通过之前，不要标记子任务为完成。** 如果某项检查失败，先修复再继续。

---

### 6. 测试规则

- **新行为 → 新测试。** 行为变更 → 测试更新。
- 尽可能在实现之前写测试（红 → 绿 → 重构）。
- 先看测试失败，确认它测试的是正确的东西。
- 写让测试通过的最小代码——不做推测性功能。
- 保持测试聚焦：每个测试一个行为，清晰的名称，无模糊断言。
- 优先使用真实代码而非 Mock；仅在外部边界（网络、数据库、文件系统）使用 Mock。
- 覆盖边界情况和错误路径，不只是正常路径。

---

### 7. 代码审查清单

提交任何变更前：

**正确性**
- [ ] 变更符合规格或任务描述。
- [ ] 边界情况和错误路径已处理。
- [ ] 没有破坏现有行为（无回归）。

**质量**
- [ ] 函数和文件大小合理且职责单一。
- [ ] 命名清晰且领域专用。
- [ ] 没有应该被提取的代码重复。
- [ ] 没有遗留的死代码、调试日志或 TODO hack。

**测试**
- [ ] 新的/变更的行为有测试覆盖。
- [ ] 所有测试通过（不只是新增的）。
- [ ] 测试名称描述行为，而非实现。

**架构**
- [ ] 变更遵循 `docs/architecture.md` 中的模块边界。
- [ ] UI/路由入口文件中没有业务逻辑。
- [ ] 领域逻辑中没有基础设施关注点（DB、API 调用）。
- [ ] 依赖方向向内流动（展示层 → 领域层 → 基础设施边界）。

**文档**
- [ ] 如果 API、行为或架构发生变化，`docs/` 已更新。
- [ ] 如果做了有意义的权衡，`docs/decisions.md` 已更新。
- [ ] 公共接口有清晰的类型或文档字符串。

---

### 8. 组件与模块拆分

**何时拆分**
- 文件超过约 200 行或函数超过约 50 行。
- 组件混合了数据获取、业务逻辑和渲染。
- 同一模块中存在多个无关关注点。
- 一个模块被许多无关的消费者导入。

**如何拆分**
- 按**职责**提取：数据访问、业务逻辑、展示、配置。
- 保持公共 API 小型化——只暴露消费者需要的内容。
- 将紧密耦合的部分放在一起；分离松散耦合的部分。
- 如果某个部分可复用，移到共享位置；如果是功能特定的，留在功能文件夹中。

---

### 9. 上下文与记忆管理

**保持方向感**
- **会话开始时**：阅读 `docs/spec.md`、`docs/architecture.md`、`docs/plan.md`、`docs/commands.md`。
- **每个子任务前**：如果上下文过期，重新阅读相关部分。
- **完成工作后**：更新 `docs/plan.md`（将项目移到完成，更新"进行中"和"下一步"）。

**保持连续性**
- 在 `docs/decisions.md` 中记录每个有意义的决策，含日期、上下文和原因。
- 当会话结束或上下文重置时，下一个会话可以从 `docs/` 中完全重建状态。
- 保持 `docs/plan.md` 作为动态文档——它是会话间的协调点。

---

### 10. 反幻觉规则

1. **断言前先验证。** 不要声称某个文件存在、某个函数可用或某个 API 能工作，除非你已经读取或执行过它。
2. **永远不要发明 API。** 使用任何函数、方法或端点前，先检查文档或源代码。
3. **不要假设依赖版本。** 从 `package.json`、`pyproject.toml` 或锁文件中读取实际版本。
4. **不确定时，说出来。** "我不确定——让我先验证"总比自信的错误答案强。
5. **展示你的工作。** 调试时，列出你检查了什么、发现了什么，而不是你猜测了什么。
6. **测试证明正确性，而非信心。** 通过的测试是证据；"应该能工作"不是。
7. **不要伪造终端输出。** 运行命令并报告实际结果。
8. **交叉核对变更。** 编辑后，重新阅读文件确认编辑是正确的。
9. **使用联网搜索验证外部事实。** 当库版本、API 签名或官方建议不确定时，搜索官方文档后再继续。不要猜测。
10. **使用 MCP 工具获取真实数据。** 如果工具可用（文件系统、git、GitHub、数据库），使用它获取实际状态，而不是从记忆中推断。

---

### 11. 工具使用指南

**联网搜索**

**使用时机：**
- 验证库或框架的当前稳定版本。
- 检查 API、函数或 CLI 标志是否在当前版本中存在。
- 确认官方建议（如 Next.js App Router 迁移、FastAPI 异步模式）。
- 研究已知问题或重大变更是否存在，然后再假设是本地 bug。

**不使用时机：**
- 答案已在代码库中（直接读文件）。
- 答案在 `docs/` 中（直接读文档）。
- 正在进行与当前任务无关的推测性研究。

**MCP 工具**

**使用时机：**
- 读写上下文窗口外的文件。
- 查询已连接的数据库或外部服务的真实状态。
- 通过 GitHub MCP 服务器与 GitHub 交互（PR、Issue、提交）。
- 终端不可用时运行 git 操作。

**边界：**
- 永远不要使用 MCP 工具绕过质量门控（lint、类型检查、测试、构建）。
- 不要读取敏感文件（凭证、密钥），除非任务明确要求。
- 当 MCP 工具返回数据时，将其视为真实状态——不要用缓存假设覆盖它。
- 如果 MCP 工具未配置或不可用，回退到终端命令。

**工具配置（可选）**  
如果你的团队使用 Claude Code，在项目根目录创建 `.mcp.json` 配置 MCP 服务器。安装后可在 `docs/mcp.json.example` 找到模板。

---

### 12. 完成定义

任务**完成**需满足以下**所有**条件：

- [ ] 代码编译/类型检查零错误。
- [ ] 所有测试通过（现有 + 新增）。
- [ ] Lint 和格式检查通过。
- [ ] 已变更的行为有测试覆盖。
- [ ] 如果 API、行为或架构发生变化，文档已更新。
- [ ] 如果做了有意义的权衡，决策已记录。
- [ ] 自我验证（§5）已成功完成。
- [ ] 最终摘要包含：**变更了什么**、**风险**和**如何验证**。

</details>
