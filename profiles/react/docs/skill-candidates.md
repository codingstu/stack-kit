# Skill Candidates — React Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. component-scaffold
- **Trigger:** Create a new feature or UI component from a short brief.
- **Inputs:** Component name, props interface, feature or shared.
- **Steps:**
  1. Create component file with typed props and skeleton JSX.
  2. Create co-located test file with at least one render test.
  3. Create co-located types if the props are complex.
  4. Export from the feature or component index.
- **Output:** Compilable component with one passing test.
- **Verification:** `typecheck` + `test` pass.

### 2. hook-extract
- **Trigger:** Repeated side-effect logic across 2+ components.
- **Inputs:** Source components, shared logic to extract.
- **Steps:**
  1. Identify the shared logic and its interface (inputs/outputs).
  2. Create a custom hook with explicit types.
  3. Write tests for the hook in isolation.
  4. Replace inline logic in source components with the hook.
  5. Verify all existing tests still pass.
- **Output:** Extracted hook with tests, refactored consumers.
- **Verification:** `typecheck` + `test` pass, no behavior change.

### 3. feature-split
- **Trigger:** A feature module exceeds 300 lines or mixes presentation with data logic.
- **Inputs:** Feature path, concerns to separate.
- **Steps:**
  1. Identify: presentation components, data hooks, domain logic, types.
  2. Split into separate files within the feature folder.
  3. Update imports and exports.
  4. Verify no behavior change.
- **Output:** Smaller, focused files within the feature.
- **Verification:** All existing tests pass unchanged.

### 4. pr-summary
- **Trigger:** Generate PR description from a diff.
- **Inputs:** Git diff, related task.
- **Steps:**
  1. Summarize user-visible changes.
  2. List affected components and routes.
  3. Note state management or data flow changes.
  4. List screenshots needed and manual QA steps.
  5. Assess regression risk.
- **Output:** Markdown PR description.
- **Verification:** Human review.

### 5. impeccable-frontend-design
- **Trigger:** New React component/page, redesign, or pre-shipping UI review.
- **Inputs:** Component name and scope, design intent or reference.
- **Steps:**
  1. Define aesthetic direction — avoid defaulting to Inter font, gray-on-gray, blue CTA.
  2. Typography: fluid scale with `clamp()`, distinctive font pair (display + body), clear weight hierarchy.
  3. Color: OKLCH palette, tinted neutrals; no purple-to-blue gradients or glowing accents.
  4. Layout: varied spacing rhythm, intentional asymmetry, no card-in-card nesting.
  5. Motion: Framer Motion or CSS — `ease-out-quart`, `transform`/`opacity` only; no bounce/elastic.
  6. Interaction: optimistic updates, progressive disclosure, meaningful empty states.
  7. Run AI Slop Test before raising PR — revise if result looks obviously AI-generated.
  8. Run `/audit` for a11y + responsive issues.
- **Output:** Distinctive React component that doesn't resemble generic AI output.
- **Verification:** AI Slop Test passes (no generic fingerprints). `typecheck` + `test` green.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## Skill 候选清单 — React Profile

扩展 base `docs/skill-candidates.md` 中的通用候选。

**1. component-scaffold（组件脚手架）**
- **触发：** 根据简短描述创建新的特性或 UI 组件。
- **步骤：** 创建带类型化 Props 的组件文件 → 创建共置测试文件（至少一个渲染测试）→ 如需创建共置类型文件 → 从特性或组件索引导出。
- **输出：** 可编译的组件，带一个通过的测试。

**2. hook-extract（Hook 提取）**
- **触发：** 2+ 个组件中有重复的副作用逻辑。
- **步骤：** 识别共享逻辑和接口 → 创建带显式类型的自定义 hook → 为 hook 编写独立测试 → 用 hook 替换源组件中的内联逻辑 → 验证现有测试仍通过。
- **输出：** 提取的 hook（带测试）和重构后的消费者。

**3. feature-split（特性拆分）**
- **触发：** 特性模块超过 300 行或混杂了展示与数据逻辑。
- **步骤：** 识别：展示组件、数据 hooks、领域逻辑、类型 → 拆分到特性文件夹内独立文件 → 更新导入/导出 → 验证行为无变化。
- **输出：** 特性内更小、聚焦的文件。

**4. pr-summary（PR 摘要）**
- **触发：** 从 diff 生成 PR 描述。
- **步骤：** 总结用户可见变更 → 列出受影响组件和路由 → 注明状态管理或数据流变更 → 列出截图需求和手动 QA 步骤。

**5. impeccable-frontend-design（精良前端设计）**
- **触发：** 新 React 组件/页面、重设计，或发布前 UI 审查。
- **步骤：** 定义美学方向（避免 Inter 字体、灰底灰字、蓝色 CTA）→ 流式排版（`clamp()`、独特字体对）→ OKLCH 色板 → 间距节奏 → Framer Motion 动效 → 乐观更新 → AI 俗气测试 → `/audit` 无障碍检查。
- **输出：** 不像通用 AI 输出的独特 React 组件。
- **参考：** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)

</details>
