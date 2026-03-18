---
agent: true
description: Review code changes against the project's quality standards
---

# Review

You are performing a code review for this project.

## Context
Read these files first:
- `AGENTS.md` (especially §7 Code Review Checklist and Git Discipline guidance)
- `docs/architecture.md`
- `docs/spec.md`
- `docs/plan.md`

## Input
You will receive either:
- A git diff
- A list of changed files
- A description of what was implemented

## Review Process

Walk through each section of the checklist from `AGENTS.md` §7.

### 1. Correctness
- Does the change match the spec or task description?
- Are edge cases and error paths handled?
- Is there any regression to existing behavior?
- Is the implemented scope aligned with the chosen execution mode (minimal vs complete)?

### 2. Quality
- Are functions and files reasonably small and focused?
- Is naming clear and domain-specific?
- Is there code duplication that should be extracted?
- Is there dead code, debug logs, or TODO hacks left behind?
- Is the batch size reviewable and consistent with module-by-module or task-by-task delivery?

### 3. Testing
- Is new or changed behavior covered by tests?
- Do all required tests pass?
- Do test names describe behavior, not implementation?
- Are tests using real code where possible instead of over-mocking?

### 4. Architecture
- Does the change respect module boundaries from `docs/architecture.md`?
- Is business logic kept out of UI or route entry files?
- Are infrastructure concerns (DB, APIs) kept at the edges?
- Do dependencies flow inward?

### 5. Documentation
- Were docs updated in the same batch if API, behavior, architecture, or workflow expectations changed?
- Does `docs/plan.md` reflect the latest completed batch?
- Is `docs/decisions.md` updated if a meaningful tradeoff was made?
- Do public interfaces have clear types or docstrings?

### 6. Commit Discipline
- Is the current batch small enough for one concern per commit?
- Would the commit message clearly describe the reviewed batch?
- Should this diff be split before merge?

## Output Format

```markdown
## Review Summary

### Strengths
- ...

### Issues

#### Critical (must fix before merge)
- [ ] ...

#### Important (should fix)
- [ ] ...

#### Minor (consider fixing)
- [ ] ...

### Assessment
Ready to merge / Needs changes / Needs discussion
```

## Rules
- Be specific — point to exact files and lines.
- For each issue, suggest a concrete fix.
- Do not rubber-stamp. Find at least one improvement opportunity.
- Do not flag style preferences that are not in the project's documented standards.
- Always check whether documentation updates and commit boundaries match the implementation batch.
