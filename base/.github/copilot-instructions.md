# Copilot Instructions

This repository uses a map-first workflow. Read `AGENTS.md` for the complete rules.

## Key Files
- `AGENTS.md` — workflow rules, code review checklist, anti-hallucination rules
- `docs/spec.md` — what we're building
- `docs/architecture.md` — module boundaries and conventions
- `docs/plan.md` — current work and next steps
- `docs/commands.md` — exact dev/test/lint/build commands
- `docs/decisions.md` — past tradeoffs

## Rules for Code Generation

1. **Read before writing.** Understand the spec and architecture before generating code.
2. **Minimal changes.** Generate only what the task requires — no speculative features.
3. **Follow existing patterns.** Match the project's naming, structure, and style conventions.
4. **Test coverage.** If generating a feature, generate or update tests alongside it.
5. **No hallucination.** Do not reference files, functions, or APIs that don't exist in the codebase. When in doubt, check first.
6. **Small functions.** Keep generated functions under 50 lines, files under 200 lines. Split by responsibility.
7. **Domain naming.** Use specific, descriptive names — avoid `utils`, `helpers`, `data`, `stuff`.
8. **Error handling.** Always handle error paths, not just happy paths.
9. **Type safety.** Prefer typed code. Use explicit types at function boundaries.
10. **Self-verify.** After changes, run the quality gate: lint → typecheck → test → build.

## Code Review
When reviewing code, use the checklist in `AGENTS.md` §7:
- Correctness, Quality, Testing, Architecture, Documentation.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Copilot 指令

本仓库使用先读地图的工作流。完整规则见 `AGENTS.md`。

### 关键文件

- `AGENTS.md` — 工作流规则、代码审查清单、反幻觉规则
- `docs/spec.md` — 我们在构建什么
- `docs/architecture.md` — 模块边界和约定
- `docs/plan.md` — 当前工作和下一步
- `docs/commands.md` — 精确的开发/测试/lint/构建命令
- `docs/decisions.md` — 过去的权衡

### 代码生成规则

1. **写之前先读。** 生成代码前理解规格和架构。
2. **最小变动。** 只生成任务要求的内容——不做推测性功能。
3. **遵循现有模式。** 匹配项目的命名、结构和风格约定。
4. **测试覆盖。** 生成功能时，同时生成或更新测试。
5. **无幻觉。** 不要引用代码库中不存在的文件、函数或 API。不确定时先检查。
6. **小函数。** 生成的函数不超过 50 行，文件不超过 200 行。按职责拆分。
7. **领域命名。** 使用具体的描述性名称——避免 `utils`、`helpers`、`data`、`stuff`。
8. **错误处理。** 始终处理错误路径，不只是正常路径。
9. **类型安全。** 优先使用有类型的代码。在函数边界使用显式类型。
10. **自我验证。** 变更后，运行质量门控：lint → 类型检查 → 测试 → 构建。

### 代码审查

审查代码时，使用 `AGENTS.md` §7 中的清单：
- 正确性、质量、测试、架构、文档。

</details>
