---
mode: agent
description: Implement a subtask with test-first workflow and self-verification
---

# Implement

You are implementing a specific subtask in this project.

## Context
Read these files first:
- `AGENTS.md` (especially §4 Implementation Workflow, §5 Self-Verification, §6 Testing Rules)
- `docs/architecture.md`
- `docs/commands.md`

## Workflow

Follow this order strictly:

### Step 1 — Understand
- Read the subtask description and any related spec.
- Identify which files will be changed or created.
- Confirm the change fits `docs/architecture.md` boundaries.

### Step 2 — Test First
- Write or update the test that covers the new/changed behavior.
- Run it — confirm it **fails** for the right reason (feature missing, not syntax error).

### Step 3 — Implement
- Write the **minimal** code to make the test pass.
- No speculative features. No "while I'm here" changes.
- Keep functions under 50 lines, files under 200 lines.

### Step 4 — Verify
Run the full quality gate in order:
```bash
# Replace with actual commands from docs/commands.md
lint
typecheck
test
build
```
All must pass before proceeding.

### Step 5 — Document
- Update `docs/` if behavior, API, or architecture changed.
- Add an entry to `docs/decisions.md` if a meaningful tradeoff was made.

### Step 6 — Summary
Report:
- **What changed:** files and behavior
- **How verified:** which checks passed
- **Risks:** anything that could break or needs follow-up

## Anti-Hallucination
- Do not reference files or functions without reading them first.
- Do not fabricate command output — run and report actual results.
- If a test still fails, fix it. Do not report success without evidence.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Implement（实现）

你正在实现这个项目中的一个具体子任务。

### 上下文

先阅读这些文件：
- `AGENTS.md`（尤其是 §4 实现工作流、§5 自我验证、§6 测试规则）
- `docs/architecture.md`
- `docs/commands.md`

### 工作流

严格按照以下顺序：

**步骤 1 — 理解**
- 阅读子任务描述和相关规格。
- 确定哪些文件将被修改或创建。
- 确认变更符合 `docs/architecture.md` 的边界。

**步骤 2 — 先写测试**
- 写或更新覆盖新/变更行为的测试。
- 运行它——确认它以正确的原因**失败**（功能缺失，而非语法错误）。

**步骤 3 — 实现**
- 写让测试通过的**最小**代码。
- 没有推测性功能。没有"顺手"的改动。
- 函数不超过 50 行，文件不超过 200 行。

**步骤 4 — 验证**

运行完整质量门控（按顺序）：
```bash
# 用 docs/commands.md 中的实际命令替换
lint
typecheck
test
build
```
所有检查通过后才能继续。

**步骤 5 — 文档**
- 如果行为、API 或架构发生变化，更新 `docs/`。
- 如果做了有意义的权衡，在 `docs/decisions.md` 中添加条目。

**步骤 6 — 摘要**

报告：
- **变更了什么：** 文件和行为
- **如何验证：** 哪些检查通过了
- **风险：** 任何可能破坏或需要后续跟进的内容

### 反幻觉

- 不要在未阅读的情况下引用文件或函数。
- 不要伪造命令输出——运行并报告实际结果。
- 如果测试仍然失败，修复它。没有证据就不报告成功。

</details>
