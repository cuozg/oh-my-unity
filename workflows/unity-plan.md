---
description: Workflow for investigating requirements and producing a detailed implementation plan for a Unity feature.
---

# Workflow: Unity Project Planning

Follow these steps to generate a professional implementation plan for a new Unity feature or system.

1.  **Analyze Requirements**: 
    - Read the feature specification or user request thoroughly.
    - Identify key functional and non-functional requirements.
2.  **Investigate Project Base**:
    - **Identify Keywords**: Extract core concepts (e.g., "Combat", "Inventory", "UI").
    // turbo
    - **Run Discovery**: Execute `.agent/skills/unity-plan/scripts/investigate_feature.sh [keywords]` to find relevant scripts and prefabs.
    - **Analyze Impact**: Use `grep_search` and `find_gameobjects` to understand how the new feature integrates with existing systems.
3.  **Evaluate Technical Feasibility**:
    - Identify potential architectural conflicts or technical debt that might hinder implementation.
    - Propose solutions for migration or integration.
4.  **Decomposed Implementation Plan**:
    - Break the feature down into logical **Epics**.
    - For each Epic, define specific **Tasks** following the **7-column table format** (Number, Epic, Task, Description, Type, Cost, Note).
    - Ensure every task has a type: `Logic`, `UI`, `Data`, `API`, `Asset`, or `Test`.
5.  **Cost & Risk Assessment**:
    - Assign T-shirt sizes (S, M, L, XL) to each task.
    - Total the estimated duration and identify high-risk areas.
6.  **Define Workflow & Roadmap**:
    - Create a step-by-step roadmap from initial setup to final validation.
    - Include clear **Definition of Done** criteria.
7.  **Generate Documentation**:
    - Populate the `IMPLEMENTATION_PLAN.md` based on the template in `.agent/skills/unity-plan/resources/templates/`.
    - Create a file named `IMPLEMENTATION_PLAN_[FeatureName].md` in the `Documents/Plans/` folder.
8.  **Final Review**:
    - Verify the plan aligns with `.agent/rules/unity-csharp-conventions.md` and `.agent/rules/unity-asset-rules.md`.
    - Present the plan to the user for approval.
