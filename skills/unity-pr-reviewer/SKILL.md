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

### 5. GitHub Commit Suggestions
- Use GitHub's `suggestion` code blocks to provide immediate, commit-ready fixes for code issues.
- Formatting: 
  ````markdown
  [Brief description of the issue]
  ```suggestion
  [Modified code here]
  ```
  ````
- When a `suggestion` block is included, GitHub automatically renders a **Commit suggestion** button in the UI.

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
      "body": "🔴 **Critical**: Missing null check for 'playerTransform' before use.\n\n```suggestion\n        if (playerTransform != null) playerTransform.position = targetPos;\n```"
    },
    {
      "path": "Assets/Scripts/HeavyLogic.cs",
      "line": 15,
      "side": "RIGHT",
      "body": "🟡 **Major**: Avoid string concatenation in Update().\n\n```suggestion\n    statusBuilder.Clear().Append(\"Score: \").Append(score);\n    statusText.text = statusBuilder.ToString();\n```"
    },
    {
      "path": "Assets/Scripts/CleanCode.cs",
      "line": 120,
      "side": "RIGHT",
      "body": "💚 **Suggestion**: Use the C# 9 'is not' pattern.\n\n```suggestion\n    if (obj is not null)\n```"
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

- **Actionable Suggestions**: Use ````suggestion```` blocks whenever possible for minor fixes, style issues, or simple logic corrections to allow the developer to commit changes directly from the PR UI.
- **Positive Highlights**: Always mention what was done well (Clean namespaces, good SO usage).
- **Be Precise**: Use line numbers from the "New" file in the diff.
- **Provide Solutions**: Don't just point out the problem; provide the exact code fix in a suggestion block.
- **Cross-Platform**: Consider mobile/VR implications for every change.
