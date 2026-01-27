---
name: unity-debugger
description: "Systematic diagnosis and resolution of Unity technical errors. Use when: (1) The console reports compiler errors or exceptions, (2) Play Mode behavior is unexpected or broken, (3) A build fails, or (4) You need to generate a structured debug report in Documents/Debugs/."
---

# Unity Debugger

A systematic approach to identifying and resolving technical issues in Unity using Editor automation tools.

## Core Capabilities

- **Intel Gathering**: Targeted reading of the Unity console to extract stack traces and frequency.
- **Root Cause Analysis**: Mapping errors to specific script lines, variable states, and scene configurations.
- **Hypothesis Testing**: Proposing and validating fixes in a controlled loop.
- **Structured Reporting**: Generating detailed `.md` reports for audit and collaboration.

## Debugging Workflow

1.  **Gather Intel**: 
    - Execute `read_console` to capture the exact error message, frequency, and full stack trace.
    - Identify the failing script, line number, and error type (e.g., `NullReferenceException`, `IndexOutOfRangeException`).
    - Use `manage_scene` (screenshot) if the issue involves visual artifacts or UI failures.
2.  **Contextual Investigation**:
    - Use `view_file` to read the code around the reported line.
    - Use `grep_search` to find all references to failing objects or variables to find the root cause.
    - Inspect component properties via `mcpforunity://scene/gameobject/{id}/components`.
3.  **Propose & Apply Fix**:
    - Draft a resolution (e.g., adding null guards, fixing race conditions, correcting logic).
    - Apply using `script_apply_edits` for structural changes or `apply_text_edits` for minor fixes.
4.  **Verify & Sync**:
    - Run `refresh_unity` with `compile="request"` and `wait_for_ready=true`.
    - Observe the console via `read_console` again. If errors persist, repeat from Step 1.
5.  **Runtime Validation**:
    - Use `manage_editor` (action="play") to verify the fix in action.
    - Ensure no regressions exist and the original issue is fully resolved.
6.  **Reporting & Prevention**:
    - Populate the `DEBUG_REPORT_TEMPLATE.md` from `assets/templates/`.
    - Save the report in `Documents/Debugs/DEBUG_[ErrorName]_[Timestamp].md`.
    - (Optional) Run `/unity-test` to ensure system-wide stability.

## Best Practices

- **Stack Trace Priority**: Always examine the top of the stack trace first to find the immediate trigger.
- **Clean Slate**: Verify the error persists after a `refresh_unity` to rule out transient state issues.
- **Isolate**: Try to reproduce the error in an empty test scene if it's systemic.
- **Evidence-Based**: Only declare a fix successful if the console remains clear after reproduction steps.
