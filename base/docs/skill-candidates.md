# Skill Candidates

Only promote a workflow into a formal Skill after it has been repeated enough to justify the overhead. A premature Skill adds maintenance burden without saving time.

---

## Evaluation Criteria

Before promoting, confirm:
- [ ] The workflow has been executed at least 3 times manually.
- [ ] The steps are stable — they haven't changed significantly between executions.
- [ ] Automation would save meaningful time (> 5 minutes per execution).
- [ ] The inputs and outputs are well-defined and predictable.

---

## Candidate Template

```
### Skill Name

**Trigger:** When does this workflow start?
**Inputs:** What information is needed?
**Steps:**
1. ...
2. ...
3. ...
**Output:** What is produced?
**Verification:** How do you know it worked?
**Automation potential:** Script / Prompt / Manual checklist
```

---

## Universal Candidates

These are stack-agnostic workflows that apply to most projects:

### 1. feature-scaffold
- **Trigger:** New feature requested with a short spec or user story.
- **Inputs:** Feature name, spec description, target module.
- **Steps:**
  1. Create folder structure per `docs/architecture.md`.
  2. Add placeholder files (component/service/route + test + types).
  3. Register in routing / exports / index.
  4. Add skeleton test.
- **Output:** Compilable scaffold with one passing skeleton test.
- **Verification:** `typecheck` + `test` pass.

### 2. test-diagnose-repair
- **Trigger:** One or more tests are failing.
- **Inputs:** Failing test names / file paths, error output.
- **Steps:**
  1. Read the failing test and its error message.
  2. Identify root cause (regression, environment, flaky, spec change).
  3. Write a fix plan (test change, code change, or both).
  4. Apply fix.
  5. Run tests — confirm green.
  6. Run full quality gate.
- **Output:** All tests green, summary of root cause and fix.
- **Verification:** Full quality gate passes.

### 3. code-review
- **Trigger:** Before submitting a PR or after completing a task.
- **Inputs:** Diff or list of changed files.
- **Steps:**
  1. Walk through AGENTS.md §7 checklist (correctness, quality, testing, architecture, docs).
  2. Flag issues as Critical / Important / Minor.
  3. For each Critical/Important issue, provide a specific fix suggestion.
  4. Summarize: strengths, issues, overall assessment.
- **Output:** Structured review with actionable feedback.
- **Verification:** All Critical issues resolved before merge.

### 4. pr-summary
- **Trigger:** Generate PR description from a diff.
- **Inputs:** Git diff, related spec or task description.
- **Steps:**
  1. Summarize what changed and why.
  2. List affected modules / routes / APIs.
  3. Note any breaking changes or migration steps.
  4. List testing done and testing needed.
  5. Assess rollout risk (low / medium / high).
- **Output:** Markdown PR description ready to paste.
- **Verification:** Human review.

### 5. decision-record
- **Trigger:** A meaningful technical tradeoff was made.
- **Inputs:** Context, options considered, chosen option.
- **Steps:**
  1. Use the template in `docs/decisions.md`.
  2. Fill context, decision, consequences, alternatives.
  3. Add date and status.
- **Output:** New entry in `docs/decisions.md`.
- **Verification:** Entry is complete and rationale is clear.

### 6. web-search-verify
- **Trigger:** Uncertain about a library version, API signature, CLI flag, or official recommendation.
- **Inputs:** Package name / API name / topic, current assumption.
- **Steps:**
  1. Search the official docs or changelog for the relevant version.
  2. Compare with what's in `package.json` / `pyproject.toml`.
  3. If a discrepancy found: propose the correct usage.
  4. If up to date: proceed with original plan.
- **Output:** Verified fact with source URL, or corrected approach.
- **Verification:** Fact is sourced from official documentation, not from memory.
- **Automation potential:** Prompt — trigger with "verify version of X" or "check if API Y exists in version Z".

### 7. mcp-tool-use
- **Trigger:** Task requires real state from outside the visible context: filesystem listing, git history, GitHub issue/PR details, or database schema.
- **Inputs:** Task description, which MCP server to use.
- **Steps:**
  1. Confirm the relevant MCP server is configured in `.mcp.json`.
  2. Use the tool to fetch real state (do not infer from memory).
  3. Validate the returned data is relevant before acting on it.
  4. Proceed with implementation using real data.
  5. If the tool is unavailable, fall back to the terminal command from `docs/commands.md`.
- **Output:** Task completed with verified real-world state, not assumptions.
- **Verification:** The action was based on tool-returned data, not inferred.
- **Automation potential:** Prompt — trigger with "check the current state of X" or "list files in Y".

---

## Frontend Design Candidates

These candidates apply to frontend profiles only (`nextjs`, `react`, `vue`).

