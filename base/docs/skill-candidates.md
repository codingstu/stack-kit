# Skill Candidates

Only promote a workflow into a formal Skill after it has been repeated enough to justify the overhead. A premature Skill adds maintenance burden without saving time.

---

## Evaluation Criteria

Before promoting, confirm:
- [ ] The workflow has been executed at least 3 times manually.
- [ ] The steps are stable — they haven't changed significantly between executions.
- [ ] Automation would save meaningful time (> 5 minutes per execution).
- [ ] The inputs and outputs are well-defined and predictable.

---

## Standard Execution Model

Every Skill should start by making the execution shape explicit.

1. Ask the user to choose **minimal solution** or **complete solution**.
2. Ask the user to choose **module-by-module** or **task-by-task** execution.
3. Keep each batch small enough to review, verify, document, and commit independently.
4. Update the relevant `docs/` files immediately when behavior, API, architecture, or workflow expectations change.
5. End each completed batch at a commit-ready boundary with one concern per commit.

---

## Candidate Template

```
### Skill Name

**Trigger:** When does this workflow start?
**Inputs:** What information is needed?
**Execution Options:**
- Solution scope: minimal / complete
- Delivery shape: module-by-module / task-by-task
**Batched Steps:**
1. ...
2. ...
3. ...
**Output:** What is produced?
**Verification:** How do you know it worked?
**Definition of Done:** What must be true before the batch is complete?
**Automation potential:** Script / Prompt / Manual checklist
```

---

## Universal Candidates

These are stack-agnostic workflows that apply to most projects.

### 1. feature-scaffold
- **Trigger:** A new feature is requested with a short spec or user story.
- **Inputs:** Feature name, spec description, target module, selected execution options.
- **Execution Options:**
  - Solution scope: minimal scaffold for one reviewable slice / complete scaffold for the full requested feature surface.
  - Delivery shape: module-by-module / task-by-task.
- **Batched Steps:**
  1. Confirm the requested scope and execution shape.
  2. Create the folder structure described by `docs/architecture.md`.
  3. Add placeholder files for the smallest reviewable batch (component, service, route, test, types as needed).
  4. Register the new surface in routing, exports, or index files.
  5. Add a skeleton test.
  6. Update `docs/plan.md` and any affected `docs/` files before closing the batch.
  7. Prepare the batch for a single-purpose commit.
- **Output:** A compilable scaffold with one passing skeleton test and matching docs updates.
- **Verification:** `typecheck` and `test` pass for the scaffolded batch.
- **Definition of Done:** The scaffold compiles, the batch is documented, and the diff is small enough for its own commit.

### 2. test-diagnose-repair
- **Trigger:** One or more tests are failing.
- **Inputs:** Failing test names or file paths, error output, selected execution options.
- **Execution Options:**
  - Solution scope: minimal fix for the confirmed root cause / complete fix including all directly related regressions.
  - Delivery shape: module-by-module / task-by-task.
- **Batched Steps:**
  1. Read the failing test and its error message.
  2. Identify the root cause (regression, environment, flaky test, or spec change).
  3. Write a fix plan for the current batch.
  4. Apply the smallest correct fix.
  5. Run the affected tests and confirm green.
  6. Run the quality gate required for the batch.
  7. Update `docs/plan.md` and any impacted docs before closing the batch.
  8. Prepare a commit that contains only the reviewed repair.
- **Output:** Green tests plus a summary of the root cause and applied fix.
- **Verification:** The affected tests and the required quality gate pass.
- **Definition of Done:** The confirmed failure is resolved, docs are synced, and the repair is commit-ready.

### 3. code-review
- **Trigger:** Review is needed before a PR or after completing a task.
- **Inputs:** Diff or list of changed files, related spec or task description.
- **Execution Options:**
  - Solution scope: minimal review focused on the current batch / complete review across all changed batches.
  - Delivery shape: module-by-module / task-by-task.
- **Batched Steps:**
  1. Walk through `AGENTS.md` §7 (correctness, quality, testing, architecture, docs, git discipline).
  2. Flag issues as Critical, Important, or Minor.
  3. For each Critical or Important issue, propose a concrete fix.
  4. Check whether docs were updated in the same batch.
  5. Check whether the batch is small enough for one concern per commit.
  6. Summarize strengths, issues, and the overall assessment.
- **Output:** A structured review with actionable feedback.
- **Verification:** All Critical issues are resolved before merge.
- **Definition of Done:** The review covers code, docs, and commit discipline for the intended scope.

### 4. pr-summary
- **Trigger:** A PR description needs to be generated from a diff.
- **Inputs:** Git diff, related spec or task description, selected execution options.
- **Execution Options:**
  - Solution scope: minimal summary for the current batch / complete summary for the full change set.
  - Delivery shape: module-by-module / task-by-task.
- **Batched Steps:**
  1. Summarize what changed and why.
  2. List the affected modules, routes, or APIs.
  3. Note breaking changes or migration steps.
  4. List testing completed and testing still needed.
  5. Describe doc updates shipped with the batch.
  6. Assess rollout risk (low, medium, high).
- **Output:** A Markdown PR description ready to paste.
- **Verification:** Human review.
- **Definition of Done:** The summary accurately describes the reviewed scope and its verification status.

