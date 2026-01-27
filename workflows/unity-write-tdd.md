---
description: Workflow for generating a Technical Design Document (TDD) based on the WWE 2025 template, using the output from the unity-plan skill.
---

# Workflow: Write TDD

Follow these steps to generate a professional Technical Design Document for a Unity feature.

1.  **Locate Implementation Plan**:
    - Find the latest implementation plan in `Documents/Plans/` for the requested feature.
    - If no plan exists, run the `/unity-plan` workflow first.
2.  **Analyze Feature Components**:
    - Review the Epics and Tasks in the implementation plan.
    - Map these into logical "Components" (e.g., Shop System, Battle Hud, Backend Service).
3.  **Draft Technical Architecture**:
    - Identify foundational assumptions based on the "Project Investigation" section of the plan.
    - Identify performance risks (FPS, Memory, CPU) based on the "Asset" and "Logic" tasks.
4.  **Define Client/Server Logic**:
    - For each component, detail the UI lifecycle (Loading, Refreshing, Data Refresh).
    - Detail the Server logic, Blueprint changes, and API needs from the "Data" and "API" tasks.
5.  **Consolidate API & Data**:
    - Build the "API Reference" section using details from the implementation plan's API tasks.
    - List all blueprint changes in the "Data Architecture" section.
6.  **Generate Document**:
    - Populate the `WWE_TDD_2025_TEMPLATE.md` from `.agent/skills/unity-tdd-writer/resources/templates/`.
    - Create a new file named `TDD_[FeatureName]_2025.md` in the `Documents/TDDs/` folder.
7.  **Address Review Readiness**:
    - Ensure all mandatory sections from the template are filled with technical depth.
    - Link back to the original implementation plan and design specs.
8.  **Final Verification**:
    - Cross-check technical decisions with `.agent/rules/unity-csharp-conventions.md`.
    - Present the generated TDD to the user.
