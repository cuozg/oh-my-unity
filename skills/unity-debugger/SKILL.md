---
name: unity-debugger
description: Systematic diagnosis and resolution of Unity technical errors. Use when: (1) The console reports compiler errors or exceptions, (2) Play Mode behavior is unexpected or broken, (3) A build fails, or (4) You need to generate a structured debug report in Documents/Debugs/.
---

# Unity Debugger

A systematic approach to identifying and resolving technical issues in Unity using Editor automation tools.

## Core Capabilities

- **Intel Gathering**: Targeted reading of the Unity console to extract stack traces and frequency.
- **Root Cause Analysis**: Mapping errors to specific script lines, variable states, and scene configurations.
- **Hypothesis Testing**: Proposing and validating fixes in a controlled loop.
- **Structured Reporting**: Generating detailed `.md` reports for audit and collaboration.

## Debugging Workflow

1. **Information Extraction**:
   - Use `unityMCP.read_console` to capture the exact error message and full stack trace.
   - Use `unityMCP.manage_scene` (screenshot) if the error involves visual artifacts or UI issues.
2. **Contextual Investigation**:
   - Locate the failing line with `view_file`.
   - Use `grep_search` to find all references to the failing objects.
   - Check component property values via `mcpforunity://scene/gameobject/{id}/components`.
3. **Resolution**:
   - Formulate a fix (e.g., null guard, singleton check, logic correction).
   - Apply using `script_apply_edits`.
   - Call `refresh_unity(compile="request")` and wait for readiness.
4. **Reporting**:
   - Populate the `DEBUG_REPORT_TEMPLATE.md` from `assets/templates/`.
   - Save to `Documents/Debugs/DEBUG_[ErrorName]_[Timestamp].md`.

## Best Practices

- **Stack Trace Priority**: Always examine the top of the stack trace first to find the immediate trigger.
- **Clean Slate**: Verify the error persists after a `refresh_unity` to rule out transient state issues.
- **Isolate**: Try to reproduce the error in an empty test scene if it's systemic.
- **Evidence-Based**: Only declare a fix successful if the console remains clear after reproduction steps.
