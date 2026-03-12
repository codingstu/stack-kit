# Architecture — React Profile

This profile assumes a **client-side React application built with Vite**, not a full-stack framework. Ideal for SPAs, internal dashboards, and shared UI packages.

## Default Shape

```
src/
  app/                  # app shell, providers, router setup
  routes/               # route-level components (pages)
  features/             # feature modules (co-located logic, hooks, components)
  components/           # shared, reusable UI components
  hooks/                # shared custom hooks
  lib/                  # API clients, constants, shared utilities
  types/                # shared TypeScript types
  styles/               # global styles, theme tokens
tests/
  unit/
  e2e/
```

## Working Rules

### Component Architecture
- **Route components** (`routes/`): thin composition — assemble features and layout, minimal logic.
- **Feature components** (`features/`): co-locate domain logic, state, hooks, and feature-specific UI.
- **Shared components** (`components/`): reusable, stateless or locally stateful, well-typed props.
- One component per file when the component is reused or exceeds 80 lines.
- Props interfaces must be explicit — no `any`, no unlabeled spread.

### State Management
- Start with **local state** (`useState`, `useReducer`).
- Lift state only when two or more distant components need the same data.
- Introduce shared state (Zustand, Jotai, Redux, etc.) only when local state and prop drilling become unmanageable — record the decision in `docs/decisions.md`.
- Do not default to global state. Most state is local.

### Data Fetching
- Keep API calls in `lib/` or feature data modules — never inline in presentation components.
- Use a data-fetching library (React Query, SWR, etc.) if the project has server state — record the choice.
- Separate loading, error, and success states explicitly.

### Hook Rules
- Extract a custom hook when side-effect logic repeats across 2+ components.
- Hooks should do one thing. If a hook manages state AND fetches data AND formats output, split it.
- Name hooks descriptively: `useOrderStatus`, not `useData`.

### Data Flow
```
User Interaction → Event Handler
  → State update / API call (via hook or lib/)
  → Component re-render
  → UI reflects new state
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Hooks, utilities, feature logic | co-located `*.test.ts` | Vitest |
| Component | Critical interactive UI states | co-located `*.test.tsx` | Vitest + Testing Library |
| E2E | Primary user flows | `tests/e2e/` | Playwright (optional) |

## Key Conventions
- File naming: kebab-case for files, PascalCase for component files.
- Named exports preferred over default exports.
- Validate all external input (API responses, URL params) at the boundary.
- Error boundaries for critical sections — not try/catch in render.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 架构说明 — React Profile

本 Profile 假设**使用 Vite 构建的客户端 React 应用**，而非全栈框架。适合 SPA、内部仪表盘和共享 UI 包。

### 默认目录结构

```
src/
  app/                  # 应用外壳、providers、路由配置
  routes/               # 路由级组件（页面）
  features/             # 特性模块（共置逻辑、hooks、组件）
  components/           # 共享、可复用 UI 组件
  hooks/                # 共享自定义 hooks
  lib/                  # API 客户端、常量、共享工具函数
  types/                # 共享 TypeScript 类型
  styles/               # 全局样式、主题 token
tests/
  unit/
  e2e/
```

### 工作规则

**组件架构**
- **路由组件**（`routes/`）：薄层组合——组装特性和布局，逻辑最少。
- **特性组件**（`features/`）：共置领域逻辑、状态、hooks 和特性专属 UI。
- **共享组件**（`components/`）：可复用、无状态或本地有状态、Props 有类型。
- 复用或超过 80 行的组件，每个文件放一个组件。

**状态管理**
- 从**本地状态**（`useState`、`useReducer`）开始。
- 仅在两个或更多远距离组件需要同一数据时才提升状态。
- 仅在本地状态和 props 穿透不可管理时才引入共享状态库（Zustand、Jotai、Redux 等）——在 `docs/decisions.md` 中记录决策。

**数据获取**
- API 调用放在 `lib/` 或特性数据模块中——永远不要内联在展示组件中。
- 如果项目有服务端状态，使用数据获取库（React Query、SWR 等）——记录选择。

**Hook 规则**
- 当副作用逻辑在 2+ 个组件中重复时，提取自定义 hook。
- Hook 只做一件事。描述性命名：`useOrderStatus`，不用 `useData`。

### 测试策略

| 层级 | 测试内容 | 位置 | 工具 |
|------|---------|------|------|
| 单元 | Hooks、工具函数、特性逻辑 | 共置 `*.test.ts` | Vitest |
| 组件 | 关键交互式 UI 状态 | 共置 `*.test.tsx` | Vitest + Testing Library |
| E2E | 主要用户流程 | `tests/e2e/` | Playwright（可选） |

### 关键约定
- 文件命名：文件用 kebab-case，组件文件用 PascalCase。
- 优先命名导出。
- 在边界处验证所有外部输入（API 响应、URL 参数）。

</details>
