---
name: unity-pr-reviewer
description: "Automated GitHub PR reviews for Unity projects. Use when you need to: (1) Analyze a diff against coding and asset standards, (2) Identify architectural risks or performance bottlenecks, (3) Draft line-level feedback with commit suggestions, or (4) Post a consolidated review via GitHub CLI."
---

# Unity PR Reviewer

Perform comprehensive, automated code reviews on GitHub Pull Requests with a focus on Unity best practices.

## Core Capabilities

- **Diff Analysis**: Evaluate changes against conventions in `.agent/rules/`.
- **Structural Check**: Monitor method/class lengths and technical debt markers (TODO/FIXME).
- **Risk Assessment**: Identify memory leaks, missing null checks, and high-allocation code in `Update`.
- **Commit Suggestions**: Provide commit-ready code fixes using `suggestion` blocks.
- **Dependency Audit**: Flag any changes to `Packages/manifest.json` as a high-visibility warning to prevent accidental dependency shifts.

## Review Workflow

1.  **Select & Fetch**: 
    - Use `gh pr list` to identify the PR number or ask the user.
    - Run `gh pr diff --patch <number> > pr_diff.patch`.
2.  **Structural & Asset Analysis**:
    - Analyze the diff against `.agent/rules/unity-csharp-conventions.md` and `.agent/rules/unity-asset-rules.md`.
    - Evaluate method and class lengths as per Quality Metrics Targets.
    - Identify technical debt markers like `TODO`, `FIXME`, or `HACK`.
3.  **Risk & Performance Audit**:
    - **Manifest Check**: Search diff for `Packages/manifest.json`. If found, add a 🔴 **Critical** or 🟡 **Major** warning (depending on impact) to the review.
    - Scan for memory leaks, missing null guards, and high-allocation patterns (e.g., string concatenation or `GetComponent` in `Update`).
    - Audit architectural logic for consistency with project patterns (Singletons, Event architectures).
4.  **Draft Findings**:
    - Categorize issues using severity levels: 🔴 **Critical**, 🟡 **Major**, 🔵 **Minor**, 💚 **Suggestion**.
    - Draft commit-ready code fixes using `suggestion` blocks.
    - **Approval Logic**: If no 🔴 **Critical** or 🟡 **Major** issues are found, set the `"event": "APPROVE"` in `review.json`. Otherwise, use `"COMMENT"`.
    - Generate `review.json` following the [REVIEW_JSON_SPEC.md](references/REVIEW_JSON_SPEC.md).
5.  **Submit & Cleanup**:
    - **Always** execute the delivery script: `bash scripts/post_review.sh <number> review.json`.
    - Delete temporary files: `pr_diff.patch` and `review.json`.
6.  **Confirmation**: Provide the PR URL and a high-level technical summary of the findings to the user.

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
