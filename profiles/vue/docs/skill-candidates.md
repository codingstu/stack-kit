# Skill Candidates — Vue Profile

Extends the universal candidates in the base `docs/skill-candidates.md`. Keep the base execution model unchanged and document only Vue-specific differences here.

---

### 1. view-scaffold
- **Trigger:** Add a new route view from a short spec.
- **Inputs:** Route path, view name, data requirements, selected execution options.
- **Vue-specific focus:** `<script setup lang="ts">`, optional router integration, and route-level state handling.
- **Batched Steps:**
  1. Confirm whether the user wants a minimal scaffold or a complete scaffold, then whether delivery is module-by-module or task-by-task.
  2. Create the `.vue` file in `views/` with `<script setup lang="ts">` for the current batch.
  3. Add route registration in `router/index.ts` when Router is used.
  4. Add loading and error state handling.
  5. Add a skeleton test.
  6. Update any affected docs before closing the batch.
- **Output:** A compilable view with route integration, loading and error states, and a skeleton test.
- **Verification:** `typecheck` and `test` pass, and the dev server renders the current slice.
- **Definition of Done:** The view slice renders correctly, docs are synchronized, and the batch is ready for one focused commit.

### 2. composable-extract
- **Trigger:** Logic is repeated across two or more components, or a component mixes concerns.
- **Inputs:** Source components, shared logic to extract, selected execution options.
- **Vue-specific focus:** Typed composables, reactive interfaces, and isolated composable tests.
- **Batched Steps:**
  1. Identify shared reactive logic and its interface.
  2. Create a composable with explicit types using the `use<Name>` convention.
  3. Write unit tests for the composable.
  4. Replace inline logic in the source components for the current batch.
  5. Verify all affected tests still pass.
  6. Update any affected docs before closing the batch.
- **Output:** An extracted composable with tests and refactored consumers.
- **Verification:** `typecheck` and `test` pass with no behavior change.
- **Definition of Done:** The repeated logic is removed for the reviewed scope, the composable is verified, and the batch is commit-ready.

### 3. store-scaffold
- **Trigger:** New shared state is needed across distant components using Pinia.
- **Inputs:** State shape, key actions, getters, selected execution options.
- **Vue-specific focus:** Thin Pinia stores, service-backed actions, and typed getters.
- **Batched Steps:**
  1. Create the Pinia store in `stores/` with typed state, actions, and getters.
  2. Keep the store thin so actions call services and getters derive state.
  3. Write unit tests for actions and getters.
  4. Wire the store into the consuming components for the current batch.
  5. Update any affected docs before closing the batch.
- **Output:** A store with tests integrated into consuming components.
- **Verification:** `typecheck` and `test` pass.
- **Definition of Done:** The shared state slice is implemented, documented where needed, and isolated in one focused commit.

### 4. pr-summary
- **Trigger:** Summarize a UI diff.
- **Inputs:** Git diff, related task, selected execution options.
- **Vue-specific focus:** Changed views and components, store or composable impact, screenshots, and manual QA.
- **Batched Steps:**
  1. Summarize changed views and components.
  2. Note store or composable impact.
  3. List screenshots needed and manual QA steps.
  4. Assess regression risk.
- **Output:** A Markdown PR description.
- **Verification:** Human review.
- **Definition of Done:** The summary accurately describes the reviewed batch and its verification scope.

### 5. impeccable-frontend-design
- **Trigger:** A new Vue view or component is being built, redesigned, or reviewed before shipping.
- **Inputs:** Component or view name, design goal, brand constraints, selected execution options.
- **Vue-specific focus:** Scoped style planning, OKLCH custom properties, spacing rhythm, and Vue transition patterns.
- **Batched Steps:**
  1. Define aesthetic direction during the `<style>` planning phase before writing the template.
  2. Typography: use a fluid `clamp()` scale with a distinctive hosted or custom font pair.
  3. Color: use OKLCH CSS custom properties with tinted neutrals.
  4. Layout: create varied spacing rhythm and asymmetry, and avoid repeated card-grid clichés.
  5. Motion: use Vue `<Transition>` with `ease-out-quart` and animate only `transform` and `opacity`.
  6. Interaction: prefer progressive disclosure via `v-show` or `v-if` and optimistic reactive updates.
  7. Run the AI Slop Test and revise if the result still looks generic.
  8. Run `/audit` for accessibility and responsive checks.
  9. Update any affected docs before closing the batch.
- **Output:** A distinctive Vue component or view that avoids generic AI aesthetics.
- **Verification:** The AI Slop Test passes, `typecheck` and `test` are green, and `/audit` reports no critical issues.
- **Definition of Done:** The UI slice is visually intentional, verified, documented where needed, and ready for a focused commit.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
