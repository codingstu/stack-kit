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
