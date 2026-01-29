---
name: unity-write-docs
description: "Create and maintain Unity project documentation. Use when: creating READMEs, documenting architectures, generating API refs, writing onboarding guides, or explaining Unity setups."
---

# Unity Documentation

Create clear, maintainable technical documentation.

## Document Types

| Type | Location | Template |
|:-----|:---------|:---------|
| Project Overview | `README.md` | - |
| Architecture | `Documents/ARCHITECTURE.md` | [ARCHITECTURE_TEMPLATE.md](assets/templates/ARCHITECTURE_TEMPLATE.md) |
| API Reference | `Documents/API/` | [API_TEMPLATE.md](assets/templates/API_TEMPLATE.md) |
| Onboarding | `Documents/ONBOARDING.md` | - |
| System Docs | `Documents/Systems/` | - |

## Workflow

1. **Analyze**: Use `grep` + Unity MCP to find public APIs, ScriptableObjects, serialized fields
2. **Generate**: Use templates from `assets/templates/`
3. **Visualize**: Mermaid diagrams for hierarchies and flows (load `mermaid` skill)
4. **Validate**: Cross-reference docs with actual code signatures

## Content Guidelines

```markdown
## HealthManager

Manages player health, damage, and death state.

### Usage
```csharp
var health = GetComponent<HealthManager>();
health.TakeDamage(10);
health.OnDeath += HandleDeath;
```

### Inspector Properties
| Field | Type | Description |
|:------|:-----|:------------|
| Max Health | int | Starting/max health value |
| Invulnerability Time | float | Seconds of immunity after hit |
```

## Principles

- **Show, Don't Tell**: Code snippets + diagrams for complex logic
- **Unity Terminology**: Prefabs, MonoBehaviours, URP, not generic terms
- **TOC**: Maintain tables of contents in major documents
- **Stay Current**: Update docs when code changes
