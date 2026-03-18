# Skill Candidates — React Profile

Extends the universal candidates in the base `docs/skill-candidates.md`. Keep the base execution model unchanged and document only React-specific differences here.

---

### 1. component-scaffold
- **Trigger:** Create a new feature or UI component from a short brief.
- **Inputs:** Component name, props interface, feature or shared placement, selected execution options.
- **React-specific focus:** Typed props, co-located tests, and clear export boundaries.
- **Batched Steps:**
  1. Confirm whether the user wants a minimal scaffold or a complete scaffold, then whether delivery is module-by-module or task-by-task.
  2. Create the component file with typed props and skeleton JSX for the current batch.
  3. Create a co-located test file with at least one render test.
  4. Create co-located types if the props are complex.
  5. Export from the feature or component index.
  6. Update any affected docs before closing the batch.
- **Output:** A compilable component with one passing test.
- **Verification:** `typecheck` and `test` pass for the current batch.
- **Definition of Done:** The component slice compiles, docs are synchronized, and the batch is small enough for one focused commit.

### 2. hook-extract
- **Trigger:** Repeated side-effect logic exists across two or more components.
- **Inputs:** Source components, shared logic to extract, selected execution options.
- **React-specific focus:** Explicit hook interfaces and isolated hook tests.
- **Batched Steps:**
  1. Identify the shared logic and its inputs and outputs.
  2. Create a custom hook with explicit types.
  3. Write tests for the hook in isolation.
  4. Replace inline logic in the source components for the current batch.
  5. Verify all affected tests still pass.
  6. Update any affected docs before closing the batch.
- **Output:** An extracted hook with tests and refactored consumers.
- **Verification:** `typecheck` and `test` pass with no behavior change.
- **Definition of Done:** The duplicated logic is removed for the reviewed scope, the resulting hook is verified, and the batch is commit-ready.

### 3. feature-split
- **Trigger:** A feature module exceeds 300 lines or mixes presentation with data logic.
- **Inputs:** Feature path, concerns to separate, selected execution options.
- **React-specific focus:** Separate feature UI, data hooks, domain logic, and types without changing behavior.
- **Batched Steps:**
  1. Identify presentation components, data hooks, domain logic, and types.
  2. Split only the current reviewable slice into separate files within the feature folder.
  3. Update imports and exports.
  4. Verify no behavior change.
  5. Update any affected docs before closing the batch.
- **Output:** Smaller, focused files within the feature.
- **Verification:** Existing tests pass unchanged.
- **Definition of Done:** The feature is cleaner for the chosen slice, docs are synced, and the diff fits one focused commit.

### 4. pr-summary
- **Trigger:** Generate a PR description from a diff.
- **Inputs:** Git diff, related task, selected execution options.
- **React-specific focus:** User-visible changes, affected components and routes, state flow impact, and UI QA.
- **Batched Steps:**
  1. Summarize user-visible changes.
  2. List affected components and routes.
  3. Note state management or data flow changes.
  4. List screenshots needed and manual QA steps.
  5. Assess regression risk.
- **Output:** A Markdown PR description.
- **Verification:** Human review.
- **Definition of Done:** The summary matches the reviewed batch and its verification scope.

### 5. impeccable-frontend-design
- **Trigger:** A new React component or page is being built, redesigned, or reviewed before shipping.
- **Inputs:** Component name, scope, design intent or reference, selected execution options.
- **React-specific focus:** Typography, OKLCH color systems, spacing rhythm, and Framer Motion or CSS motion patterns.
- **Batched Steps:**
  1. Define aesthetic direction and avoid generic defaults.
  2. Typography: use a fluid scale with `clamp()` and a distinctive display and body font pair.
  3. Color: use an OKLCH palette with tinted neutrals and avoid generic gradient accents.
  4. Layout: create varied spacing rhythm and intentional asymmetry; avoid card-in-card nesting.
  5. Motion: use Framer Motion or CSS with `ease-out-quart` and animate only `transform` and `opacity`.
  6. Interaction: add optimistic updates, progressive disclosure, and meaningful empty states.
  7. Run the AI Slop Test before raising the PR and revise if the result looks generic.
  8. Run `/audit` for accessibility and responsive issues.
  9. Update any affected docs before closing the batch.
- **Output:** A distinctive React component that does not resemble generic AI output.
- **Verification:** The AI Slop Test passes, and `typecheck` plus `test` are green.
- **Definition of Done:** The UI slice is visually intentional, verified, documented where needed, and ready for a focused commit.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
