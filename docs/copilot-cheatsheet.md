# Copilot Prompt Cheatsheet

> **Default prefix:**
> Follow this repo's conventions: read `AGENTS.md`, `.github/copilot-instructions.md`, and relevant docs first. Make only minimal changes. Provide a plan first, then implement, then verification steps.

Works with: GitHub Copilot Chat / Agent, Cursor, Claude Code.

---

## 1. General Development

```text
Follow this repo's conventions: read AGENTS.md, .github/copilot-instructions.md, and relevant docs first. Make only minimal changes. Provide a plan first, then implement, then verification steps.
```

---

## 2. New Feature

```text
Follow this repo's conventions: read AGENTS.md, relevant docs, and the current module code. Give me a minimal implementation plan; once confirmed, implement it directly and add the necessary tests and verification steps.
```

Concise variant:

```text
Implement this requirement following repo conventions. Make only the minimal necessary changes — don't refactor unrelated code.
```

---

## 3. Bug Fix

```text
Follow this repo's conventions to diagnose this issue: identify the root cause first, then provide a minimal fix, then apply it and explain how to verify the fix is effective.
```

Diagnose only (no code changes):

```text
Follow this repo's conventions to diagnose this bug first — do not change any code yet. Give me the root cause, impact scope, and minimal fix plan.
```

---

## 4. Plan First

```text
Follow this repo's conventions — do not write code yet. Give me a minimal implementation plan, affected files, risks, and verification approach.
```

Multi-option comparison:

```text
Following repo conventions, give me 2–3 implementation options, compare them by complexity, maintainability, and change scope, and recommend the minimal viable option.
```

---

## 5. Incremental Changes

```text
Follow this repo's conventions to make incremental changes to the existing implementation. Reuse current module patterns and don't introduce new abstractions unless the existing structure is clearly unsuitable.
```

Strictly follow existing style:

```text
Follow repo conventions to modify this code. Strictly follow existing naming, directory structure, and implementation style. Don't introduce new architectural patterns.
```

---

## 6. Write Tests

```text
Follow this repo's conventions to add the necessary tests for this change. Prioritize coverage of core behavior, edge cases, and branches likely to regress.
```

List test plan first:

```text
Following repo conventions, tell me what test cases should be added for this change — don't write the implementation yet.
```

Only the essential tests:

```text
Following repo conventions, add only the essential tests. Don't pile on low-value cases just for coverage.
```

---

## 7. Code Review

```text
Follow this repo's conventions to review the current changes. Focus on correctness, potential regressions, test gaps, edge cases, and architectural constraint violations.
```

Strict mode:

```text
Do a strict code review following repo conventions: list all issues first, sort by severity, and provide minimal fix suggestions for each.
```

Using the review prompt:

```text
Use the standard from review.prompt.md to review the current diff.
```

---

## 8. Small Refactoring

```text
Follow this repo's conventions to refactor this code to improve readability and maintainability without changing external behavior. State the refactoring boundaries first, then implement.
```

Minimal scope:

```text
Follow repo conventions for a small-scope refactor. Tidy only the current function or module — don't spread to unrelated files.
```

---

## 9. Performance Optimization

```text
Follow this repo's conventions to analyze the performance of this code. Find bottlenecks and evidence first, then give a minimal optimization plan. Avoid premature optimization.
```

Direct optimization:

```text
Make a minimal performance optimization here following repo conventions. Preserve existing behavior and explain how to verify the before/after.
```

---

## 10. Frontend Page

```text
Follow this repo's conventions to implement this page. Prioritize reusing existing components and style patterns. Keep interactions complete and add the necessary state and error handling.
```

Form page:

```text
Follow repo conventions to implement this form page. Include validation, loading state, error state, and success feedback — only the minimal necessary interactions.
```

---

## 11. Backend Endpoint

```text
Follow this repo's conventions to implement this endpoint. Include request validation, error handling, response structure, and necessary tests. Reuse existing routing and service layer patterns as much as possible.
```

Scope limit:

```text
Follow repo conventions. Only modify the route, service, and tests related to this endpoint — don't spread changes to unrelated modules.
```

---

## 12. Type / Schema / Data Model Change

```text
Follow this repo's conventions to adjust this data structure. Keep upstream and downstream types consistent. List all affected locations and files that need to be updated.
```

Check impact scope first:

```text
Follow repo conventions to check the impact scope of this type or model change. List everything first, then update each one.
```

---

## 13. Documentation Update

```text
Follow this repo's conventions to add concise documentation for this change. Focus on purpose, entry points, key constraints, and common gotchas for developers.
```

Docs only:

```text
Follow repo conventions to update relevant docs. Keep content concise — only add information directly related to this change.
```

---

## 14. Pre-Commit Check

```text
Follow this repo's conventions to do a pre-commit check on the current changes. List the commands I should run, risks to confirm, and whether this change is missing tests or documentation.
```

Summarize for PR:

```text
Following repo conventions, summarize this change: give me a PR title, change summary, risk notes, and verification steps.
```

---

## 15. Two High-Frequency Control Phrases

Don't change code yet:

```text
Don't change any code yet. Following repo conventions, analyze the problem and give me a minimal plan, affected files, and verification method.
```

Just do it:

```text
Follow repo conventions to implement the minimal viable solution directly. Skip lengthy explanations. When done, give me only the change summary and verification steps.
```

---

## Quick Reference — 8 Most-Used Prompts

### General
```text
Follow this repo's conventions: read AGENTS.md, .github/copilot-instructions.md, and relevant docs first. Make only minimal changes. Provide a plan first, then implement, then verification steps.
```

### New feature
```text
Implement this requirement following repo conventions, make only the minimal necessary changes.
```

### Bug fix
```text
Debug this following repo conventions: identify root cause first, make minimal fix, tell me how to verify.
```

### Plan first
```text
Don't write code yet. Following repo conventions, give me the minimal implementation plan, affected files, risks, and verification approach.
```

### Code review
```text
Review the current changes following repo conventions, focusing on correctness, regression risk, test gaps, and architectural boundaries.
```

### Tests
```text
Add necessary tests for this change following repo conventions. Prioritize core behavior and edge cases.
```

### Small refactor
```text
Do a small-scope refactor following repo conventions. Don't change behavior and don't spread to unrelated modules.
```

### Pre-commit check
```text
Check if the current changes are ready to commit following repo conventions. Tell me what's still missing.
```

---

## Useful Constraint Phrases

Limit change scope:
```text
Only modify files directly related to the current task.
```

Prevent style drift:
```text
Follow existing code style and directory structure. Don't introduce new patterns.
```

Reduce explanations:
```text
Less explanation, just do it.
```

Plan before change:
```text
Give me the plan first. Wait for my confirmation before making changes.
```

Execute directly:
```text
Don't wait for my confirmation. Implement the minimal plan directly.
```

---

## Simplest Mental Model

Just remember 4 categories:

- **Do feature** → `Implement this requirement`
- **Fix problem** → `Debug and minimal fix`
- **See plan** → `Don't write code yet, give me the plan`
- **Do check** → `Review / test / pre-commit check`

Then prefix everything with:

```text
Follow this repo's conventions.
```

---

