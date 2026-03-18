# Skill Candidates — Next.js Profile

Extends the universal candidates in the base `docs/skill-candidates.md`. Keep the base execution model unchanged and document only Next.js-specific differences here.

---

### 1. route-scaffold
- **Trigger:** Add a new app route or route group from a short spec.
- **Inputs:** Route path, page type, data requirements, selected execution options.
- **Next.js-specific focus:** App Router structure, server-first rendering, route segment conventions, and route-specific supporting files.
- **Batched Steps:**
  1. Confirm whether the user wants a minimal scaffold or a complete scaffold, then whether delivery is module-by-module or task-by-task.
  2. Create the folder structure under `app/` for the current reviewable slice.
  3. Add `page.tsx` with the correct data fetching approach, using a Server Component by default.
  4. Add `loading.tsx` and `error.tsx` when the route fetches data.
  5. Add metadata exports when needed.
  6. Add a skeleton test for the page.
  7. Update any affected docs before closing the batch.
- **Output:** A compilable route with loading and error states plus one passing test.
- **Verification:** `typecheck`, `test`, and the local route render check pass for the current batch.
- **Definition of Done:** The route slice renders correctly, docs are synchronized, and the batch is ready for one focused commit.

### 2. api-contract-sync
- **Trigger:** A route handler contract changes, including request or response shape.
- **Inputs:** Old and new schema, affected route handler path, selected execution options.
- **Next.js-specific focus:** Keep route handlers, shared schemas, and client consumers synchronized across server and client boundaries.
- **Batched Steps:**
  1. Update the relevant `zod` or schema definition.
  2. Update the route handler.
  3. Update client-side types and fetch calls.
  4. Update tests for the route handler and affected consumers in the current batch.
  5. Run the required quality gate.
  6. Update any affected docs before closing the batch.
- **Output:** Schema, handler, client types, and tests remain in sync.
- **Verification:** `typecheck` and `test` pass, and downstream consumers show no type errors.
- **Definition of Done:** The contract change is propagated across the reviewed slice, documented where needed, and kept small enough for one commit.

### 3. component-extract
- **Trigger:** A page or feature component exceeds 200 lines or mixes concerns.
- **Inputs:** File path, concerns to separate, selected execution options.
- **Next.js-specific focus:** Separate data loading, server-only logic, and presentation without breaking route conventions.
- **Batched Steps:**
  1. Identify distinct concerns such as data, logic, and presentation.
  2. Extract the current reviewable slice into separate files with clear interfaces.
  3. Update imports in the original file.
  4. Verify no behavior change.
  5. Update any affected docs before closing the batch.
- **Output:** Smaller, focused files with preserved behavior.
- **Verification:** Existing tests pass unchanged.
- **Definition of Done:** The extracted slice respects Next.js boundaries, docs are synced, and the diff fits one focused commit.

### 4. pr-summary
- **Trigger:** Generate a PR description from a diff.
- **Inputs:** Git diff, related spec or task, selected execution options.
- **Next.js-specific focus:** Affected routes, server and client boundaries, API endpoints, screenshots, and rollout risk.
- **Batched Steps:**
  1. Summarize what changed and why.
  2. List affected routes, components, and API endpoints.
  3. Note any server and client boundary changes.
  4. List testing completed and screenshots needed.
  5. Assess rollout risk.
- **Output:** A Markdown PR description.
- **Verification:** Human review.
- **Definition of Done:** The summary accurately describes the reviewed batch and its verification scope.

### 5. impeccable-frontend-design
- **Trigger:** A new page route, marketing section, or dashboard UI is being built or reviewed before shipping.
- **Inputs:** Route or component path, design goal, brand constraints, selected execution options.
- **Next.js-specific focus:** `next/font`, server-first composition, responsive route sections, and motion patterns that respect platform constraints.
- **Batched Steps:**
  1. Define aesthetic direction before writing JSX.
  2. Typography: use a fluid modular scale with `clamp()` and a distinctive font loaded via `next/font`.
  3. Color: use OKLCH or `color-mix()` with tinted neutrals and avoid generic AI palettes.
  4. Layout: create rhythm through varied spacing, break the grid intentionally, and avoid card-in-card nesting.
  5. Motion: use CSS or Framer Motion with exponential easing and animate only `transform` and `opacity`.
  6. Respect `prefers-reduced-motion` and use container queries for component responsiveness.
  7. Run the AI Slop Test and revise until the result looks intentionally designed.
  8. Run `/audit` and close accessibility and responsive issues for the current batch.
  9. Update any affected docs before closing the batch.
- **Output:** A production-grade Next.js page or component with a distinctive visual identity.
- **Verification:** The AI Slop Test passes, `typecheck` and `test` are green, and `/audit` reports no critical issues.
- **Definition of Done:** The UI slice is visually intentional, verified, documented where needed, and ready for a focused commit.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
