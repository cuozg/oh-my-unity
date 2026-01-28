---
name: unity-tdd-writer
description: "Generation of Technical Design Documents (TDD) for Unity features. Use when you need to: (1) Formalize an implementation plan into a technical spec, (2) Document architectural decisions and performance risks, (3) Define client/server component logic, or (4) Specify API references and data architectures."
---

# Unity TDD Writer

Generate detailed Technical Design Documents based on project standards.

## Core Capabilities

- **Architectural Mapping**: Document foundational assumptions and performance constraints (FPS/Memory/CPU).
- **Plan Conversion**: Transform `unity-plan` outputs (Epics/Tasks) into "Feature Components".
- **Technical Spec**: Detail UI lifecycles, asset management, and client-server interactions.
- **API & Data**: Consolidate network endpoints and blueprint changes into formal references.

## Output Format

All TDDs must use the `UNITY_TDD_TEMPLATE.md` from `assets/templates/` and be saved in `Documents/TDDs/`.

## Workflow Integration

1.  **Locate Source**:
    - Find the latest implementation plan in `Documents/Plans/IMPLEMENTATION_PLAN_[FeatureName].md`.
    - If no plan exists, run the `/unity-plan` workflow first as a prerequisite.
2.  **Define Architecture**:
    - Document foundational assumptions and performance constraints (e.g., target FPS, Memory limits, CPU budget).
    - Map feature epics and tasks into high-level, logical TDD Components.
3.  **Detail Logic**:
    - Define UI lifecycles (Loading, Refreshing, Data Refresh triggers).
    - Specify asset loading strategies (Addressables, Resources, Pooling).
    - Detail client-server interactions, API references, and data blueprint/schema changes.
4.  **Generate Document**:
    - Use the `UNITY_TDD_TEMPLATE.md` from `assets/templates/`.
    - Save the completed TDD in `Documents/TDDs/TDD_[FeatureName].md`.
5.  **Validation**:
    - Ensure all mandatory sections (Architecture, Components, API, Analytics, Performance) are addressed with technical depth.
    - Present the final TDD to the user for technical stakeholder review.

## Best Practices

- **Explicit Assumptions**: Never leave architectural constraints undocumented.
- **Performance First**: Address specific risks for mobile and low-end hardware.
- **Detail UI Lifecycle**: Define exactly when data is populated and refreshed.
- **Error Handling**: Document API failure cases and offline behaviors.
