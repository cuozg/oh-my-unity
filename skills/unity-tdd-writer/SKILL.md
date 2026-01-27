---
name: unity-tdd-writer
description: Generation of Technical Design Documents (TDD) for Unity features. Use when you need to: (1) Formalize an implementation plan into a technical spec, (2) Document architectural decisions and performance risks, (3) Define client/server component logic, or (4) Specify API references and data architectures.
---

# Unity TDD Writer

Generate detailed Technical Design Documents based on the WWE 2025 standard.

## Core Capabilities

- **Architectural Mapping**: Document foundational assumptions and performance constraints (FPS/Memory/CPU).
- **Plan Conversion**: Transform `unity-plan` outputs (Epics/Tasks) into "Feature Components".
- **Technical Spec**: Detail UI lifecycles, asset management, and client-server interactions.
- **API & Data**: Consolidate network endpoints and blueprint changes into formal references.

## Output Format

All TDDs must use the `WWE_TDD_2025_TEMPLATE.md` from `assets/templates/` and be saved in `Documents/TDDs/`.

## Workflow Integration

1. **Read**: Analyze the corresponding `IMPLEMENTATION_PLAN_[Feature].md` in `Documents/Plans/`.
2. **Cluster**: Group granular tasks into logical TDD components.
3. **Draft**: Populate the template with deep technical specifics.
4. **Verify**: Ensure all mandatory TDD sections are addressed or marked N/A.

## Best Practices

- **Explicit Assumptions**: Never leave architectural constraints undocumented.
- **Performance First**: Address specific risks for mobile and low-end hardware.
- **Detail UI Lifecycle**: Define exactly when data is populated and refreshed.
- **Error Handling**: Document API failure cases and offline behaviors.
