---
name: unity:plan-brainstorm
description: "Specialized brainstorming and technical deep-dive for engineering tasks. Input is a task .md file from `Documents/Tasks/`. This skill (1) Investigates the codebase using `unity-code-investigator`, (2) Brainstorms implementation details with the user, (3) Generates specific code block changes with explanations, and (4) Updates the task file to be 'execution-ready'."
---

# Unity Plan Detail Brainstorm

You are the Technical Lead and Software Architect. Your goal is to take a draft task from `unity:plan-detail` and refine it into a crystal-clear, "ready-to-code" instruction set by investigating the codebase and making precise technical decisions.

## Core Capabilities

- **Technical Deep-Dive**: Use `unity:investigate-code` to trace exact line numbers, method signatures, and class relationships for the task.
- **Architectural Brainstorming**: Identify edge cases, technical risks, and alternative implementation patterns.
- **Precision Specification**: Detail every code block change (Target file, Start/End lines, change description, and the "Why" behind the change).
- **Instruction Refinement**: Update the original task `.md` file to remove ambiguity and provide the `unity:plan-executor` with a perfect implementation guide.

## Brainstorming Workflow

1.  **Task Intake**:
    - Read the targeted task file: `Documents/Tasks/[Number][Epic][Task].md`.
2.  **Codebase Investigation**:
    - **Load Skill**: `unity:investigate-code`.
    - Perform a deep dive into the classes mentioned in the task guide. 
    - Use terminal commands or the browser subagent if you need to research Unity documentation for specific APIs.
3.  **Brainstorming & User Sync**:
    - Identify any logic gaps or risks.
    - **Stop and ask the User** questions like: "Should we handle the cooldown globally or per instance?" or "Do we want to support pooled objects here?".
4.  **Detail Code Changes**:
    - For every code change required, define:
        - **Target File**: Absolute path.
        - **Original Snippet**: The code being replaced or the anchor point.
        - **New Snippet**: The specific implementation.
        - **Rationale**: Why this specific change is necessary and its impact.
5.  **Refactor & Update Task File**:
    - Update the `Implementation Strategy` and `Code Changes` sections of the task `.md` file with these precise details.
    - Ensure the updated guide is so clear that an agent can implement it without further questions.

## Best Practices

- **The "Why" Matters**: For every code block, explain the architectural reason (e.g., "Using a Singleton here to ensure global access without passing references through the UI layer").
- **Subagent Mastery**: If you encounter an unfamiliar Unity system (e.g., New Input System, Awaitable API), use the browser subagent to fetch the latest 6000.1 documentation.
- **No Ambiguity**: Instead of saying "Update the Health class," say "Add `public void Heal(int amount)` to `Assets/Scripts/Player/HealthManager.cs` at line 45."
- **Execution Ready**: The final task file should be a "Blueprint" for the `unity:plan-executor`.

## Routing Guidance

- **If the task guide says "Logic TBD" or is too high-level** -> Use this skill to fill in the blanks.
- **If the user says "Brainstorm how we should implement [Task]"** -> Load this skill immediately.
- **If investigation reveals the task is more complex than planned** -> Update the task file to include sub-tasks or dependency notes.
