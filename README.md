<!-- Language / 语言切换 -->
<div align="right">
  <a href="#english">English</a> | <a href="#中文">中文</a>
</div>

---

<a name="english"></a>

# AI Project Stack Kit

> One base, five stack overlays. Production-grade AI coding rules for any project.

Stack Kit gives every AI coding assistant (Claude Code, GitHub Copilot, Cursor, OpenClaw, Windsurf, and others) a shared understanding of your project's architecture, commands, and quality standards. Core rules are maintained once; each tech stack only overrides what's different.

## Why

AI assistants write better code when they know:
- **What** you're building (`docs/spec.md`)
- **Where** things live (`docs/architecture.md`)
- **How** to check their work (`docs/commands.md`)
- **What** decisions were made and why (`docs/decisions.md`)

Without this context, AI assistants hallucinate file paths, invent APIs, skip tests, and ignore your conventions. Stack Kit solves this by installing a structured `docs/` folder and tool-specific adapter files into your repository.

## Supported Stacks

| Profile | Use Case | Key Tools |
|---------|----------|-----------|
| `nextjs` | Full-stack web app (App Router) | Next.js, React, TypeScript, Vitest |
| `react`  | Client-side SPA / dashboard | Vite, React, TypeScript, Vitest |
| `vue`    | Vue 3 SPA | Vite, Vue 3, TypeScript, Vitest |
| `fastapi`| HTTP API / backend service | FastAPI, Pydantic, pytest, ruff, mypy |
| `python` | Library / CLI / worker / automation | pyproject.toml, src/ layout, pytest, ruff, mypy |

See [PROFILE_SELECTION.md](PROFILE_SELECTION.md) for detailed selection guidance.

## Quick Start

### Install into a project

```bash
bash scripts/install.sh <target-dir> <profile>
```

**Examples:**
```bash
bash scripts/install.sh ~/code/my-app    nextjs
bash scripts/install.sh ~/code/my-api   fastapi
bash scripts/install.sh ~/code/my-admin react
bash scripts/install.sh ~/code/my-vue   vue
bash scripts/install.sh ~/code/my-tool  python
```

### Options

```bash
bash scripts/install.sh ~/code/my-app nextjs --dry-run    # preview without writing
bash scripts/install.sh ~/code/my-app nextjs --force       # overwrite without prompt
bash scripts/install.sh ~/code/my-app nextjs --no-backup   # skip .bak files
```

### After installation

1. Fill `docs/spec.md` — describe your project's problem, users, and core flows.
2. Review `docs/commands.md` — adjust the commands for your actual setup.
3. Review `docs/architecture.md` — customize the module layout.
4. Start planning in `docs/plan.md` — add your first milestone.

## What Gets Installed

```
your-repo/
├── AGENTS.md                          # AI workflow rules (map-first, verify-always)
├── CLAUDE.md                          # Claude-specific adapter
├── .cursor/rules/00-core.mdc          # Cursor universal rules
├── .github/
│   ├── copilot-instructions.md        # GitHub Copilot instructions
│   ├── instructions/<profile>.instructions.md
│   └── prompts/
│       ├── plan.prompt.md             # Task planning agent prompt
│       ├── implement.prompt.md        # Implementation agent prompt
│       └── review.prompt.md           # Code review agent prompt
└── docs/
    ├── spec.md                        # Product spec (fill this first)
    ├── architecture.md                # Module boundaries, data flow, testing strategy
    ├── plan.md                        # Current milestone, active work, next steps
    ├── decisions.md                   # Architecture decision records (ADRs)
    ├── commands.md                    # Dev, test, lint, build commands
    └── skill-candidates.md            # Repeatable workflow candidates
```

## What the AI Rules Cover

| Rule | Section in `AGENTS.md` |
|------|------------------------|
| Read docs first, code second | §1 Before You Touch Code |
| Minimal diffs, no silent changes | §2 Core Principles |
| Break tasks into small verifiable pieces | §3 Task Splitting |
| Test-first implementation | §4 Implementation Workflow, §6 Testing Rules |
| Self-verify after every change | §5 Self-Verification |
| Structured code review checklist | §7 Code Review Checklist |
| When and how to split modules | §8 Component & Module Splitting |
| Maintain context across sessions | §9 Context & Memory Management |
| Prevent hallucinated code | §10 Anti-Hallucination Rules |
| Web search and MCP tool use | §11 Tool Use Guidelines |
| Clear definition of done | §12 Definition of Done |

## AI Tool Compatibility

Stack Kit works with any AI tool that reads markdown from the repo:

| Tool | Reads From |
|------|------------|
| Claude Code / Claude CLI | `AGENTS.md`, `CLAUDE.md`, `docs/` |
| GitHub Copilot | `.github/copilot-instructions.md`, `.github/prompts/` |
| Cursor | `.cursor/rules/00-core.mdc` |
| OpenClaw / Windsurf | `AGENTS.md`, `docs/` |
| Any LLM via manual prompt | Paste from `AGENTS.md` or `docs/` |

