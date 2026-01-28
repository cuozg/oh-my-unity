---
name: unity-code-investigator
description: "Comprehensive C# logic analysis and execution flow tracing within Unity projects. Use when you need to: (1) Understand how a specific feature works, (2) Trace an execution path from trigger to outcome, (3) Extract business rules from code, or (4) Identify system dependencies and side effects."
---

# Unity Code Investigator

Analyze and explain C# logic, execution flows, and feature implementations in Unity.

## Core Capabilities

- **Logic Extraction**: Distill complex methods into human-readable steps and identify hidden business rules.
- **Execution Tracing**: Map logic from triggers (UI, Network, Events) to final results, covering Awake to Update lifecycles.
- **Feature Mapping**: Identify all classes, interfaces, and prefabs constituting a specific feature.
- **Dependency Analysis**: Locate system boundaries and hooks into core engine or third-party plugins.

## Investigation Workflow

1.  **Define Scope**: 
    - Identify the target class, method, or feature.
    - Ask for specific entry points if the feature is large or complex.
2.  **Discovery**:
    - Run the helper script: `.agent/skills/unity-code-investigator/scripts/trace_logic.sh [Target]` to map definitions and usages.
    - Use `find_gameobjects` to identify how the code is bound to assets and prefabs in the scene.
3.  **Trace Flow**:
    - Use `view_file` to follow the logic from the entry point (e.g., `Update`, `OnClick`, `OnTriggerEnter`) through its call stack and dependencies.
    - Document internal state changes, conditional branches, and asynchronous sequences (`Awaitable`, Coroutines).
4.  **Analyze Side Effects**:
    - Identify modifications to Singletons, static Managers, or global persistent data.
    - Check for events being dispatched, network packets sent, or external system calls.
5.  **Generate Report**:
    - Use the `INVESTIGATION_REPORT.md` template from `assets/templates/`.
    - Save the final document in `Documents/Investigations/INVESTIGATION_[FeatureName].md`.
    - Utilize **Mermaid sequence diagrams** to visualize complex multi-system interactions or event chains.
6.  **Summary**:
    - Provide a high-level summary to the user.
    - Explicitly highlight technical debt, threading risks, or optimization opportunities discovered.

## Best Practices

- **Breadth-First**: Get a high-level view of involved files before deep-diving.
- **Unity Context**: Factor in how Unity systems (Physics, Input, UI) interact with C# logic.
- **Side Effects**: Always check for changes to global states or singletons.
- **Explain "Why"**: Aim to recover the original engineering intent.
