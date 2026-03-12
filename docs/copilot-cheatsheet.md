# Copilot Prompt Cheatsheet / Copilot 指令速查卡

> **Default prefix / 默认前缀:**  
> Follow this repo's conventions: read `AGENTS.md`, `.github/copilot-instructions.md`, and relevant docs first. Make only minimal changes. Provide a plan first, then implement, then verification steps.

Works with: GitHub Copilot Chat / Agent, Cursor, Claude Code.  
适用场景：GitHub Copilot Chat / Agent、Cursor、Claude Code。

---

## 1. General Development / 默认开发

```text
Follow this repo's conventions: read AGENTS.md, .github/copilot-instructions.md, and relevant docs first. Make only minimal changes. Provide a plan first, then implement, then verification steps.
```

---

## 2. New Feature / 新功能开发

```text
Follow this repo's conventions: read AGENTS.md, relevant docs, and the current module code. Give me a minimal implementation plan; once confirmed, implement it directly and add the necessary tests and verification steps.
```

Concise variant / 精简版:

```text
Implement this requirement following repo conventions. Make only the minimal necessary changes — don't refactor unrelated code.
```

---

## 3. Bug Fix / 修 Bug

```text
Follow this repo's conventions to diagnose this issue: identify the root cause first, then provide a minimal fix, then apply it and explain how to verify the fix is effective.
```

Diagnose only (no code changes) / 只诊断不改代码:

```text
Follow this repo's conventions to diagnose this bug first — do not change any code yet. Give me the root cause, impact scope, and minimal fix plan.
```

---

## 4. Plan First / 先出方案

```text
Follow this repo's conventions — do not write code yet. Give me a minimal implementation plan, affected files, risks, and verification approach.
```

Multi-option comparison / 多方案对比:

```text
Following repo conventions, give me 2–3 implementation options, compare them by complexity, maintainability, and change scope, and recommend the minimal viable option.
```

---

## 5. Incremental Changes / 增量修改现有代码

```text
Follow this repo's conventions to make incremental changes to the existing implementation. Reuse current module patterns and don't introduce new abstractions unless the existing structure is clearly unsuitable.
```

Strictly follow existing style / 严格沿用现有风格:

```text
Follow repo conventions to modify this code. Strictly follow existing naming, directory structure, and implementation style. Don't introduce new architectural patterns.
```

---

## 6. Write Tests / 写测试

```text
Follow this repo's conventions to add the necessary tests for this change. Prioritize coverage of core behavior, edge cases, and branches likely to regress.
```

List test plan first / 先列测试方案:

```text
Following repo conventions, tell me what test cases should be added for this change — don't write the implementation yet.
```

Only the essential tests / 只补最必要测试:

```text
Following repo conventions, add only the essential tests. Don't pile on low-value cases just for coverage.
```

---

## 7. Code Review / 代码审查

```text
Follow this repo's conventions to review the current changes. Focus on correctness, potential regressions, test gaps, edge cases, and architectural constraint violations.
```

Strict mode / 严格版:

```text
Do a strict code review following repo conventions: list all issues first, sort by severity, and provide minimal fix suggestions for each.
```

Using the review prompt / 使用 review prompt:

```text
Use the standard from review.prompt.md to review the current diff.
```

---

## 8. Small Refactoring / 小范围重构

```text
Follow this repo's conventions to refactor this code to improve readability and maintainability without changing external behavior. State the refactoring boundaries first, then implement.
```

Minimal scope / 更克制版:

```text
Follow repo conventions for a small-scope refactor. Tidy only the current function or module — don't spread to unrelated files.
```

---

## 9. Performance Optimization / 性能优化

```text
Follow this repo's conventions to analyze the performance of this code. Find bottlenecks and evidence first, then give a minimal optimization plan. Avoid premature optimization.
```

Direct optimization / 直接优化:

```text
Make a minimal performance optimization here following repo conventions. Preserve existing behavior and explain how to verify the before/after.
```

---

## 10. Frontend Page / 前端页面开发

```text
Follow this repo's conventions to implement this page. Prioritize reusing existing components and style patterns. Keep interactions complete and add the necessary state and error handling.
```

Form page / 表单页:

```text
Follow repo conventions to implement this form page. Include validation, loading state, error state, and success feedback — only the minimal necessary interactions.
```

---

## 11. Backend Endpoint / 后端接口开发

```text
Follow this repo's conventions to implement this endpoint. Include request validation, error handling, response structure, and necessary tests. Reuse existing routing and service layer patterns as much as possible.
```

Scope limit / 只改接口相关部分:

```text
Follow repo conventions. Only modify the route, service, and tests related to this endpoint — don't spread changes to unrelated modules.
```

---

## 12. Type / Schema / Data Model Change / 类型调整

```text
Follow this repo's conventions to adjust this data structure. Keep upstream and downstream types consistent. List all affected locations and files that need to be updated.
```

Check impact scope first / 先查影响范围:

```text
Follow repo conventions to check the impact scope of this type or model change. List everything first, then update each one.
```

---

## 13. Documentation Update / 文档更新

```text
Follow this repo's conventions to add concise documentation for this change. Focus on purpose, entry points, key constraints, and common gotchas for developers.
```

Docs only / 只更新文档:

```text
Follow repo conventions to update relevant docs. Keep content concise — only add information directly related to this change.
```

---

## 14. Pre-Commit Check / 提交前检查

```text
Follow this repo's conventions to do a pre-commit check on the current changes. List the commands I should run, risks to confirm, and whether this change is missing tests or documentation.
```

Summarize for PR / 顺手整理 PR 内容:

```text
Following repo conventions, summarize this change: give me a PR title, change summary, risk notes, and verification steps.
```

