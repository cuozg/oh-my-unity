# Orchestration Patterns

Senior patterns for coordinating complex Unity development tasks.

## 1. Feature Handoff Pattern

When moving from planning to implementation:
1.  **Orchestrator**: Completes `/unity-plan`.
2.  **Orchestrator**: Identifies logic components for `unity-coder` and UI for `unity-ui-developer` (if applicable).
3.  **Specialist**: Implements code following `unity-coder` best practices.
4.  **Orchestrator**: Validates against the plan and runs `/unity-test`.

## 2. The "Debug-Fix-Verify" Loop

1.  **Debugger**: Uses `unity-debugger` to gather stack traces.
2.  **Investigator**: Uses `unity-code-investigator` to find the root cause in logic.
3.  **Coder**: Applies the fix using `unity-coder`.
4.  **Orchestrator**: Refreshes Unity and verifies the log is clean.

## 3. Tech Lead Findings Template

For high-level project analysis, use this structure:

- **Current State**: Summary of the codebase and assets.
- **Architectural Risks**: Performance, technical debt, or platform limitations.
- **Task Route**: List of which Specialized Skills will handle each part of the work.
- **Definition of Done**: Criteria for success.
