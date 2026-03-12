# Architecture — Next.js Profile

This profile assumes a modern Next.js application using the **App Router**.

## Default Shape

```
app/                    # or src/app/ — route segments, layouts, pages, loading, error, route handlers
  (marketing)/          # public pages group
  (app)/                # authenticated pages group
  api/                  # route handlers
  layout.tsx
  page.tsx
src/
  components/           # shared UI components
  features/             # feature modules (co-located logic, hooks, components)
  lib/                  # shared utilities, clients, constants
  server/               # server-only code: DB queries, external API calls, auth
  types/                # shared TypeScript types and interfaces
tests/
  unit/
  integration/
  e2e/
```

## Working Rules

### Server vs Client
- Default to **Server Components**. They render on the server with zero client JS.
- Add `"use client"` only for interactive leaf components or browser-only APIs.
- Keep data fetching on the server — avoid client-side waterfalls.
- Use route handlers (`app/api/`) for light HTTP endpoints; do not bury domain logic in `route.ts`.

### Module Boundaries
- **Route files** (`page.tsx`, `layout.tsx`, `route.ts`): thin composition only — import from `features/`, `server/`, `components/`.
- **Features**: co-locate domain logic, feature-specific hooks, feature-specific components.
- **Server**: all server-only code (DB, external APIs, auth). Never imported from client components.
- **Components**: shared, reusable UI. No data fetching, no business logic.
- **Lib**: generic helpers, constants, client instances. Small and typed.

### Component Rules
- One component per file when the component is reused or exceeds 80 lines.
- Co-locate a component's styles, tests, and types in the same folder when feature-specific.
- Props interfaces should be explicit — no `any`, no unlabeled spread.
- Extract hooks when side-effect logic repeats across 2+ components.

### Data Flow
```
Request → Route Handler / Server Component
  → Server-side validation (zod / schema)
  → Service / domain logic (src/server/ or src/features/)
  → Data access (DB client, external API)
  → Serialized response / React tree
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Utilities, domain logic, schema validators | `tests/unit/` or co-located `*.test.ts` | Vitest |
| Integration | Route handlers, server functions, data boundaries | `tests/integration/` | Vitest + msw for mocking |
| Component | Key interactive components | co-located `*.test.tsx` | Vitest + Testing Library |
| E2E | Top 3–5 user journeys | `tests/e2e/` | Playwright (optional) |

## Key Conventions
- File naming: kebab-case for files, PascalCase for component files.
- Named exports preferred. Default exports only for `page.tsx`, `layout.tsx`, `route.ts` (Next.js convention).
- Validate all external input (request bodies, search params, env vars) at the boundary.
- Error boundaries: use `error.tsx` at route segments, not try/catch in render.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 架构说明 — Next.js Profile

本 Profile 假设使用 **App Router** 的现代 Next.js 应用。

### 默认目录结构

```
app/                    # 或 src/app/ — 路由段、布局、页面、loading、error、路由处理器
  (marketing)/          # 公开页面分组
  (app)/                # 需认证页面分组
  api/                  # 路由处理器
  layout.tsx
  page.tsx
src/
  components/           # 共享 UI 组件
  features/             # 特性模块（共置逻辑、hooks、组件）
  lib/                  # 共享工具函数、客户端实例、常量
  server/               # 仅服务端代码：DB 查询、外部 API 调用、认证
  types/                # 共享 TypeScript 类型和接口
tests/
  unit/
  integration/
  e2e/
```

### 工作规则

**Server vs Client**
- 默认使用 **Server Components**——在服务端渲染，零客户端 JS。
- 仅在需要交互的叶子组件或仅浏览器 API 时添加 `"use client"`。
- 数据获取保留在服务端——避免客户端瀑布请求。
- 轻量 HTTP 端点用路由处理器（`app/api/`）；不要将领域逻辑埋在 `route.ts` 中。

**模块边界**
- **路由文件**（`page.tsx`、`layout.tsx`、`route.ts`）：仅做薄层组合——从 `features/`、`server/`、`components/` 导入。
- **Features**：共置领域逻辑、特性专属 hooks、特性专属组件。
- **Server**：所有仅服务端代码（DB、外部 API、认证）。永远不要从客户端组件导入。
- **Components**：共享、可复用 UI。无数据获取，无业务逻辑。
- **Lib**：通用辅助函数、常量、客户端实例。小而有类型。

**组件规则**
- 复用或超过 80 行的组件，每个文件放一个组件。
- 特性专属组件的样式、测试和类型共置在同一文件夹中。
- Props 接口必须显式——不用 `any`，不用未标注的展开。
- 当副作用逻辑在 2+ 个组件中重复时，提取 hooks。

### 数据流

```
请求 → 路由处理器 / Server Component
  → 服务端验证（zod / schema）
  → Service / 领域逻辑（src/server/ 或 src/features/）
  → 数据访问（DB 客户端、外部 API）
  → 序列化响应 / React 树
```

### 测试策略

| 层级 | 测试内容 | 位置 | 工具 |
|------|---------|------|------|
| 单元 | 工具函数、领域逻辑、Schema 验证器 | `tests/unit/` 或共置 `*.test.ts` | Vitest |
| 集成 | 路由处理器、服务端函数、数据边界 | `tests/integration/` | Vitest + msw mock |
| 组件 | 关键交互式组件 | 共置 `*.test.tsx` | Vitest + Testing Library |
| E2E | 前 3–5 条用户路径 | `tests/e2e/` | Playwright（可选） |

### 关键约定
- 文件命名：文件用 kebab-case，组件文件用 PascalCase。
- 优先命名导出。默认导出仅用于 `page.tsx`、`layout.tsx`、`route.ts`（Next.js 约定）。
- 在边界处验证所有外部输入（请求体、search params、环境变量）。
- 错误边界：在路由段使用 `error.tsx`，不在 render 中用 try/catch。

</details>
