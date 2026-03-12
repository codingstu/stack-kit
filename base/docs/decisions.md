# Decisions

Record meaningful choices so future sessions (and new team members) understand why things are the way they are.

Use this format:

---

## YYYY-MM-DD — Decision Title

**Status:** accepted | superseded by YYYY-MM-DD entry | deprecated

**Context:**
What situation or requirement triggered this decision?

**Decision:**
What was chosen and how will it work?

**Consequences:**
What are the expected effects — both positive and negative?

**Alternatives Considered:**
What other options were evaluated and why were they rejected?

---

<!-- Example:

## 2026-03-12 — Use Vitest instead of Jest

**Status:** accepted

**Context:**
Project uses Vite for bundling. Jest requires additional transform configuration for ESM and TypeScript.

**Decision:**
Use Vitest as the test runner. It shares Vite's config and supports ESM natively.

**Consequences:**
- Positive: Zero-config TypeScript and ESM support, faster watch mode.
- Negative: Smaller ecosystem of plugins compared to Jest.

**Alternatives Considered:**
- Jest + SWC: works but adds configuration overhead and a separate tool.
- Node.js native test runner: too minimal for component testing.

-->
