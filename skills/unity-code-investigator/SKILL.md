---
name: unity-code-investigator
description: Comprehensive C# logic analysis and execution flow tracing within Unity projects. Use when you need to: (1) Understand how a specific feature works, (2) Trace an execution path from trigger to outcome, (3) Extract business rules from code, or (4) Identify system dependencies and side effects.
---

# Unity Code Investigator

Analyze and explain C# logic, execution flows, and feature implementations in Unity.

## Core Capabilities

- **Logic Extraction**: Distill complex methods into human-readable steps and identify hidden business rules.
- **Execution Tracing**: Map logic from triggers (UI, Network, Events) to final results, covering Awake to Update lifecycles.
- **Feature Mapping**: Identify all classes, interfaces, and prefabs constituting a specific feature.
- **Dependency Analysis**: Locate system boundaries and hooks into core engine or third-party plugins.

## Investigation Workflow

1. **Identify Entry Point**: Find the starting script or method (e.g., `OnClick`).
2. **Static Analysis**: Follow method calls and map state modifications.
3. **Cross-Reference**: Check for usages in other scripts or Editor bindings via Unity MCP.
4. **Synthesize**: Create a summary explanation of the logic flow.

## Reporting

Use the `INVESTIGATION_REPORT.md` template in `assets/templates/`. Save the final report in `Documents/Investigations/`.

## Best Practices

- **Breadth-First**: Get a high-level view of involved files before deep-diving.
- **Unity Context**: Factor in how Unity systems (Physics, Input, UI) interact with C# logic.
- **Side Effects**: Always check for changes to global states or singletons.
- **Explain "Why"**: Aim to recover the original engineering intent.
