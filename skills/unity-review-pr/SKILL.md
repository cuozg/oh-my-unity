---
name: unity-review-pr
description: "GitHub PR reviews for Unity projects. Use when: reviewing PR diffs, checking code against standards, identifying architectural/performance issues, or drafting review comments with suggestions."
---

# Unity PR Reviewer

Review PR diffs against Unity best practices and project conventions.

## Severity Levels

| Level | Emoji | Blocks Approval | Examples |
|:------|:-----:|:---------------:|:---------|
| Critical | 🔴 | Yes | Memory leaks, crashes, async without null-check |
| Major | 🟡 | Yes | Missing error handling, GetComponent in Update |
| Minor | 🔵 | No | Naming violations, style issues |
| Suggestion | 💚 | No | Readability, modern C# patterns |

## Critical Patterns to Flag

```csharp
// 🔴 CRITICAL: Async safety - MonoBehaviour can be destroyed during await
private async Awaitable LoadData() {
    await Awaitable.WaitForSecondsAsync(1f);
    _data = result; // 🔴 this may be null!
}
// ✅ Fix:
private async Awaitable LoadData() {
    await Awaitable.WaitForSecondsAsync(1f);
    if (this == null) return; // Destroyed check
    _data = result;
}

// 🟡 MAJOR: Allocation in hot path
void Update() {
    GetComponent<Rigidbody>().AddForce(Vector3.up); // Cache in Awake!
    string log = "Frame: " + Time.frameCount; // StringBuilder or interpolation
}

// 🔴 CRITICAL: Package manifest change requires review
// Any change to Packages/manifest.json → flag as high-visibility
```

## Quality Metrics

| Metric | Target |
|:-------|:-------|
| Method Length | < 30 lines |
| Class Length | < 300 lines |
| Code Duplication | < 5% |

## Review Workflow

1. **Analyze**: Compare diff against `.claude/rules/` conventions
2. **Categorize**: Apply severity levels to each finding
3. **Suggest**: Include `suggestion` blocks for actionable fixes
4. **Decide**: APPROVE if no 🔴/🟡 issues; COMMENT otherwise
5. **Submit**: Post via `scripts/post_review.sh <pr_number> review.json`

For JSON spec, see [REVIEW_JSON_SPEC.md](references/REVIEW_JSON_SPEC.md).

## Comment Format

```markdown
🔵 **Minor**: Field naming
`_health` should be `_currentHealth` per conventions.
\`\`\`suggestion
private int _currentHealth;
\`\`\`
```
