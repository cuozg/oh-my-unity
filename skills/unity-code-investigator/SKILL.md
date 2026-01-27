---
name: unity-code-investigator
description: Expert in deep-diving into C# logic, tracing execution flows, and explaining complex game features within the Unity codebase.
---

# Unity Code Investigator Skill

This skill is specialized for exploring, analyzing, and explaining the logic, functions, and features within a Unity project. It helps developers understand "how it works" and "where it's handled".

## Core Capabilities

### 1. Functional Deep-Dive
- **Logic Extraction**: Distill complex method logic into human-readable explanations.
- **Business Rule Identification**: Identify game rules and constraints hidden in the code.
- **State Management Analysis**: Understand how variables and states are modified across the lifecycle.

### 2. Execution Flow Tracing
- **Event Flow**: Trace logic from a trigger (UI Button, Network Packet, Trigger Volume) to its final result.
- **Callback Chains**: Map out delegates, `UnityEvent`s, and async `Awaitable` sequences.
- **Lifecycle Mapping**: Explain when logic executes (Awake -> Start -> Update -> FixedUpdate).

### 3. Feature Mapping
- **System Boundaries**: Identify all classes, interfaces, and prefabs that constitute a specific feature.
- **Integration Points**: Find where a feature hooks into the core engine or third-party plugins.
- **Data-Logic Binding**: Trace how ScriptableObjects or external data drive specific logic behaviors.

### 4. Code Search & Discovery
- **Pattern Matching**: Find implementations of specific design patterns (Singletons, Factories, Observers).
- **Utility Discovery**: Locate existing helper methods to avoid code duplication.
- **Constraint Detection**: Find hardcoded values or logic limits.

## Standard Investigation workflow

1.  **Entry Point Identification**: Find the starting script or method (e.g., `OnClick`, `OnTriggerEnter`).
2.  **Static Analysis**: Read the code, follow method calls, and mapping references.
3.  **Cross-Reference**: Check for usages in other scripts or bindings in the Unity Editor (via `find_gameobjects` or `grep`).
4.  **Synthesis**: Create a summary report explaining the logic flow and key components.

## Standard Report Format

Use the `INVESTIGATION_REPORT.md` template in `resources/templates/`.

## Best Practices

- **Breadth-First Search**: Start by getting a high-level view of the files involved before diving deep into one.
- **Unity Context Matters**: Always consider how Unity's own systems (Physics, Input, UI) interact with the C# logic.
- **Identify Side Effects**: Look for changes to global states, singletons, or external systems.
- **Explain "Why", Not Just "What"**: Aim to understand the intent behind the code.
