---
name: unity-plan-executor
description: "Execute detailed task guides. Input: .md files from Documents/Tasks/. Coordinates specialists (unity-implement-logic, unity-tech-art, flatbuffers-coder) to implement code changes."
---

# Unity Plan Executor

Execute task guides by coordinating specialist skills.

## Execution Checklist

```markdown
## Task Execution: [Task Name]

### Pre-Flight
- [ ] Task file loaded from `Documents/Tasks/`
- [ ] Code changes extracted
- [ ] Required skills identified

### Implementation
- [ ] Change 1: [Description] → Applied
- [ ] Change 2: [Description] → Applied
- [ ] Compile check passed

### Verification
- [ ] Definition of Done met
- [ ] No regressions introduced
- [ ] Task file updated to "Completed"

### Files Modified
- `path/to/file1.cs` - Added Heal method
- `path/to/file2.cs` - Updated event subscription
```

## Workflow

1. **Load**: Read `Documents/Tasks/[Number][Epic][Task].md`, extract strategy & code snippets
2. **Select Specialist**:
   - Logic/C# → `unity-implement-logic`
   - Shaders/Art → `unity-tech-art`
   - Data tables → `flatbuffers-coder`
   - Editor operations → `unity-mcp-basics`
3. **Implement**: Follow task's "Detailed Steps", adapt code to current codebase state
4. **Verify**: Compile after each change, investigate failures with `unity-investigate-code`
5. **Complete**: Update task status, report modified files

## Principles

- **Atomic Execution**: Finish one task completely before next
- **Validate Always**: Compile check after every change
- **Adopt Specialist**: Use loaded skill's best practices fully
- **Transparent Reporting**: List all modified files and created assets
