---
name: unity-pr-reviewer
description: Expert in reviewing Unity Pull Requests using GitHub CLI and posting inline comments.
---

# Unity PR Reviewer Skill

This skill allows the agent to perform an automated code review on a GitHub Pull Request and post specific, line-level comments for issues found.

## Core Capabilities

### 1. PR Inspection
- Use `gh pr list` to find active PRs.
- Use `gh pr view <number>` to see PR description and status.
- Use `gh pr diff --patch <number>` to get the full diff with line headers.

### 2. Comprehensive Analysis
- Evaluate the diff against:
  - `.agent/rules/unity-csharp-conventions.md`
  - `.agent/rules/unity-asset-rules.md`
  - **Software Engineering Fundamentals**: SOLID principles, DRY/KISS, error handling, and naming.
  - **Unity Architecture**: Component design, decoupling, event architecture, and state management.
  - **Performance & Memory**: Allocations in `Update()`, object pooling, caching, and draw calls.
  - **Maintainability**: Unit testability, documentation, and refactoring ease.

### 3. Review Process
1.  **Structural Analysis**: Check for file sizes, class counts, and technical debt markers (TODO/FIXME).
2.  **Pattern Detection**: Identify architectural choices (Singletons, State Machines, ECS) and check consistency.
3.  **Quality Metrics Assessment**: Estimate cyclomatic complexity and code duplication.
4.  **Risk Assessment**: Identify security vulnerabilities and extreme performance bottlenecks.
5.  **Draft Inline Comments**: Map issues to file paths and line numbers in the PR.

### 4. Inline Commenting
- Map issues found in the diff to their file path and line number.
- Construct a review JSON payload.
- Use the helper script or `gh api` to post the review.

## Severity Levels

- 🔴 **Critical (Must Fix)**: Memory leaks, crashes, security risks, game-breaking bugs.
- 🟡 **Major (Should Fix)**: Poor architecture, significant duplication, missing error handling.
- 🔵 **Minor (Consider Fixing)**: Naming inconsistencies, missing docs, minor style violations.
- 💚 **Suggestion (Nice to Have)**: Modern C# features, enhanced readability, better abstractions.

## Quality Metrics Targets

| Metric | Target | Status |
|--------|--------|--------|
| Method Length | < 30 lines | 🔴 / 🟡 / ✅ |
| Class Length | < 300 lines | 🔴 / 🟡 / ✅ |
| Code Duplication | < 5% | 🔴 / 🟡 / ✅ |
| Comment Coverage | Meaningful | 🔴 / 🟡 / ✅ |

## Review JSON Template

```json
{
  "body": "Unity Code Review Summary: [Found X critical issues, Y warnings]",
  "event": "COMMENT",
  "comments": [
    {
      "path": "Assets/Scripts/Example.cs",
      "line": 42,
      "side": "RIGHT",
      "body": "🔴 **Critical**: Missing null check for 'playerTransform' before use. This will cause a NullReferenceException if the player is destroyed."
    },
    {
      "path": "Assets/Scripts/HeavyLogic.cs",
      "line": 15,
      "side": "RIGHT",
      "body": "🟡 **Major**: Avoid string concatenation in Update(). Use StringBuilder or pre-formatted strings to reduce GC pressure."
    },
    {
      "path": "Assets/Scripts/CleanCode.cs",
      "line": 120,
      "side": "RIGHT",
      "body": "💚 **Suggestion**: Consider using the C# 9 'is not' pattern for better readability here."
    }
  ]
}
```

## How to Post a Review

1. **Save findings** to `review.json`.
2. **Execute the helper script**:
   ```bash
   .agent/skills/unity-pr-reviewer/scripts/post_review.sh <pr_number> review.json
   ```

## Best Practices

- **Positive Highlights**: Always mention what was done well (Clean namespaces, good SO usage).
- **Be Precise**: Use line numbers from the "New" file in the diff.
- **Provide Solutions**: Suggest specific code fixes or refactoring patterns.
- **Cross-Platform**: Consider mobile/VR implications for every change.
