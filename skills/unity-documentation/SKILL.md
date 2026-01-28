---
name: unity:write-docs
description: "Specialist in creating and maintaining technical documentation for Unity projects. Use when you need to: (1) Create or update a project README, (2) Document system architectures, (3) Generate API references, (4) Write onboarding or troubleshooting guides, or (5) Explain technical Unity-specific setups (Prefabs/Scenes)."
---

# Unity Documentation

Create clear, maintainable documentation for Unity projects, from high-level architecture to detailed API references.

## Core Capabilities

- **Project Docs**: Maintain `README.md`, `ARCHITECTURE.md`, and `CONTRIBUTING.md`.
- **API Reference**: Generate IntelliSense-friendly XML comments and external `API.md` files.
- **Unity Specs**: Document Inspector constraints, prefab hierarchies, and scene requirements.
- **Onboarding**: Create setup guides and living FAQs for common issues.

## Workflow

1. **Analysis**: Use `grep` and Unity MCP to identify public APIs, `ScriptableObject` types, and serialized fields.
2. **Generation**: Use templates in `assets/templates/` to ensure consistency.
3. **Visualization**: Use ASCII or Mermaid diagrams for hierarchies and flows.
4. **Validation**: Cross-reference docs with code signatures and prerequisites.

## Best Practices

- **Show, Don't Just Tell**: Include code snippets and diagrams for all complex logic.
- **Unity Alignment**: Use precise Unity terminology (Prefabs, MonoBehaviours, URP).
- **Discoverability**: Maintain tables of contents in all major documents.
- **Currentness**: Ensure documentation reflects the latest code changes.
