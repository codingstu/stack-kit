---
applyTo: "src/**/*.vue,src/**/*.ts"
---

Vue 3 + Vite + Composition API. See `AGENTS.md` for full workflow rules.

- `<script setup lang="ts">` by default. Explicit `defineProps<T>()` and `defineEmits<T>()`.
- Views for page composition, Components for reusable UI, Composables for shared logic.
- API calls in `services/` — never inline in views or stores.
- Pinia only for genuinely shared distant state — record decision in `docs/decisions.md`.
- Split components > 200 lines. One component per `.vue` file.
- Run quality gate after changes: lint → typecheck → test → build.
- Use code review checklist in `AGENTS.md` §7 before submitting.
