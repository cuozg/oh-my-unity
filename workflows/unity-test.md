---
description: Workflow for creating and running automated tests using the Unity Test Framework.
---

# Workflow: Unity Automated Testing

Follow these steps to implement and execute tests for your Unity project.

1.  **Analyze Target**: 
    - Identify the code or feature that needs validation.
    - Check for existing assembly definitions (`.asmdef`) to determine where to place the tests.
2.  **Define Test Strategy**:
    - Choose **Edit Mode** for pure logic, algorithms, and non-Unity interactions.
    - Choose **Play Mode** for physics, coroutines, component lifecycles, and UI.
3.  **Setup Environment**:
    - If needed, create a `Tests` folder and a matching `.asmdef` file referencing `UnityEngine.TestRunner`.
    - Create a test class following the `[Subject]Tests.cs` naming pattern.
4.  **Implement Tests**:
    - Use `[SetUp]` and `[TearDown]` for state management.
    - Write test methods using `[Test]` or `[UnityTest]`.
    - Follow the **Arrange-Act-Assert** pattern.
5.  **Run Tests**:
    // turbo
    - Use `unityMCP.run_tests` to execute the suite.
    - Alternatively, use the Unity Editor's Test Runner window.
6.  **Analyze Results**:
    - Check for failures in the console or test result logs.
    - If tests fail, investigate the root cause using `/investigate-code`.
7.  **Refactor & Verify**:
    - Fix the code and re-run the tests to ensure success.
    - (Optional) Generate a coverage report to identify gaps.
8.  **Document Results**:
    - (Optional) Create a `TEST_RESULT_[Feature].md` in `Documents/Tests/` using the skill templates.
