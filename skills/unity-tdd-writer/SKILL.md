---
name: unity-tdd-writer
description: Expert in generating comprehensive Technical Design Documents (TDD) for Unity features, following the WWE TDD Template 2025.
---

# Unity TDD Writer Skill

This skill is specialized in transforming high-level implementation plans and requirements into detailed Technical Design Documents (TDD). It ensures that all architectural decisions, performance constraints, and component details are documented according to project standards.

## Core Capabilities

### 1. TDD Generation
- **Template Adherence**: Strictly follows the `WWE TDD Template 2025.md` format.
- **Architectural Mapping**: Documents foundational assumptions, performance risks, and key architectural decisions.
- **Component breakdown**: Divides features into logical components (Client and Server) as per the spec.

### 2. Integration with Planning
- **Plan Conversion**: Takes the output from the `unity-plan` skill (Epics, Tasks, Costing) and expands it into the "Feature Components" and "Task Breakdown" sections of the TDD.
- **Dependency Awareness**: Automatically populates sections on "Existing Tech Being Used" and "New Tech" based on the project investigation phase of the planning workflow.

### 3. Technical Specification
- **Client/Server Details**: Documents UI models, data refreshing logic, asset management, and API interactions.
- **API Reference**: Consolidates new and modified APIs, including request/response examples.
- **Data Architecture**: Documents changes to blueprint data and JSON schemas.

## Workflow Integration

This skill typically runs after the `unity-plan` workflow has been completed and an `IMPLEMENTATION_PLAN.md` has been generated.

1.  **Read Source Material**: Analyze the `IMPLEMENTATION_PLAN_[FeatureName].md` file in `Documents/Plans/`.
2.  **Identify Components**: Group tasks from the implementation plan into TDD components.
3.  **Draft TDD**: Populate the `WWE_TDD_2025_TEMPLATE.md` with technical specifics.
4.  **Verification**: Ensure all fields from the template are addressed or marked as N/A.

## Standard Report Format

Use the `WWE_TDD_2025_TEMPLATE.md` in `resources/templates/`. The result MUST be saved as a new `.md` file in the `Documents/TDDs/` directory.

## Best Practices

- **Explicit Assumptions**: Never leave architectural assumptions undocumented.
- **Performance First**: Always address FPS, Memory, and CPU usage risks for mobile/low-end devices.
- **Detail UI Lifecycle**: Clearly define when UI data is populated and refreshed.
- **API Safety**: Include interactions for spam prevention (e.g., tap limiting) and error handling.
