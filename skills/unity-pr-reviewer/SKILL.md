---
name: unity-pr-reviewer
description: Automated GitHub PR reviews for Unity projects. Use when you need to: (1) Analyze a diff against coding and asset standards, (2) Identify architectural risks or performance bottlenecks, (3) Draft line-level feedback with commit suggestions, or (4) Post a consolidated review via GitHub CLI.
---

# Unity PR Reviewer

Perform comprehensive, automated code reviews on GitHub Pull Requests with a focus on Unity best practices.

## Core Capabilities

- **Diff Analysis**: Evaluate changes against conventions in `.agent/rules/`.
- **Structural Check**: Monitor method/class lengths and technical debt markers (TODO/FIXME).
- **Risk Assessment**: Identify memory leaks, missing null checks, and high-allocation code in `Update`.
- **Commit Suggestions**: Provide commit-ready code fixes using `suggestion` blocks.

## Review Workflow

1. **Inspect**: Use `gh pr diff` to fetch the patch.
2. **Analyze**: Compare changes to project rules and software engineering fundamentals.
3. **Draft**: Prepare findings in a `review.json` file. See [REVIEW_JSON_SPEC.md](references/REVIEW_JSON_SPEC.md).
4. **Post**: Execute `scripts/post_review.sh <pr_number> review.json`.

## Severity Levels

- 🔴 **Critical**: Fix required for memory leaks, crashes, or game-breaking bugs.
- 🟡 **Major**: Significant architectural issues or missing error handling.
- 🔵 **Minor**: Naming inconsistencies or style violations.
- 💚 **Suggestion**: Readability improvements or modern C# conversions.

## Quality Metrics Targets

| Metric | Target |
|--------|--------|
| Method Length | < 30 lines |
| Class Length | < 300 lines |
| Code Duplication | < 5% |

## Best Practices

- **Actionable Feedback**: Always include a `suggestion` block for minor fixes.
- **Positive Reinforcement**: Acknowledge clean code and good design patterns.
- **Precision**: Use line numbers from the "New" file in the diff accurately.