---

## 15. Two High-Frequency Control Phrases / 两个高频控制句

Don't change code yet / 先别改代码:

```text
Don't change any code yet. Following repo conventions, analyze the problem and give me a minimal plan, affected files, and verification method.
```

Just do it / 直接执行:

```text
Follow repo conventions to implement the minimal viable solution directly. Skip lengthy explanations. When done, give me only the change summary and verification steps.
```

---

## Quick Reference — 8 Most-Used Prompts / 最常用的 8 句

### General
```text
Follow this repo's conventions: read AGENTS.md, .github/copilot-instructions.md, and relevant docs first. Make only minimal changes. Provide a plan first, then implement, then verification steps.
```

### New feature
```text
Implement this requirement following repo conventions, make only the minimal necessary changes.
```

### Bug fix
```text
Debug this following repo conventions: identify root cause first, make minimal fix, tell me how to verify.
```

### Plan first
```text
Don't write code yet. Following repo conventions, give me the minimal implementation plan, affected files, risks, and verification approach.
```

### Code review
```text
Review the current changes following repo conventions, focusing on correctness, regression risk, test gaps, and architectural boundaries.
```

### Tests
```text
Add necessary tests for this change following repo conventions. Prioritize core behavior and edge cases.
```

### Small refactor
```text
Do a small-scope refactor following repo conventions. Don't change behavior and don't spread to unrelated modules.
```

### Pre-commit check
```text
Check if the current changes are ready to commit following repo conventions. Tell me what's still missing.
```

---

## Useful Constraint Phrases / 常用限制词

Limit change scope / 限制改动范围:
```text
Only modify files directly related to the current task.
```

Prevent style drift / 限制风格漂移:
```text
Follow existing code style and directory structure. Don't introduce new patterns.
```

Reduce explanations / 减少解释:
```text
Less explanation, just do it.
```

Plan before change / 先计划再改:
```text
Give me the plan first. Wait for my confirmation before making changes.
```

Execute directly / 直接实施:
```text
Don't wait for my confirmation. Implement the minimal plan directly.
```

---

## Simplest Mental Model / 最简单的记忆法

Just remember 4 categories / 只记四类:

- **Do feature** / 做功能 → `Implement this requirement`
- **Fix problem** / 修问题 → `Debug and minimal fix`
- **See plan** / 看方案 → `Don't write code yet, give me the plan`
- **Do check** / 做检查 → `Review / test / pre-commit check`

Then prefix everything with / 然后统一在前面加:

```text
Follow this repo's conventions.
```

---

<details>
<summary>🌐 中文版 / Chinese Version</summary>

## 默认开发

```text
按本仓库规范工作：先读取 AGENTS.md、.github/copilot-instructions.md 和相关 docs，只做最小改动；先给计划，再实施，最后给验证步骤。
```

## 新功能开发

```text
按本仓库规范工作：先读取 AGENTS.md、相关 docs 和当前模块代码，给我一个最小实现计划；确认后直接实现，并补上必要测试与验证步骤。
```

精简版：

```text
按仓库规范实现这个需求，只做最小必要改动，不要顺手重构无关代码。
```

## 修 Bug

```text
按本仓库规范排查这个问题：先定位根因，再给最小修复方案，然后直接修改代码，并说明如何验证修复有效。
```

只诊断不改代码：

```text
按本仓库规范先诊断这个 bug，先不要改代码；给我根因、影响范围和最小修复方案。
```

## 先出方案

```text
按本仓库规范先不要写代码；给我这个需求的最小实施计划、涉及文件、风险点和验证方式。
```

## 增量修改现有代码

```text
按本仓库规范基于现有实现做增量修改，尽量复用当前模块模式，不新开抽象，除非现有结构明显不适合。
```

## 写测试

```text
按本仓库规范为这次改动补必要测试，优先覆盖核心行为、边界条件和容易回归的分支。
```

## Code Review

```text
按本仓库规范审查当前改动，重点看正确性、潜在回归、测试缺口、边界条件和是否违反架构约束。
```

## 小范围重构

```text
按本仓库规范重构这段代码，目标是提升可读性和可维护性，不改变对外行为；先说明重构边界，再实施。
```

## 性能优化

```text
按本仓库规范分析这段代码的性能问题，先找瓶颈和证据，再给最小优化方案，避免过早优化。
```

## 前端页面开发

```text
按本仓库规范实现这个页面，优先复用现有组件和样式模式，保持交互完整，并补充必要状态与异常处理。
```

## 后端接口开发

```text
按本仓库规范实现这个接口，包含请求校验、错误处理、返回结构和必要测试，尽量沿用现有路由与服务层模式。
```

## 类型 / Schema / 数据模型调整

```text
按本仓库规范调整这里的数据结构，保持上下游类型一致，并列出受影响的位置和需要同步修改的文件。
```

## 文档更新

```text
按本仓库规范为这次改动补简洁文档，重点写用途、入口、关键约束和开发者最容易踩坑的点。
```

## 提交前检查

```text
按本仓库规范对当前改动做提交前检查：列出我应该跑的命令、需要确认的风险点，以及这次改动是否还缺测试或文档。
```

## 两个高频控制句

先别改代码：

```text
先不要改代码；按本仓库规范分析问题，给我最小方案、涉及文件和验证方法。
```

直接执行：

```text
按本仓库规范直接实施最小可行方案，不要展开大段解释；完成后只给我改动摘要和验证步骤。
```

## 常用限制词

```text
只改与当前任务直接相关的文件。
沿用现有代码风格和目录结构，不引入新模式。
少解释，直接做。
先给计划，等我确认再改。
不用等我确认，直接按最小方案实施。
```

</details>
