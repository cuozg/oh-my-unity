---
name: unity-documentation
description: Expert in crafting and updating Unity project documentation (README, API, Architecture, Onboarding).
---

# Unity Documentation Skill

This skill empowers the agent to create clear, comprehensive, and maintainable documentation for Unity projects, following the standards of a Documentation Specialist.

## Core Capabilities

### 1. Project-Level Documentation
- **README.md**: Create overview, setup instructions, and quick start guides.
- **ARCHITECTURE.md**: Document system design, dependencies, and technical decisions.
- **CONTRIBUTING.md**: Standardize development workflows and coding standards.
- **CHANGELOG.md**: Track version history and migration paths.

### 2. Technical API Documentation
- **XML Comments**: Generate and refine IntelliSense-friendly comments in C# scripts.
- **API.md**: Create external API references with usage examples.
- **System Guides**: Explain complex interactions between multiple systems.

### 3. Unity-Specific Documentation
- **Inspector Configuration**: Document serialized fields, Tooltips, and Range constraints.
- **Prefab Structure**: Visual breakdown of GameObject hierarchies.
- **Scene Requirements**: Documentation of mandatory scene objects and tags.

### 4. Team & Workflow
- **Onboarding Guide**: Setup instructions for new developers.
- **Troubleshooting**: Maintain a "Living" FAQ for common technical issues.
- **Tools Manual**: Document custom Editor scripts and tools.

## Standard Templates

Use the templates located in `resources/templates/` for consistency:
- `README_TEMPLATE.md`: Project landing page.
- `API_TEMPLATE.md`: Technical interface reference.
- `ARCHITECTURE_TEMPLATE.md`: High-level system design.

## Documentation Workflow

1.  **Code Analysis Phase**:
    - Use `grep` and `find` to identify public APIs and serialized fields.
    - Identify `ScriptableObject` types and their intended usage.
2.  **Documentation Creation**:
    - Extract code structure into Markdown headers.
    - Generate runnable code examples for all public methods.
    - Use ASCII or Mermaid diagrams for hierarchy visualization.
3.  **Validation**:
    - Cross-reference method signatures with the latest code.
    - Verify that all mentioned prerequisites are still applicable.

## Best Practices

- **Keep It Current**: Documentation should be updated alongside code changes.
- **Show, Don't Just Tell**: Always include code snippets or visual diagrams for complex logic.
- **Unity Alignment**: Use Unity terminology correctly (Prefabs, MonoBehaviours, URP, etc.).
- **Discoverable**: Maintain a clear table of contents in all major docs.
