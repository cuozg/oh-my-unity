---
name: unity-plan
description: Project planning and requirement decomposition for Unity features. Use when you need to: (1) Analyze feature requirements against the current project base, (2) Break down work into Epics and Tasks, (3) Estimate effort/cost, or (4) Define a technical implementation roadmap.
---

# Unity Planning

Transform high-level requirements into structured, actionable implementation plans for Unity.

## Core Capabilities

- **Project Investigation**: Analyze existing code and assets to identify dependencies and gaps.
- **Decomposition**: Break work into Epics and granular Tasks (Logic, UI, Data, API, Asset, Test).
- **Costing**: Provide T-shirt size estimates (S, M, L, XL) and identify technical risks.
- **Roadmap**: Define a "Build, Test, Integrate" lifecycle for the feature.

## Output Format

All plans must use the `IMPLEMENTATION_PLAN.md` template from `assets/templates/` and be saved in `Documents/Plans/`.

### Mandatory Task Table
| Number | Epic | Task | Description | Type | Cost | Note |
|:---:|:---|:---|:---|:---:|:---:|:---|
| X.Y | [Epic Name] | [Task Name] | [What to do] | [Type] | [Size] | [Risk/Context] |

## Planning Workflow

1. **Context Discovery**: Map existing systems impacted by the requirement.
2. **Technical Feasibility**: Validate the proposed architecture against Unity constraints.
3. **Tasking**: Create atomic tasks (ideally achievable in one session).
4. **Verification**: Define the "Definition of Done" for each epic.

## Best Practices

- **Atomic Tasks**: Keep tasks small and specific.
- **Costing Honesty**: Be realistic about complexity in legacy systems.
- **Safety**: Plan migration paths for any breaking changes.
