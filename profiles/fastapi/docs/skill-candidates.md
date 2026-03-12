# Skill Candidates — FastAPI Profile

Extends the universal candidates in the base `docs/skill-candidates.md`.

---

### 1. endpoint-scaffold
- **Trigger:** Add a CRUD or query endpoint from a short contract.
- **Inputs:** Resource name, HTTP method, request/response fields.
- **Steps:**
  1. Create Pydantic schemas (request + response) in `schemas/`.
  2. Create service function in `services/` with business logic stub.
  3. Create repository function in `repositories/` with data access stub.
  4. Create route in `api/routes/` wiring schema → service → repository.
  5. Register route in `main.py` or router aggregation.
  6. Add route tests with `TestClient`.
- **Output:** Compilable endpoint with schemas, service, repository, and passing test.
- **Verification:** `mypy` + `pytest` + `ruff check` pass.

### 2. api-test-repair
- **Trigger:** Failing API tests.
- **Inputs:** Failing test names, error output.
- **Steps:**
  1. Read failing test and trace to root cause.
  2. Classify: regression, schema change, data issue, environment issue.
  3. Fix route, schema, service, or test as needed.
  4. Run tests — confirm green.
  5. Run full quality gate.
- **Output:** All tests green, root cause summary.
- **Verification:** Full quality gate passes.

### 3. schema-change-review
- **Trigger:** Pydantic request or response model changed.
- **Inputs:** Old and new schema, reason for change.
- **Steps:**
  1. Identify all routes using the changed schema.
  2. Check client impact (breaking change?).
  3. Update tests for all affected routes.
  4. Add migration notes if the change is breaking.
  5. Run quality gate.
- **Output:** Impact analysis, updated routes and tests, migration notes.
- **Verification:** `mypy` + `pytest` pass, breaking changes documented.

### 4. dependency-audit
- **Trigger:** New dependency added or existing dependency version changed.
- **Inputs:** Package name, version, reason.
- **Steps:**
  1. Check if the dependency is actively maintained and well-tested.
  2. Check license compatibility.
  3. Add to `pyproject.toml` in the correct section.
  4. Update `docs/decisions.md` with rationale.
  5. Verify install works cleanly.
- **Output:** Updated `pyproject.toml`, decision record.
- **Verification:** `pip install -e .` succeeds, `pytest` passes.
