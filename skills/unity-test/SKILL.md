---
name: unity-test
description: Automated testing using the Unity Test Framework (UTF). Use when you need to: (1) Create Edit Mode or Play Mode tests, (2) Configure test assembly definitions (.asmdef), (3) Mock dependencies for isolation, or (4) Analyze test results and coverage.
---

# Unity Testing

Create, execute, and manage automated tests within Unity to ensure code quality and prevent regressions.

## Core Capabilities

- **Suite Creation**: Set up fast Edit Mode tests or interactive Play Mode tests.
- **Infrastructure**: Configure `.asmdef` files to include the Unity Test Runner.
- **Mocking**: Create stubs and mock objects to isolate gameplay logic.
- **Reporting**: Execute tests via `unityMCP` and analyze results for failures or coverage gaps.

## Development Workflow

1. **Strategic Mapping**: Determine if the logic requires Edit Mode (algorithms/utilities) or Play Mode (MonoBehaviours/physics).
2. **Setup**: Create the test folder and assembly definition.
3. **Implementation**: Use `[SetUp]` and `[TearDown]` for state management. Follow the Arrange-Act-Assert pattern.
4. **Validation**: Run tests and refactor code until all suites pass.

## Patterns & Examples

Refer to [TEST_EXAMPLES.md](references/TEST_EXAMPLES.md) for code snippets and assembly configurations. Use the `TEST_PLAN_TEMPLATE.md` in `assets/templates/` for structured planning.

## Best Practices

- **Atomic Assertions**: Each test should ideally validate one specific behavior.
- **Cleanup**: Always destroy test GameObjects in `TearDown`.
- **Naming**: Use `[Subject]_[Scenario]_[ExpectedResult]` (e.g., `Player_TakesDamage_HealthDecreases`).
- **Isolation**: Ensure tests do not depend on external data or local machine configurations.
