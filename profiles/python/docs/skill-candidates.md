# Skill Candidates — Python Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. module-scaffold
- **Trigger:** Add a new module (core, service, or adapter) from a short spec.
- **Inputs:** Module name, responsibility, public interface.
- **Steps:**
  1. Create module directory under the appropriate layer (`core/`, `services/`, `adapters/`).
  2. Add `__init__.py` with public exports.
  3. Add implementation file with typed function stubs.
  4. Add test file with at least one test per public function.
- **Output:** Compilable module with typed stubs and passing skeleton tests.
- **Verification:** `mypy` + `pytest` pass.

### 2. cli-command-add
- **Trigger:** Add a new CLI command or subcommand.
- **Inputs:** Command name, arguments, expected behavior.
- **Steps:**
  1. Add command function in `cli.py` with argument parsing.
  2. Wire to service layer for business logic.
  3. Add CLI smoke test.
  4. Update help text and usage examples.
- **Output:** New command with tests and documentation.
- **Verification:** `pytest` passes, `python -m <project> <command> --help` works.

### 3. adapter-replace
- **Trigger:** Replace or upgrade an external integration (DB driver, API client, etc.).
- **Inputs:** Old adapter, new adapter, reason for change.
- **Steps:**
  1. Define the interface the adapter must satisfy (Protocol or ABC).
  2. Implement the new adapter behind the same interface.
  3. Write integration tests for the new adapter.
  4. Swap in services — no service code should change.
  5. Remove old adapter if no longer needed.
  6. Record decision in `docs/decisions.md`.
- **Output:** New adapter, preserved service layer, decision record.
- **Verification:** All tests pass, no service code changed.

### 4. test-diagnose-repair
- **Trigger:** Failing tests after a change.
- **Inputs:** Failing test names, error output.
- **Steps:**
  1. Identify root cause (regression, env issue, flaky, spec change).
  2. Fix at the appropriate layer (core, service, adapter, or test).
  3. Run full quality gate.
- **Output:** All tests green, root cause explained.
- **Verification:** `ruff check` + `mypy` + `pytest` pass.
