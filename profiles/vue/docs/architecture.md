# Architecture — Vue Profile

This profile assumes a **Vue 3 application scaffolded with create-vue and Vite**. Default API style is Composition API with `<script setup>`. Router and Pinia are opt-in, not pre-installed.

## Default Shape

```
src/
  router/               # Vue Router config (opt-in)
  views/                # route-level / page-level components
  components/           # shared, reusable UI components
  composables/          # shared composition functions (hooks)
  stores/               # Pinia stores (opt-in)
  services/             # API clients, external service wrappers
  lib/                  # constants, formatters, pure utilities
  types/                # shared TypeScript types
tests/
  unit/
  e2e/
```

## Working Rules

### Component Architecture
- **Views** (`views/`): page-level composition — assemble components and call composables.
- **Components** (`components/`): reusable, well-typed via `defineProps` / `defineEmits`.
- **Composables** (`composables/`): reusable stateful logic extracted from components.
- Use `<script setup>` with TypeScript by default.
- One component per `.vue` file. If a component exceeds 200 lines, split into child components or extract a composable.

### Props and Events
- Use `defineProps<T>()` with explicit TypeScript interface — no runtime-only prop validation.
- Use `defineEmits<T>()` with typed event signatures.
- Prefer explicit props and emits over `provide/inject` for parent-child communication.
- Use `provide/inject` only for deeply nested, contextual dependencies (theme, locale).

### State Management
- Start with component-local `ref()` / `reactive()`.
- Extract shared logic into composables first.
- Add **Pinia** only when state is shared across distant parts of the app. Record the decision.
- Keep stores thin: actions call services, getters derive state, no API calls in stores.

### Data Fetching
- Keep API calls in `services/` — never inline in components or stores.
- Composables can wrap `services/` calls with loading/error state management.
- Separate loading, error, and success states explicitly.

### Data Flow
```
User Interaction → Event (emit or handler)
  → Composable / store update
  → Service call (if server state involved)
  → Reactive state update
  → Template re-renders
```

## Testing Strategy

| Level | What | Where | Tool |
|-------|------|-------|------|
| Unit | Composables, services, pure helpers | co-located `*.test.ts` | Vitest |
| Component | Critical interactive components | co-located `*.test.ts` | Vitest + Vue Test Utils |
| E2E | Main routes and user flows | `tests/e2e/` | Playwright or Cypress (optional) |

## Key Conventions
- File naming: PascalCase for `.vue` files, kebab-case for non-component TS files.
- Named exports for non-component modules; default export for `.vue` SFCs.
- Validate all external input (API responses, route params) at the boundary.
- Use Vue's built-in `<Suspense>` and `onErrorCaptured` for async and error boundaries.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 架构说明 — Vue Profile

本 Profile 假设**使用 create-vue 和 Vite 脚手架的 Vue 3 应用**。默认 API 风格为带 `<script setup>` 的 Composition API。Router 和 Pinia 为可选引入。

### 默认目录结构

```
src/
  router/               # Vue Router 配置（可选）
  views/                # 路由级 / 页面级组件
  components/           # 共享、可复用 UI 组件
  composables/          # 共享组合式函数（hooks）
  stores/               # Pinia stores（可选）
  services/             # API 客户端、外部服务封装
  lib/                  # 常量、格式化器、纯工具函数
  types/                # 共享 TypeScript 类型
tests/
  unit/
  e2e/
```

### 工作规则

**组件架构**
- **Views**（`views/`）：页面级组合——组装组件并调用 composables。
- **Components**（`components/`）：可复用，通过 `defineProps` / `defineEmits` 有类型。
- **Composables**（`composables/`）：从组件中提取的可复用有状态逻辑。
- 默认使用带 TypeScript 的 `<script setup>`。
- 每个 `.vue` 文件放一个组件。超过 200 行时拆分。

**Props 和 Events**
- 使用 `defineProps<T>()` 配合显式 TypeScript 接口——不用仅运行时的 prop 验证。
- 使用 `defineEmits<T>()` 配合类型化的事件签名。

**状态管理**
- 从组件本地的 `ref()` / `reactive()` 开始。
- 先用 Composables 提取共享逻辑。
- 仅在状态在应用远距离部分共享时才添加 **Pinia**——记录决策。
- Store 保持精简：actions 调用 services，getters 派生状态，store 中不放 API 调用。

**数据获取**
- API 调用放在 `services/` 中——永远不要内联在组件或 stores 中。

### 测试策略

| 层级 | 测试内容 | 位置 | 工具 |
|------|---------|------|------|
| 单元 | Composables、services、纯辅助函数 | 共置 `*.test.ts` | Vitest |
| 组件 | 关键交互式组件 | 共置 `*.test.ts` | Vitest + Vue Test Utils |
| E2E | 主要路由和用户流程 | `tests/e2e/` | Playwright 或 Cypress（可选） |

### 关键约定
- 文件命名：`.vue` 文件用 PascalCase，非组件 TS 文件用 kebab-case。
- 在边界处验证外部输入（API 响应、路由参数）。

</details>
