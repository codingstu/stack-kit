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
