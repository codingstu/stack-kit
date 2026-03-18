# Profile Selection Guide

Choose the profile that best matches your project's primary purpose.

## Decision Tree

```
Is it a web application?
├── Yes → Does it need server rendering, file-based routing, or API routes?
│   ├── Yes → nextjs
│   └── No → Is the team using Vue?
│       ├── Yes → vue
│       └── No → react
└── No → Is it an HTTP API or backend service?
    ├── Yes → fastapi
    └── No → python
```

## Profile Details

### `nextjs`
**Use when:** The project is a product web app that benefits from server rendering, file-based routing, route handlers, and React Server Components.

- App Router architecture with `app/` directory.
- Server Components by default, `"use client"` only when needed.
- Full-stack support through route handlers and server-side data fetching.

### `react`
**Use when:** You want a client-side React app without a full-stack framework. Internal dashboards, SPAs, and shared UI packages fit well here.

- Vite + React + TypeScript.
- Client-side only — no server rendering and no API routes.
- Lighter weight than Next.js and well suited to apps that talk to a separate backend.

### `vue`
**Use when:** The team prefers Vue 3 with the Composition API and Vite.

- `create-vue` scaffold with `<script setup>` and TypeScript.
- Vue Router and Pinia are opt-in, not pre-installed.
- Similar SPA workflow to the React profile, but with Vue conventions.

### `fastapi`
**Use when:** The project is an HTTP API or backend service with structured request and response contracts.

- FastAPI with Pydantic schemas, `fastapi dev`, and `pytest` plus `TestClient`.
- Clear layer separation: routes → services → repositories.
- Async-first for I/O-bound work.

### `python`
**Use when:** The project is not primarily a web API. Libraries, CLI tools, automation, workers, and data pipelines fit here.

- `pyproject.toml` + `src/` layout + `.venv` conventions.
- No web framework assumed.
- Core / Services / Adapters layering for clean separation.

## When Two Profiles Overlap

- **Full-stack Next.js + separate API?** Use `nextjs` for the frontend repo and `fastapi` for the API repo.
- **React app that calls a FastAPI backend?** Use `react` for the frontend and `fastapi` for the backend.
- **Python library with a small CLI?** Use `python` — it already includes CLI patterns.
- **Vue dashboard with a Node backend?** Use `vue` for the frontend. For the backend, choose `fastapi` or add a custom profile.
