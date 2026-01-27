---
description: Workflow for exploring and explaining complex logic, execution flows, and feature implementations.
---

# Workflow: Investigate Code Logic

Follow these steps to conduct a deep-dive investigation into existing features or complex logic within the Unity project.

1.  **Define Target**: 
    - Identify the specific feature, class, or method you need to understand.
    - Ask for clarification if the scope is too broad (e.g., "The entire Combat system" vs "The damage calculation logic").
2.  **Initial Discovery**:
    - **Run Trace Logic**: Execute `.agent/skills/unity-code-investigator/scripts/trace_logic.sh [Target]` to find where the logic is defined and utilized.
    - **Map Entry Points**: Identify triggers like UI Buttons, Unity Events, or API calls.
3.  **Static Analysis & Tracing**:
    - Use `view_file` to read the primary scripts.
    - Follow the execution path from the entry point through method calls.
    - Identify key variables, states, and conditional branches.
4.  **Asset Context Check**:
    - Use `grep_search` or `find_gameobjects` to see how the code is hooked up in the inspector.
    - Look for `UnityEvent` bindings or `Component` assignments that drive the behavior.
5.  **Identify Side Effects**:
    - Note any modifications to Singletons, static data, or global managers.
    - Identify events being fired or external API calls.
6.  **Analyze Logic Intent**:
    - Determine *why* certain decisions were made (e.g., performance optimizations, edge-case handling).
    - Identify any business rules or game design constraints embedded in the code.
7.  **Generate Report**:
    - Populate the `INVESTIGATION_REPORT.md` based on the template in `.agent/skills/unity-code-investigator/resources/templates/`.
    - Create a file named `INVESTIGATION_[TargetName].md` in the `Documents/Investigations/` folder.
    - Include **Mermaid sequence diagrams** to visualize complex callback chains or multi-system interactions.
8.  **Final Summary**:
    - Provide a concise summary to the user.
    - Highlight potential risks, technical debt, or optimization opportunities found during the investigation.