### 5. decision-record
- **Trigger:** A meaningful technical tradeoff has been made.
- **Inputs:** Context, options considered, chosen option.
- **Execution Options:**
  - Solution scope: minimal entry for the immediate decision / complete entry with broader surrounding rationale.
  - Delivery shape: module-by-module / task-by-task, matching the work that triggered the decision.
- **Batched Steps:**
  1. Use the template in `docs/decisions.md`.
  2. Fill context, decision, consequences, and alternatives.
  3. Add date and status.
  4. Link the decision to the current implementation batch when relevant.
  5. Ensure the decision record lands in the same batch as the related change.
- **Output:** A new entry in `docs/decisions.md`.
- **Verification:** The entry is complete and the rationale is clear.
- **Definition of Done:** The tradeoff is documented in the same reviewable batch as the related implementation.

### 6. web-search-verify
- **Trigger:** A library version, API signature, CLI flag, or official recommendation is uncertain.
- **Inputs:** Package name, API name, topic, current assumption.
- **Execution Options:**
  - Solution scope: verify only the blocking external fact / verify all closely related external facts needed for the chosen batch.
  - Delivery shape: task-by-task by default; module-by-module only when the uncertainty maps cleanly to a module.
- **Batched Steps:**
  1. Start with repository files and local docs.
  2. If uncertainty remains, ask the user to choose local-only analysis, search only when needed, or an already configured search tool.
  3. Search the official docs or changelog for the specific question.
  4. Compare the result with `package.json`, `pyproject.toml`, or local source.
  5. If a discrepancy is found, propose the corrected usage.
  6. Record any resulting workflow or architecture change in the relevant docs.
- **Output:** A verified fact with a source URL, or a corrected approach.
- **Verification:** The fact comes from official documentation rather than memory.
- **Definition of Done:** The external fact is resolved, the user-approved search scope was respected, and any resulting docs changes are captured.
- **Optional Note:** If the environment already provides a dedicated search integration, it may be used only after the user explicitly chooses it.
- **Automation potential:** Prompt — trigger with "verify version of X" or "check if API Y exists in version Z".

### 7. mcp-tool-use
- **Trigger:** The task requires real state from outside the visible context, such as filesystem listing, git history, GitHub issue or PR details, or database schema.
- **Inputs:** Task description, which MCP server to use.
- **Execution Options:**
  - Solution scope: minimal real-state lookup for the current batch / complete lookup for all directly related batches.
  - Delivery shape: module-by-module / task-by-task.
- **Batched Steps:**
  1. Confirm the relevant MCP server is configured in `.mcp.json`.
  2. Use the tool to fetch real state without inferring from memory.
  3. Validate that the returned data is relevant before acting on it.
  4. Proceed with implementation using the verified data.
  5. If the tool is unavailable, fall back to the terminal command from `docs/commands.md`.
  6. Update `docs/plan.md` and any affected docs before closing the batch.
- **Output:** A task completed using verified real-world state rather than assumptions.
- **Verification:** The action was based on tool-returned data rather than inference.
- **Definition of Done:** The batch uses verified state, related docs are synced, and the work remains reviewable.

---

## Frontend Design Candidates

These candidates apply to frontend profiles only (`nextjs`, `react`, `vue`).

### 8. impeccable-frontend-design
- **Trigger:** A UI page, component, or design system is being built or reviewed. Use before shipping any non-trivial UI.
- **Inputs:** Target component or page, scope, design goal, selected execution options.
- **Execution Options:**
  - Solution scope: minimal polish for the current UI slice / complete treatment for the requested surface.
  - Delivery shape: module-by-module / task-by-task.
- **Batched Steps:**
  1. Define aesthetic direction (tone, constraints, differentiation) before writing code.
  2. Typography: pair distinctive fonts, use a modular scale with fluid sizing via `clamp()`, and vary weights for hierarchy.
  3. Color: use OKLCH or `color-mix()`, tint neutrals toward the brand hue, and avoid generic AI palettes.
  4. Layout: create spacing rhythm, embrace asymmetry, avoid card-in-card nesting, and avoid identical icon-grid cards.
  5. Motion: use exponential easing such as `ease-out-quart`, `ease-out-quint`, or `ease-out-expo`; animate `transform` and `opacity`, not layout properties.
  6. Interaction: prefer progressive disclosure, optimistic UI, and instructive empty states.
  7. Run the **AI Slop Test**. If the result still looks generic, revise.
  8. Run `/audit` for accessibility, performance, and responsiveness, then finish with `/polish` before shipping.
  9. Update any affected docs before closing the batch.
- **Output:** Visually distinctive, production-grade UI that avoids generic AI aesthetics.
- **Verification:** The AI Slop Test is satisfied and `/audit` reports no critical issues.
- **Definition of Done:** The UI slice is verified, documented where needed, and ready for a focused commit.
- **Automation potential:** Prompt — use Impeccable commands such as `/audit`, `/critique`, `/normalize`, `/polish`, `/distill`, `/animate`, `/harden`, `/bolder`, and `/quieter`.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable) — 1 skill, 17 commands, curated anti-patterns. Apache 2.0.
