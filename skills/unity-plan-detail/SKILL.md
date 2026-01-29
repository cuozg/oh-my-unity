---
name: unity-plan-detail
description: "Create task skeletons from implementation plans. Use when: breaking down unity-plan tasks into requirements, or creating initial task docs in Documents/Tasks/."
---

# Unity Plan Detailer

Break high-level plan tasks into detailed requirement skeletons.

## Output Format

Save to `Documents/Tasks/[Number][Epic][Task].md`

```markdown
# Task [Number]: [Epic] - [Task Name]

## Objective
[What must be accomplished]

## Constraints
- [Technical constraints]
- [Performance requirements]

## Success Criteria
- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]

## Implementation Strategy (High-Level)
- Approach: [e.g., "New Manager class" or "Modify existing UI script"]
- Affected Systems: [List components/classes]

## Test Cases
- [ ] [Test scenario 1]
- [ ] [Test scenario 2]

## Status
- [ ] Requirements defined
- [ ] Ready for brainstorm
- [ ] Implementation ready
- [ ] Completed
```

## Workflow

1. **Analyze**: Extract objective, constraints, success criteria per task
2. **Strategy**: Outline high-level approach (not code-level details)
3. **Tests**: Define success from requirement perspective
4. **Export**: Save skeleton using template
5. **Handoff**: Notify ready for `unity-plan-brainstorm`

## Principles

- **Focus on "What"**: Detail what to accomplish, leave "how" for brainstorm
- **Clear Objectives**: Every task needs measurable success criteria
- **Epic Alignment**: Stay within assigned Epic scope
