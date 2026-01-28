---
name: unity:plan
description: "Project planning and requirement decomposition for Unity features. Use when you need to: (1) Analyze feature requirements against the current project base, (2) Break down work into Epics and Tasks, (3) Estimate effort/cost, or (4) Define a technical implementation roadmap."
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

1.  **Analyze Requirements**: 
    - Review the user request or feature specification for functional goals and technical constraints.
2.  **Project Discovery**:
    - Run the helper script: `.agent/skills/unity-plan/scripts/investigate_feature.sh [Keywords]` to identify relevant systems, scripts, and prefabs.
    - Map dependencies and integration points using `grep_search` and `find_gameobjects`.
3.  **Technical Feasibility**:
    - Assess if the current architecture supports the feature without incurring significant technical debt.
    - Propose safe migration paths or integration strategies for breaking changes.
4.  **Decomposition**:
    - Break the feature into logical **Epics**.
    - For each Epic, define specific **Tasks** using the mandatory 7-column table format.
    - Ensure tasks are atomic and categorized by type (Logic, UI, Data, API, Asset, Test).
5.  **Costing & Risk Assessment**:
    - Assign T-shirt sizes (S, M, L, XL) to all tasks based on estimated complexity and effort.
    - Highlight high-risk areas or areas requiring legacy code refactoring.
6.  **Finalize Documentation**:
    - Use the `IMPLEMENTATION_PLAN.md` template from `assets/templates/`.
    - Save the plan in `Documents/Plans/IMPLEMENTATION_PLAN_[FeatureName].md`.
7.  **Final Review**:
    - Verify the plan aligns with `.agent/rules/unity-csharp-conventions.md` and `.agent/rules/unity-asset-rules.md`.
    - Present the plan to the user for approval.

## Best Practices

- **Atomic Tasks**: Keep tasks small and specific.
- **Costing Honesty**: Be realistic about complexity in legacy systems.
- **Safety**: Plan migration paths for any breaking changes.
