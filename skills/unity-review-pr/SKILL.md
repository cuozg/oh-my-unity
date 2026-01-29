---
name: unity-review-pr
description: "Automated GitHub PR reviews for Unity projects. Use when: (1) Reviewing code changes against conventions, (2) Identifying performance/memory issues, (3) Drafting line-level feedback with suggestions."
---

# Unity PR Reviewer

Review PRs against Unity coding standards and performance best practices.

## Severity Levels

| Level | Use When |
|-------|----------|
| 🔴 **Critical** | Memory leaks, crashes, game-breaking bugs |
| 🟡 **Major** | Architectural issues, missing error handling, `GetComponent` in Update |
| 🔵 **Minor** | Naming inconsistencies, style violations |
| 💚 **Suggestion** | Readability improvements, modern C# patterns |

## Quality Targets

- Method: < 30 lines
- Class: < 300 lines  
- Duplication: < 5%

## Review Workflow

1. **Fetch**: `gh pr diff --patch <number> > pr_diff.patch`
2. **Analyze**: Check against `.claude/rules/` conventions
3. **Audit**: Flag manifest changes, memory patterns, Update allocations
4. **Draft**: Categorize issues, write `suggestion` blocks
5. **Submit**: Run `bash .claude/skills/unity-review-pr/scripts/post_review.sh <number> review.json`
6. **Cleanup**: Delete temp files, provide summary

## Critical Patterns to Flag

```csharp
// 🔴 GetComponent in Update
void Update() { GetComponent<Rigidbody>(); }

// 🔴 Camera.main in loop  
void Update() { Camera.main.transform; }

// 🟡 String concat in hot path
void Update() { label.text = "Score: " + score; }

// 🔴 Missing null after await
async Awaitable DoAsync() {
    await Awaitable.WaitForSecondsAsync(1f);
    transform.position = Vector3.zero; // May be destroyed!
}
```

## Comment Format

Always include severity, description, and fix:

```markdown
🔴 **Critical**: Missing null check after await.

\`\`\`suggestion
if (this == null) return;
transform.position = Vector3.zero;
\`\`\`
```

## Approval Logic

- **APPROVE**: No 🔴 or 🟡 issues
- **COMMENT**: Only 🔵/💚 issues
- **REQUEST_CHANGES**: Any 🔴 issues

See [REVIEW_JSON_SPEC.md](references/REVIEW_JSON_SPEC.md) for output format.
