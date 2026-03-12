# Skill Candidates — Vue Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. view-scaffold
- **Trigger:** Add a new route view from a short spec.
- **Inputs:** Route path, view name, data requirements.
- **Steps:**
  1. Create `.vue` file in `views/` with `<script setup lang="ts">`.
  2. Add route registration in `router/index.ts` (if Router is used).
  3. Add loading and error state handling.
  4. Add skeleton test.
- **Output:** Compilable view with route, loading/error states, and skeleton test.
- **Verification:** `typecheck` + `test` pass, dev server renders the view.

### 2. composable-extract
- **Trigger:** Logic repeated across 2+ components, or a component mixing concerns.
- **Inputs:** Source components, shared logic to extract.
- **Steps:**
  1. Identify shared reactive logic and its interface (params → returned refs/methods).
  2. Create composable with explicit types (`use<Name>`).
  3. Write unit tests for the composable.
  4. Replace inline logic in source components.
  5. Verify all existing tests still pass.
- **Output:** Extracted composable with tests, refactored consumers.
- **Verification:** `typecheck` + `test` pass, no behavior change.

### 3. store-scaffold
- **Trigger:** New shared state needed across distant components (Pinia).
- **Inputs:** State shape, key actions, getters.
- **Steps:**
  1. Create Pinia store in `stores/` with typed state, actions, getters.
  2. Keep store thin — actions call services, getters derive state.
  3. Write unit tests for actions and getters.
  4. Wire into consuming components.
- **Output:** Store with tests, integrated into consumers.
- **Verification:** `typecheck` + `test` pass.

### 4. pr-summary
- **Trigger:** Summarize a UI diff.
- **Inputs:** Git diff, related task.
- **Steps:**
  1. Summarize changed views and components.
  2. Note store or composable impact.
  3. List screenshots needed and manual QA steps.
  4. Assess regression risk.
- **Output:** Markdown PR description.
- **Verification:** Human review.

### 5. impeccable-frontend-design
- **Trigger:** New Vue view/component, redesign, or pre-shipping UI review.
- **Inputs:** Component/view name, design goal, brand constraints.
- **Steps:**
  1. Define aesthetic direction in the `<style>` planning phase before writing template.
  2. Typography: fluid `clamp()` scale, distinctive `@font-face` or hosted font pair.
  3. Color: OKLCH CSS custom properties, tinted neutrals as scoped `<style>` variables.
  4. Layout: varied spacing rhythm, asymmetry, no repeated icon-heading-text card grids.
  5. Motion: Vue `<Transition>` with `ease-out-quart`, CSS `transform`/`opacity` only.
  6. Interaction: progressive disclosure via `v-show`/`v-if`, optimistic reactive updates.
  7. Run AI Slop Test — revise if it looks like a generic UI kit output.
  8. Run `/audit` for a11y and responsive checks.
- **Output:** Distinctive Vue component/view that avoids generic AI aesthetics.
- **Verification:** AI Slop Test passes. `typecheck` + `test` green. No `/audit` critical issues.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Skill 候选清单 — Vue Profile

扩展 base `docs/skill-candidates.md` 中的通用候选。

**1. view-scaffold（视图脚手架）**
- **触发：** 根据简短规格添加新的路由视图。
- **步骤：** 在 `views/` 下创建带 `<script setup lang="ts">` 的 `.vue` 文件 → 添加路由注册（如使用 Router）→ 添加加载和错误状态处理 → 添加骨架测试。
- **输出：** 可编译的视图，带路由、加载/错误状态和骨架测试。

**2. composable-extract（Composable 提取）**
- **触发：** 2+ 个组件中有重复逻辑，或组件混杂了不同关注点。
- **步骤：** 识别共享响应式逻辑和接口 → 创建带显式类型的 Composable（`use<Name>`）→ 编写单元测试 → 替换源组件中的内联逻辑 → 验证现有测试仍通过。
- **输出：** 提取的 Composable（带测试）和重构后的消费者。

**3. store-scaffold（Store 脚手架）**
- **触发：** 远距离组件间需要新的共享状态（Pinia）。
- **步骤：** 在 `stores/` 下创建带类型化状态、actions、getters 的 Pinia store → Store 保持精简（actions 调用 services，getters 派生状态）→ 编写单元测试 → 集成到消费者组件。
- **输出：** Store（带测试），集成到消费者中。

**4. pr-summary（PR 摘要）**
- **触发：** 生成 UI diff 摘要。
- **步骤：** 总结变更的视图和组件 → 注明 store 或 composable 影响 → 列出截图需求和手动 QA 步骤。

**5. impeccable-frontend-design（精良前端设计）**
- **触发：** 新 Vue 视图/组件、重设计，或发布前 UI 审查。
- **步骤：** 在 `<style>` 规划阶段定义美学方向 → 流式 `clamp()` 排版 → OKLCH CSS 自定义属性色彩体系 → 间距节奏 → Vue `<Transition>` 动效 → `v-show`/`v-if` 渐进式展开 → AI 俗气测试 → `/audit` 无障碍检查。
- **输出：** 避免通用 AI 美学的独特 Vue 组件/视图。
- **参考：** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)

</details>