## Copilot Prompt Cheatsheet

15 ready-to-use prompt templates for common dev scenarios (new feature, bug fix, code review, refactor, tests, pre-commit check, and more) — see [`docs/copilot-cheatsheet.md`](docs/copilot-cheatsheet.md).

## Frontend Design Quality

For frontend profiles (`nextjs`, `react`, `vue`), Stack Kit includes the **`impeccable-frontend-design`** skill candidate — a design-quality workflow based on [pbakaus/impeccable](https://github.com/pbakaus/impeccable) (Apache 2.0, 4.4k ★).

It trains the AI to:

- **Define aesthetic direction first** — commit to a bold tone (brutalist, editorial, luxury…) before writing code
- **Avoid generic AI palettes** — no Inter/Roboto defaults, no cyan-on-dark, no purple-to-blue gradients
- **Apply modern CSS** — OKLCH color functions, `clamp()` fluid scales, container queries, `ease-out-quart` motion
- **Avoid anti-patterns explicitly** — no card-in-card nesting, no bounce easing, no decorative glassmorphism, no modals as first resort
- **Run the AI Slop Test** — if someone would immediately say "AI made this", revise before shipping

Audit commands available: `/audit`, `/critique`, `/normalize`, `/polish`, `/distill`, `/animate`, `/harden`, `/bolder`, `/quieter`.

## Design Principles

1. **Single source of truth.** `docs/` is the authority. `AGENTS.md` navigates to it. Tool adapters point to the same docs — they don't rewrite them.
2. **No duplication.** Rules live once in `AGENTS.md`. Tool adapters reference it.
3. **Thin overlays.** Each profile overrides only `docs/architecture.md`, `docs/commands.md`, and `docs/skill-candidates.md`. Everything else comes from base.
4. **Opt-in complexity.** No Tailwind, Pinia, React Query, SQLAlchemy, or Celery pre-installed. Add what you need, when you need it.
5. **Verify-always.** Every change must pass the quality gate before it's considered done.

## Contributing

PRs welcome. Please:
1. Keep base thin — add to profiles, not base, for stack-specific rules.
2. Don't add second-layer library opinions (no specific CSS framework, state library, ORM, etc.).
3. Test the install script: `bash scripts/install.sh /tmp/test-repo <profile>`.

## License

MIT

---

<a name="中文"></a>

<details>
<summary><strong>📖 中文文档（点击展开）</strong></summary>

<br>

# AI Project Stack Kit

> 一个 base，五个技术栈覆盖层。为任意项目提供生产级 AI 编码规范。

Stack Kit 让每一个 AI 编程助手（Claude Code、GitHub Copilot、Cursor、OpenClaw、Windsurf 等）都能理解你项目的架构、命令和质量标准。核心规则只维护一次，每个技术栈只覆盖差异部分。

## 为什么需要它

AI 助手在知道以下信息时写出更好的代码：
- **在构建什么**（`docs/spec.md`）
- **文件在哪里**（`docs/architecture.md`）
- **如何检验工作**（`docs/commands.md`）
- **做了哪些决策，以及为什么**（`docs/decisions.md`）

缺少这些上下文，AI 助手会捏造路径、发明不存在的 API、跳过测试、无视项目约定。Stack Kit 通过在仓库中安装结构化的 `docs/` 文件夹和工具适配文件来解决这个问题。

## 支持的技术栈

| Profile | 适用场景 | 主要工具 |
|---------|---------|---------|
| `nextjs`  | 全栈 Web 应用（App Router） | Next.js, React, TypeScript, Vitest |
| `react`   | 纯前端 SPA / 管理后台 | Vite, React, TypeScript, Vitest |
| `vue`     | Vue 3 SPA | Vite, Vue 3, TypeScript, Vitest |
| `fastapi` | HTTP API / 后端服务 | FastAPI, Pydantic, pytest, ruff, mypy |
| `python`  | 库 / CLI / worker / 自动化脚本 | pyproject.toml, src/ 布局, pytest, ruff, mypy |

详细选型指南见 [PROFILE_SELECTION.md](PROFILE_SELECTION.md)。

## 快速开始

### 安装到项目

```bash
bash scripts/install.sh <目标目录> <profile>
```

**示例：**
```bash
bash scripts/install.sh ~/code/my-app    nextjs
bash scripts/install.sh ~/code/my-api   fastapi
bash scripts/install.sh ~/code/my-admin react
bash scripts/install.sh ~/code/my-vue   vue
bash scripts/install.sh ~/code/my-tool  python
```

### 可选参数

```bash
bash scripts/install.sh ~/code/my-app nextjs --dry-run    # 预览，不写入文件
bash scripts/install.sh ~/code/my-app nextjs --force       # 覆盖已有文件，不提示
bash scripts/install.sh ~/code/my-app nextjs --no-backup   # 跳过 .bak 备份
```

### 安装后建议

1. 填写 `docs/spec.md` — 描述项目问题、目标用户和核心流程
2. 修改 `docs/commands.md` — 把占位命令换成实际命令
3. 修改 `docs/architecture.md` — 调整模块布局
4. 在 `docs/plan.md` 中开始规划 — 添加第一个里程碑

## 安装后的文件结构

```
your-repo/
├── AGENTS.md                          # AI 工作流规则（先读图、验证后提交）
├── CLAUDE.md                          # Claude 专属适配
├── .cursor/rules/00-core.mdc          # Cursor 通用规则
├── .github/
│   ├── copilot-instructions.md        # GitHub Copilot 指令
│   ├── instructions/<profile>.instructions.md
│   └── prompts/
│       ├── plan.prompt.md             # 任务规划 Agent prompt
│       ├── implement.prompt.md        # 实现 Agent prompt
│       └── review.prompt.md           # 代码审查 Agent prompt
└── docs/
    ├── spec.md                        # 产品规格（优先填写）
    ├── architecture.md                # 模块边界、数据流、测试策略
    ├── plan.md                        # 当前里程碑、进行中任务、下一步
    ├── decisions.md                   # 架构决策记录（ADR）
    ├── commands.md                    # 开发、测试、lint、构建命令
    └── skill-candidates.md            # 可复用工作流候选
```

## AI 规则覆盖范围

| 规则 | 对应 `AGENTS.md` 章节 |
|------|----------------------|
| 先读文档，再写代码 | §1 动手之前 |
| 最小改动，无静默副作用 | §2 核心原则 |
| 任务拆分为可验证的小块 | §3 任务拆分 |
| 测试先行 | §4 实现流程 + §6 测试规则 |
| 每次改动后自我验证 | §5 自我验证 |
| 结构化代码审查清单 | §7 代码审查 |
| 何时拆分模块 | §8 组件与模块拆分 |
| 跨会话保持上下文 | §9 上下文与记忆管理 |
| 防止代码幻觉 | §10 反幻觉规则 |
| 联网搜索与 MCP 工具使用 | §11 工具使用指南 |
| 明确的完成定义 | §12 完成定义 |

## 兼容的 AI 工具

| 工具 | 读取文件 |
|------|---------|
| Claude Code / Claude CLI | `AGENTS.md`, `CLAUDE.md`, `docs/` |
| GitHub Copilot | `.github/copilot-instructions.md`, `.github/prompts/` |
| Cursor | `.cursor/rules/00-core.mdc` |
| OpenClaw / Windsurf | `AGENTS.md`, `docs/` |
| 任意 LLM 手动粘贴 | 从 `AGENTS.md` 或 `docs/` 中复制 |

## Copilot 指令速查卡

15 个即用型 prompt 模板，覆盖常见开发场景（新功能、修 Bug、代码审查、重构、补测试、提交前检查等），见 [`docs/copilot-cheatsheet.md`](docs/copilot-cheatsheet.md)。

## 前端设计质量

前端 profile（`nextjs`、`react`、`vue`）内置 **`impeccable-frontend-design`** 技能候选 — 基于 [pbakaus/impeccable](https://github.com/pbakaus/impeccable)（Apache 2.0，4.4k ★）的设计质量工作流。

它训练 AI 助手：

- **先确定审美方向** — 在写任何代码之前，先确定粗犷、编辑风、奢华等风格方向
- **避免通用 AI 配色** — 不用 Inter/Roboto 默认字体，不用深色背景+霓虹色，不用紫蓝渐变
- **应用现代 CSS 实践** — OKLCH 色彩函数、`clamp()` 流体尺度、容器查询、`ease-out-quart` 动效
- **明确回避反模式** — 不嵌套卡片、不用弹性缓动、不滥用毛玻璃、不把 Modal 作为首选
- **执行"AI 滥造测试"** — 如果别人一眼能说出"这是 AI 做的"，就重新设计

可用审计命令：`/audit`、`/critique`、`/normalize`、`/polish`、`/distill`、`/animate`、`/harden`、`/bolder`、`/quieter`。

## 设计原则

1. **单一事实源**：`docs/` 是权威来源，`AGENTS.md` 做导航，工具适配层指向同一份文档。
2. **无重复**：规则只在 `AGENTS.md` 中写一次，工具适配层做引用，不重写。
3. **薄覆盖层**：每个 profile 只覆盖 `docs/architecture.md`、`docs/commands.md` 和 `docs/skill-candidates.md`，其余来自 base。
4. **按需引入复杂度**：不预装 Tailwind、Pinia、React Query、SQLAlchemy、Celery 等，需要时再加。
5. **永远验证**：每次改动必须通过质量门控才算完成。

## 贡献

欢迎 PR。请注意：
1. 保持 base 轻量 — 技术栈专属规则放到 profiles，不要放到 base。
2. 不要加第二层库意见（不指定具体的 CSS 框架、状态库、ORM 等）。
3. 测试安装脚本：`bash scripts/install.sh /tmp/test-repo <profile>`。

## 许可证

MIT

</details>