### 8. impeccable-frontend-design
- **Trigger:** Building or reviewing a UI page, component, or design system. Use before shipping any non-trivial UI.
- **Inputs:** Target component/page or scope (e.g., "homepage hero", "checkout form"), design goal.
- **Steps:**
  1. Define aesthetic direction (tone, constraints, differentiation) before writing code.
  2. Typography: pair distinctive fonts, use modular scale with fluid sizing (`clamp()`), vary weights for hierarchy.
  3. Color: use OKLCH/`color-mix()`, tint neutrals toward brand hue, avoid pure black/white and generic AI palette (cyan-on-dark, purple-to-blue gradients, neon accents).
  4. Layout: create spacing rhythm, embrace asymmetry, avoid card-in-card nesting, avoid identical icon-grid cards.
  5. Motion: exponential easing (`ease-out-quart/quint/expo`), animate `transform`/`opacity` only — never layout properties.
  6. Interaction: progressive disclosure, optimistic UI, empty states that teach.
  7. Run **AI Slop Test**: would someone immediately say "AI made this"? If yes, revise.
  8. Run `/audit` (a11y, performance, responsive); finish with `/polish` before shipping.
- **Output:** Visually distinctive, production-grade UI that avoids generic AI aesthetics.
- **Verification:** AI Slop Test fails (good outcome). `/audit` passes with no critical issues.
- **Automation potential:** Prompt — use Impeccable commands: `/audit`, `/critique`, `/normalize`, `/polish`, `/distill`, `/animate`, `/harden`, `/bolder`, `/quieter`.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable) — 1 skill, 17 commands, curated anti-patterns. Apache 2.0.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Skill 候选清单

只有在一个工作流被手动重复执行足够多次、能够证明其维护开销是值得的之后，才将其提升为正式 Skill。过早创建 Skill 会增加维护负担而没有实际节省时间。

### 评估标准

提升前确认：
- [ ] 该工作流已被手动执行至少 3 次。
- [ ] 步骤稳定——多次执行之间没有显著变化。
- [ ] 自动化能节省有意义的时间（每次执行 > 5 分钟）。
- [ ] 输入和输出定义明确且可预测。

### 候选 Skill 模板

```
### Skill 名称

**触发条件：** 该工作流何时开始？
**输入：** 需要哪些信息？
**步骤：**
1. ...
2. ...
3. ...
**输出：** 产生什么结果？
**验证：** 如何确认它生效了？
**自动化潜力：** 脚本 / Prompt / 手动清单
```

### 通用候选 Skill

这些是不依赖技术栈的工作流，适用于大多数项目：

**1. feature-scaffold（特性脚手架）**
- **触发：** 收到带简短规格或用户故事的新特性请求。
- **输入：** 特性名称、规格描述、目标模块。
- **步骤：** 按 architecture.md 创建目录 → 添加占位文件 → 注册路由/导出 → 添加骨架测试。
- **输出：** 可编译的脚手架，带一个通过的骨架测试。

**2. test-diagnose-repair（测试诊断修复）**
- **触发：** 一个或多个测试失败。
- **输入：** 失败的测试名称/文件路径、错误输出。
- **步骤：** 读取失败测试 → 定位根因 → 编写修复计划 → 执行修复 → 确认全部通过。
- **输出：** 所有测试绿色，根因和修复摘要。

**3. code-review（代码审查）**
- **触发：** 提交 PR 前或完成任务后。
- **输入：** diff 或变更文件列表。
- **步骤：** 遍历 AGENTS.md §7 清单 → 按严重性标记问题 → 提供修复建议 → 输出总结。
- **输出：** 带可执行反馈的结构化审查。

**4. pr-summary（PR 摘要）**
- **触发：** 从 diff 生成 PR 描述。
- **输入：** Git diff、相关规格或任务描述。
- **步骤：** 总结变更内容和原因 → 列出受影响模块 → 注明破坏性变更 → 评估上线风险。
- **输出：** 可直接粘贴的 Markdown PR 描述。

**5. decision-record（决策记录）**
- **触发：** 做出了有意义的技术权衡。
- **步骤：** 使用 docs/decisions.md 模板 → 填写上下文、决策、后果、备选方案。
- **输出：** docs/decisions.md 中新增条目。

**6. web-search-verify（网络搜索验证）**
- **触发：** 对库版本、API 签名、CLI 参数或官方推荐不确定。
- **步骤：** 搜索官方文档 → 与 pyproject.toml/package.json 比对 → 提出正确用法或确认。
- **输出：** 有来源 URL 的已验证事实，或更正后的方案。

**7. mcp-tool-use（MCP 工具使用）**
- **触发：** 任务需要来自可视上下文之外的真实状态：文件系统列表、git 历史等。
- **步骤：** 确认 MCP Server 已配置 → 使用工具获取真实状态（不推断）→ 验证数据相关性后操作。
- **输出：** 基于工具返回数据（而非假设）完成的任务。

**8. impeccable-frontend-design（精良前端设计）**
- **触发：** 新页面/UI 组件，或发布前设计审查。
- **步骤：** 定义美学方向 → 排版流式缩放 → OKLCH 色彩体系 → 间距系统 → 有意义的动效 → AI 俗气测试 → /audit 无障碍检查。
- **输出：** 具有独特视觉特征的生产级 UI，通过 AI 俗气测试和 /audit 审查。
- **参考：** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)

</details>
