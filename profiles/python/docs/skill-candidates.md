# Skill Candidates — Python Profile

Extends the universal candidates in the base `docs/skill-candidates.md`. Keep the base execution model unchanged and document only Python-specific differences here.

---

### 1. module-scaffold
- **Trigger:** Add a new module in `core`, `services`, or `adapters` from a short spec.
- **Inputs:** Module name, responsibility, public interface, selected execution options.
- **Python-specific focus:** Clear layer placement, typed public APIs, and test coverage for each public function.
- **Batched Steps:**
  1. Confirm whether the user wants a minimal scaffold or a complete scaffold, then whether delivery is module-by-module or task-by-task.
  2. Create the module directory under the appropriate layer for the current reviewable slice.
  3. Add `__init__.py` with public exports.
  4. Add implementation files with typed function stubs.
  5. Add a test file with at least one test per public function in scope.
  6. Update any affected docs before closing the batch.
- **Output:** A compilable module with typed stubs and passing skeleton tests.
- **Verification:** `mypy` and `pytest` pass for the current batch.
- **Definition of Done:** The module slice is typed, tested, documented where needed, and ready for one focused commit.

### 2. cli-command-add
- **Trigger:** Add a new CLI command or subcommand.
- **Inputs:** Command name, arguments, expected behavior, selected execution options.
- **Python-specific focus:** Thin CLI wiring, argument parsing, service-layer delegation, and help text.
- **Batched Steps:**
  1. Add the command function in `cli.py` with argument parsing for the current batch.
  2. Wire the command to the service layer.
  3. Add a CLI smoke test.
  4. Update help text and usage examples.
  5. Update any affected docs before closing the batch.
- **Output:** A new command with tests and documentation.
- **Verification:** `pytest` passes, and `python -m <project> <command> --help` works.
- **Definition of Done:** The command is callable, documented, verified, and isolated in a commit-sized batch.

### 3. adapter-replace
- **Trigger:** Replace or upgrade an external integration such as a DB driver or API client.
- **Inputs:** Old adapter, new adapter, reason for change, selected execution options.
- **Python-specific focus:** Interface stability, isolated adapter replacement, and decision logging.
- **Batched Steps:**
  1. Define the interface the adapter must satisfy using a `Protocol` or `ABC`.
  2. Implement the new adapter behind the same interface.
  3. Write integration tests for the new adapter.
  4. Swap the adapter in services without changing service-layer behavior.
  5. Remove the old adapter if no longer needed.
  6. Record the decision in `docs/decisions.md`.
  7. Update any affected docs before closing the batch.
- **Output:** A new adapter, a preserved service layer, and a decision record.
- **Verification:** All tests pass and service behavior remains unchanged.
- **Definition of Done:** The adapter swap is validated, documented in the same reviewable batch, and ready for one focused commit.

### 4. test-diagnose-repair
- **Trigger:** Tests fail after a change.
- **Inputs:** Failing test names, error output, selected execution options.
- **Python-specific focus:** Root-cause isolation across `core`, `services`, `adapters`, and tests.
- **Batched Steps:**
  1. Identify the root cause, such as regression, environment issue, flaky behavior, or spec change.
  2. Fix the issue at the appropriate layer for the current batch.
  3. Run the full quality gate.
  4. Update any affected docs before closing the batch.
- **Output:** Green tests with the root cause explained.
- **Verification:** `ruff check`, `mypy`, and `pytest` pass.
- **Definition of Done:** The confirmed failure is fixed, docs are synchronized, and the repair is commit-ready.
