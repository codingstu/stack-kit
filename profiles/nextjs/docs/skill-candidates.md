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
