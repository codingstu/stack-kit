# Skill Candidates — Next.js Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. route-scaffold
- **Trigger:** Add a new app route or route group from a short spec.
- **Inputs:** Route path, page type (static/dynamic), data requirements.
- **Steps:**
  1. Create folder structure under `app/` per architecture conventions.
  2. Add `page.tsx` with appropriate data fetching (server component by default).
  3. Add `loading.tsx` and `error.tsx` if the route fetches data.
  4. Add metadata export for SEO.
  5. Add skeleton test for the page.
- **Output:** Compilable route with loading/error states and one passing test.
- **Verification:** `typecheck` + `test` + dev server renders the route.

### 2. api-contract-sync
- **Trigger:** Route handler contract changes (request/response shape).
- **Inputs:** Old and new schema, affected route handler path.
- **Steps:**
  1. Update the zod/schema definition.
  2. Update the route handler.
  3. Update client-side types and fetch calls.
  4. Update tests for the route handler.
  5. Run quality gate.
- **Output:** Schema, handler, client types, and tests all in sync.
- **Verification:** `typecheck` + `test` pass, no type errors in consumers.

### 3. component-extract
- **Trigger:** A page or feature component exceeds 200 lines or mixes concerns.
- **Inputs:** File path, description of concerns to separate.
- **Steps:**
  1. Identify distinct concerns (data, logic, presentation).
  2. Extract into separate files with clear interfaces.
  3. Update imports in the original file.
  4. Verify no behavior change (tests still pass).
- **Output:** Smaller, focused files with preserved behavior.
- **Verification:** All existing tests pass unchanged.

### 4. pr-summary
- **Trigger:** Generate PR description from a diff.
- **Inputs:** Git diff, related spec or task.
- **Steps:**
  1. Summarize what changed and why.
  2. List affected routes, components, and API endpoints.
  3. Note any server/client boundary changes.
  4. List testing done and screenshots needed.
  5. Assess rollout risk.
- **Output:** Markdown PR description.
- **Verification:** Human review.

### 5. impeccable-frontend-design
- **Trigger:** New page route, marketing section, or dashboard UI; or pre-shipping design review.
- **Inputs:** Route/component path, design goal, brand constraints.
- **Steps:**
  1. Define aesthetic direction before writing JSX — pick a tone and differentiation angle.
  2. Typography: fluid modular scale (`clamp()`), distinctive font loaded via `next/font`.
  3. Color: OKLCH/`color-mix()`, tinted neutrals; avoid generic AI palettes.
  4. Layout: rhythm through varied spacing, break grid for emphasis, no card-in-card.
  5. Motion: CSS or Framer Motion — exponential easing, `transform`/`opacity` only.
  6. Respect `prefers-reduced-motion`; use container queries for component responsiveness.
  7. Run AI Slop Test; revise until the result looks intentionally designed.
  8. Run `/audit` — close all a11y and responsive issues before merge.
- **Output:** Production-grade Next.js page/component with distinctive visual identity.
- **Verification:** AI Slop Test passes. `typecheck` + `test` green. No `/audit` critical issues.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Skill 候选清单 — Next.js Profile

扩展 base `docs/skill-candidates.md` 中的通用候选。

**1. route-scaffold（路由脚手架）**
- **触发：** 根据简短规格添加新的 app 路由或路由分组。
- **步骤：** 按架构约定在 `app/` 下创建目录 → 添加 `page.tsx` 默认服务端组件 → 添加 `loading.tsx`/`error.tsx` → 添加 metadata 导出 → 添加骨架测试。
- **输出：** 可编译的路由，带加载/错误状态和一个通过的测试。

**2. api-contract-sync（API 契约同步）**
- **触发：** 路由处理器契约（请求/响应格式）发生变更。
- **步骤：** 更新 zod/schema 定义 → 更新路由处理器 → 更新客户端类型和 fetch 调用 → 更新测试 → 运行质量门控。
- **输出：** Schema、处理器、客户端类型、测试全部同步。

**3. component-extract（组件提取）**
- **触发：** 页面或特性组件超过 200 行或混杂了不同关注点。
- **步骤：** 识别不同关注点（数据、逻辑、展示） → 提取到独立文件 → 更新导入 → 验证行为无变化。
- **输出：** 更小、聚焦的文件，行为保持。

**4. pr-summary（PR 摘要）**
- **触发：** 从 diff 生成 PR 描述。
- **步骤：** 总结变更内容 → 列出受影响路由、组件、API → 注明 server/client 边界变化 → 列出测试和截图需求 → 评估上线风险。

**5. impeccable-frontend-design（精良前端设计）**
- **触发：** 新页面路由、营销区块、仪表盘 UI，或发布前设计审查。
- **步骤：** 定义美学方向 → 流式排版（`clamp()`、`next/font`）→ OKLCH 色彩体系 → 间距节奏 → CSS/Framer Motion 动效 → 尊重 `prefers-reduced-motion` → AI 俗气测试 → `/audit` 无障碍检查。
- **输出：** 具有独特视觉特征的 Next.js 页面/组件。
- **参考：** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)

</details>
