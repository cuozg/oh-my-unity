---
name: unity-coder
description: Specialist in implementing Unity C# logic, gameplay systems, and architectural patterns. Use when: (1) Creating new C# scripts or MonoBehaviours, (2) Refactoring existing logic for better performance or maintainability, (3) Implementing complex gameplay features (controllers, combat, data systems), or (4) Integrating modern Unity 6 features like Awaitable and the New Input System.
---

# Unity Coder Skill

Expert in crafting robust, high-performance C# logic within the Unity ecosystem. This skill focuses on the implementation phase of development, transforming plans into living code.

## Core Capabilities

- **System Implementation**: Build modular gameplay systems (Inventory, Quests, Combat) from scratch.
- **Architectural Design**: Apply SOLID principles, ScriptableObject-driven design, and decoupled event-driven patterns.
- **Modern Tooling**: Leverage Unity 6 features (`Awaitable`, `UI Toolkit`, `New Input System`) for state-of-the-art implementations.
- **Refactoring & Optimization**: Identify code smells and technical debt, refactoring them into performant patterns.

## Logic Implementation Workflow

1.  **Requirement Clarification**:
    - Identify the target functionality and external dependencies (Models, UI, Data).
    - Determine if the script belongs in a specific assembly definition (`.asmdef`).
2.  **Implementation**:
    - Use the [SCRIPT_TEMPLATE.md](assets/templates/SCRIPT_TEMPLATE.md) for a standardized starting point.
    - Follow established patterns in [UNITY_CSHARP_PATTERNS.md](references/UNITY_CSHARP_PATTERNS.md).
    - Ensure strict adherence to `.agent/rules/unity-csharp-conventions.md`.
3.  **Self-Review & Verification**:
    - Verify logic against edge cases (e.g., null references, object destruction during async ops).
    - Check for common performance pitfalls (`Update` allocations, missing caching).
4.  **Sync & Compile**:
    - Use `refresh_unity(compile="request")` to validate the build.
    - Fix any compiler errors immediately using the `unity-debugger` skill if necessary.

## Best Practices

- **Composition Over Inheritance**: Prefer small, focused components over deep inheritance hierarchies.
- **Data-Driven**: Move configuration data and static definitions to `ScriptableObjects`.
- **Async Safety**: Always provide `CancellationToken` or check `this == null` after `await` in MonoBehaviours.
- **Clean Prefabs**: Ensure scripts expose meaningful properties to the Inspector to empower Designers.
- **Namespace Hygiene**: Always wrap code in project-specific namespaces (e.g., `_Project.Scripts.Feature`).
