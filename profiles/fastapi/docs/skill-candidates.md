# Skill Candidates — FastAPI Profile

Extends the universal candidates in the base `docs/skill-candidates.md`. Keep the base execution model unchanged and document only FastAPI-specific differences here.

---

### 1. endpoint-scaffold
- **Trigger:** Add a CRUD or query endpoint from a short contract.
- **Inputs:** Resource name, HTTP method, request and response fields, selected execution options.
- **FastAPI-specific focus:** Pydantic schemas, route-service-repository separation, and route registration.
- **Batched Steps:**
  1. Confirm whether the user wants a minimal scaffold or a complete scaffold, then whether delivery is module-by-module or task-by-task.
  2. Create Pydantic schemas in `schemas/` for the current reviewable slice.
  3. Create a service function in `services/` with the business logic stub.
  4. Create a repository function in `repositories/` with the data access stub.
  5. Create the route in `api/routes/` wiring schema to service to repository.
  6. Register the route in `main.py` or router aggregation.
  7. Add route tests with `TestClient`.
  8. Update any affected docs before closing the batch.
- **Output:** A compilable endpoint with schemas, service, repository, and a passing test.
- **Verification:** `mypy`, `pytest`, and `ruff check` pass for the current batch.
- **Definition of Done:** The endpoint slice is routed correctly, documented where needed, and small enough for one focused commit.

### 2. api-test-repair
- **Trigger:** API tests are failing.
- **Inputs:** Failing test names, error output, selected execution options.
- **FastAPI-specific focus:** Route, schema, service, and repository interactions across the failing request path.
- **Batched Steps:**
  1. Read the failing test and trace it to the root cause.
  2. Classify the issue as regression, schema change, data issue, or environment issue.
  3. Fix the route, schema, service, repository, or test for the current batch.
  4. Run the affected tests and confirm green.
  5. Run the required quality gate.
  6. Update any affected docs before closing the batch.
- **Output:** Green tests plus a root-cause summary.
- **Verification:** The affected tests and the required quality gate pass.
- **Definition of Done:** The confirmed failure is fixed, docs are synchronized, and the repair batch is commit-ready.

### 3. schema-change-review
- **Trigger:** A Pydantic request or response model changes.
- **Inputs:** Old and new schema, reason for change, selected execution options.
- **FastAPI-specific focus:** Contract impact across all affected routes and clients, including migration notes for breaking changes.
- **Batched Steps:**
  1. Identify all routes using the changed schema.
  2. Check client impact and determine whether the change is breaking.
  3. Update tests for all affected routes in the current batch.
  4. Add migration notes if the change is breaking.
  5. Run the required quality gate.
  6. Update any affected docs before closing the batch.
- **Output:** Impact analysis, updated routes and tests, and migration notes when needed.
- **Verification:** `mypy` and `pytest` pass, and breaking changes are documented.
- **Definition of Done:** The contract change is reviewed for the chosen scope, docs are synced, and the diff remains reviewable.

### 4. dependency-audit
- **Trigger:** A new dependency is added or an existing dependency version changes.
- **Inputs:** Package name, version, reason, selected execution options.
- **FastAPI-specific focus:** Maintenance quality, license compatibility, `pyproject.toml` placement, and the architectural reason for adoption.
- **Batched Steps:**
  1. Check whether the dependency is actively maintained and well tested.
  2. Check license compatibility.
  3. Add it to `pyproject.toml` in the correct section.
  4. Update `docs/decisions.md` with the rationale.
  5. Verify installation works cleanly.
  6. Update any affected docs before closing the batch.
- **Output:** An updated `pyproject.toml` and a decision record.
- **Verification:** `pip install -e .` succeeds and `pytest` passes.
- **Definition of Done:** The dependency decision is documented in the same reviewable batch as the config change and is ready for one focused commit.
