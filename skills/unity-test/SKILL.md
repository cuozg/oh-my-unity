---
name: unity-test
description: "Automated testing using the Unity Test Framework (UTF). Use when you need to: (1) Create Edit Mode or Play Mode tests, (2) Configure test assembly definitions (.asmdef), (3) Mock dependencies for isolation, or (4) Analyze test results and coverage."
---

# Unity Testing

Create, execute, and manage automated tests within Unity to ensure code quality and prevent regressions.

## Core Capabilities

- **Suite Creation**: Set up fast Edit Mode tests or interactive Play Mode tests.
- **Infrastructure**: Configure `.asmdef` files to include the Unity Test Runner.
- **Mocking**: Create stubs and mock objects to isolate gameplay logic.
- **Reporting**: Execute tests via `unityMCP` and analyze results for failures or coverage gaps.

## Development Workflow

1.  **Analyze Target**: 
    - Identify the specific method, class, or feature requiring validation.
    - Check for existing assembly definitions (`.asmdef`) and folder structures.
2.  **Define Strategy**:
    - Choose **Edit Mode** for pure logic, algorithms, and non-Unity integrations.
    - Choose **Play Mode** for physics, component lifecycles, coroutines, and UI interactions.
3.  **Setup Environment**:
    - Create a `Tests` folder and a matching `.asmdef` file referencing `UnityEngine.TestRunner` if missing.
    - Implement a test class using patterns from [TEST_EXAMPLES.md](references/TEST_EXAMPLES.md).
4.  **Implementation**:
    - Write test methods using the **Arrange-Act-Assert** pattern.
    - Utilize `[SetUp]` and `[TearDown]` for robust state and object management.
5.  **Execution**:
    - Use `unityMCP.run_tests` to execute the suite and capture results.
6.  **Verify & Refactor**:
    - If tests fail, leverage `/unity-fix-errors` or `/unity-investigate-code` for root cause analysis.
    - Refactor code and re-run until all tests in the suite pass successfully.
7.  **Document**:
    - (Optional) Use `TEST_PLAN_TEMPLATE.md` from `assets/templates/` to formalize the testing strategy and results.

## Patterns & Examples

Refer to [TEST_EXAMPLES.md](references/TEST_EXAMPLES.md) for code snippets and assembly configurations. Use the `TEST_PLAN_TEMPLATE.md` in `assets/templates/` for structured planning.

## Best Practices

- **Atomic Assertions**: Each test should ideally validate one specific behavior.
- **Cleanup**: Always destroy test GameObjects in `TearDown`.
- **Naming**: Use `[Subject]_[Scenario]_[ExpectedResult]` (e.g., `Player_TakesDamage_HealthDecreases`).
- **Isolation**: Ensure tests do not depend on external data or local machine configurations.
