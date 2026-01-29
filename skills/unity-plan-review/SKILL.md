---
name: unity-plan-review
description: "Review and refine implementation plans. Use when: critiquing a plan from unity-plan, brainstorming edge cases, or finalizing task lists before detailing."
---

# Unity Plan Review

Audit implementation plans and finalize task lists.

## Key Questions to Ask

- Is every requirement covered by a task?
- Are there hidden dependencies between tasks?
- What happens if [X] fails? Edge cases?
- How does this interact with existing systems (Combat, Meta, Persistence)?
- Is the costing realistic for legacy code areas?

## Workflow

1. **Ingest**: Read plan from `Documents/Plans/`
2. **Audit**: Analyze Epics, identify gaps (e.g., "logic planned but no UI entry point")
3. **Discuss**: Present findings, ask clarifying questions
4. **Update**: Write refined plan back to document
5. **Finalize**: Output numbered task list as input for `unity-plan-detail`

## Output

```markdown
## Finalized Tasks

1. [Epic A] Task 1 - Description
2. [Epic A] Task 2 - Description  
3. [Epic B] Task 1 - Description
...
```

## Principles

- **Assume Nothing**: Vague specs = risks, discuss them
- **Completeness**: Trace every requirement to a task
- **User Alignment**: Don't finalize until user confirms
