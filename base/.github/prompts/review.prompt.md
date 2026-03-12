---
mode: agent
description: Review code changes against the project's quality standards
---

# Review

You are performing a code review for this project.

## Context
Read these files first:
- `AGENTS.md` (especially §7 Code Review Checklist, §8 Component Splitting)
- `docs/architecture.md`
- `docs/spec.md`

## Input
You will receive either:
- A git diff
- A list of changed files
- A description of what was implemented

## Review Process

Walk through each section of the checklist from `AGENTS.md` §7:

### 1. Correctness
- Does the change match the spec or task description?
- Are edge cases and error paths handled?
- Is there any regression to existing behavior?

### 2. Quality
- Are functions and files reasonably small and focused?
- Is naming clear and domain-specific?
- Is there code duplication that should be extracted?
- Is there dead code, debug logs, or TODO hacks left behind?

### 3. Testing
- Is new/changed behavior covered by tests?
- Do all tests pass?
- Do test names describe behavior, not implementation?
- Are tests using real code where possible (not over-mocked)?

### 4. Architecture
- Does the change respect module boundaries from `docs/architecture.md`?
- Is business logic kept out of UI/route entry files?
- Are infrastructure concerns (DB, APIs) kept at the edges?
- Do dependencies flow inward?

### 5. Documentation
- Are docs updated if API, behavior, or architecture changed?
- Is `docs/decisions.md` updated if a meaningful tradeoff was made?
- Do public interfaces have clear types or docstrings?

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
