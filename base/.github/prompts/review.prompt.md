---
mode: agent
description: Review code changes against the project's quality standards
---

# Review

You are performing a code review for this project.

## Context
Read these files first:
- `AGENTS.md` (especially §7 Code Review Checklist, §8 Component Splitting)
- `docs/architecture.md`
- `docs/spec.md`

## Input
You will receive either:
- A git diff
- A list of changed files
- A description of what was implemented

## Review Process

Walk through each section of the checklist from `AGENTS.md` §7:

### 1. Correctness
- Does the change match the spec or task description?
- Are edge cases and error paths handled?
- Is there any regression to existing behavior?

### 2. Quality
- Are functions and files reasonably small and focused?
- Is naming clear and domain-specific?
- Is there code duplication that should be extracted?
- Is there dead code, debug logs, or TODO hacks left behind?

### 3. Testing
- Is new/changed behavior covered by tests?
- Do all tests pass?
- Do test names describe behavior, not implementation?
- Are tests using real code where possible (not over-mocked)?

### 4. Architecture
- Does the change respect module boundaries from `docs/architecture.md`?
- Is business logic kept out of UI/route entry files?
- Are infrastructure concerns (DB, APIs) kept at the edges?
- Do dependencies flow inward?

### 5. Documentation
- Are docs updated if API, behavior, or architecture changed?
- Is `docs/decisions.md` updated if a meaningful tradeoff was made?
- Do public interfaces have clear types or docstrings?

## Output Format

```markdown
## Review Summary

### Strengths
- ...

### Issues

#### Critical (must fix before merge)
- [ ] ...

#### Important (should fix)
- [ ] ...

#### Minor (consider fixing)
- [ ] ...

### Assessment
Ready to merge / Needs changes / Needs discussion
```

## Rules
- Be specific — point to exact files and lines.
- For each issue, suggest a concrete fix.
- Do not rubber-stamp. Find at least one improvement opportunity.
- Do not flag style preferences that are not in the project's documented standards.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Review（代码审查）

你正在对这个项目进行代码审查。

### 上下文

先阅读这些文件：
- `AGENTS.md`（尤其是 §7 代码审查清单、§8 组件拆分）
- `docs/architecture.md`
- `docs/spec.md`

### 输入

你将收到以下之一：
- git diff
- 已修改文件列表
- 已实现内容的描述

### 审查流程

遍历 `AGENTS.md` §7 中清单的每一部分：

**1. 正确性**
- 变更是否符合规格或任务描述？
- 边界情况和错误路径是否已处理？
- 是否有对现有行为的回归？

**2. 质量**
- 函数和文件是否合理地小且职责单一？
- 命名是否清晰且领域专用？
- 是否有应该被提取的代码重复？
- 是否有遗留的死代码、调试日志或 TODO hack？

**3. 测试**
- 新/变更的行为是否有测试覆盖？
- 所有测试是否通过？
- 测试名称是否描述行为而非实现？
- 测试是否尽可能使用真实代码（而非过度 Mock）？

**4. 架构**
- 变更是否遵循 `docs/architecture.md` 中的模块边界？
- 业务逻辑是否没有混入 UI/路由入口文件？
- 基础设施关注点（DB、API）是否保持在边界处？
- 依赖方向是否向内流动？

**5. 文档**
- 如果 API、行为或架构发生变化，文档是否已更新？
- 如果做了有意义的权衡，`docs/decisions.md` 是否已更新？
- 公共接口是否有清晰的类型或文档字符串？

### 输出格式

```markdown
## 审查摘要

### 优点
- ...

### 问题

#### 严重（合并前必须修复）
- [ ] ...

#### 重要（应该修复）
- [ ] ...

#### 次要（建议修复）
- [ ] ...

### 评估
准备合并 / 需要修改 / 需要讨论
```

### 规则

- 具体说明——指向具体文件和行。
- 对每个问题，提供具体的修复建议。
- 不要走过场。至少找一个改进机会。
- 不要标记项目文档标准之外的风格偏好。

</details>
