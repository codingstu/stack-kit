# Profile Selection Guide / Profile 选择指南

Choose the profile that best matches your project's primary purpose.  
根据项目的主要用途，选择最合适的 profile。

## Decision Tree / 决策树

```
Is it a web application? / 是 Web 应用吗？
├── Yes / 是 → Does it need server rendering, file-based routing, or API routes?
│             需要服务端渲染、基于文件的路由或 API 路由吗？
│   ├── Yes / 是 → nextjs
│   └── No / 否 → Is the team using Vue? / 团队使用 Vue 吗？
│       ├── Yes / 是 → vue
│       └── No / 否 → react
└── No / 否 → Is it an HTTP API or backend service?
              是 HTTP API 或后端服务吗？
    ├── Yes / 是 → fastapi
    └── No / 否 → python
```

## Profile Details / Profile 详情

### `nextjs`
**Use when / 适用场景:** The project is a product web app that benefits from server rendering, file-based routing, route handlers, and React Server Components.  
项目是受益于服务端渲染、基于文件路由、路由处理器和 React Server Components 的产品级 Web 应用。

- App Router architecture with `app/` directory. / 使用 `app/` 目录的 App Router 架构。
- Server Components by default, `"use client"` only when needed. / 默认使用 Server Components，仅在必要时加 `"use client"`。
- Full-stack: route handlers for API endpoints, server-side data fetching. / 全栈：用路由处理器实现 API 端点，服务端获取数据。

### `react`
**Use when / 适用场景:** You want a client-side React app without a full-stack framework. Internal dashboards, SPAs, shared UI packages.  
需要纯客户端 React 应用，不需要全栈框架。适合内部管理后台、SPA、共享 UI 包。

- Vite + React + TypeScript.
- Client-side only — no server rendering, no API routes. / 纯客户端——无服务端渲染，无 API 路由。
- Lighter weight than Next.js. Good for apps that talk to a separate backend. / 比 Next.js 更轻量，适合对接独立后端的场景。

### `vue`
**Use when / 适用场景:** The team prefers Vue 3 with Composition API and Vite.  
团队偏好 Vue 3 + Composition API + Vite 技术栈。

- `create-vue` scaffold with `<script setup>` and TypeScript. / 使用 `create-vue` 脚手架，`<script setup>` + TypeScript。
- Vue Router and Pinia are opt-in, not pre-installed. / Vue Router 和 Pinia 按需引入，不预装。
- Similar SPA workflow to the React profile, but with Vue conventions. / SPA 工作流与 React profile 类似，遵循 Vue 约定。

### `fastapi`
**Use when / 适用场景:** The project is an HTTP API or backend service with structured request/response contracts.  
项目是有结构化请求/响应契约的 HTTP API 或后端服务。

- FastAPI with Pydantic schemas, `fastapi dev`, and `pytest` + `TestClient`.
- Clear layer separation: routes → services → repositories. / 清晰的分层：路由 → 服务 → 仓储。
- Async-first for I/O-bound work. / I/O 密集型工作优先使用异步。

### `python`
**Use when / 适用场景:** The project is not primarily a web API. Libraries, CLI tools, automation, workers, data pipelines.  
项目主要不是 Web API。适合库、CLI 工具、自动化脚本、Worker、数据管道。

- `pyproject.toml` + `src/` layout + `.venv` conventions. / `pyproject.toml` + `src/` 布局 + `.venv` 约定。
- No web framework assumed. / 不预设 Web 框架。
- Core / Services / Adapters layering for clean separation. / Core / Services / Adapters 三层架构，职责清晰。

## When Two Profiles Overlap / 当两个 Profile 重叠时

- **Full-stack Next.js + separate API?** Use `nextjs` for the frontend repo and `fastapi` for the API repo.  
  **全栈 Next.js + 独立 API？** 前端用 `nextjs`，API 用 `fastapi`。
- **React app that calls a FastAPI backend?** Use `react` for the frontend, `fastapi` for the backend.  
  **React 应用调用 FastAPI 后端？** 前端用 `react`，后端用 `fastapi`。
- **Python library with a small CLI?** Use `python` — it includes CLI patterns.  
  **带有小 CLI 的 Python 库？** 用 `python`，已包含 CLI 模式。
- **Vue dashboard with a Node backend?** Use `vue` for the frontend. For the backend, choose `fastapi` or add a custom profile.  
  **Vue 管理后台 + Node 后端？** 前端用 `vue`，后端选 `fastapi` 或自定义 profile。
