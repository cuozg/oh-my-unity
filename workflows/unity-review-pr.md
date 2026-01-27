---
description: Workflow for reviewing a Unity Pull Request using GitHub CLI and posting comments.
---

# Workflow: Review PR

Follow these steps to conduct a professional code review on a GitHub PR.

1. **Select PR**: Use `gh pr list` to see open pull requests or ask the user for a number.
2. **Fetch Diff**: Run `gh pr diff --patch <number> > pr_diff.patch`.
3. **Analyze & Inspect**:
   - Skim `pr_diff.patch` to identify changed files and lines.
   - For each changed script, use `view_file` to read the full context if the hunk is too small.
   - **Structural Analysis**: Count classes and check for tech debt markers (`TODO`/`FIXME`).
   - **Pattern Detection**: Identify architectural patterns (Singletons, ECS) and check for consistency.
4. **Identify Issues**: Cross-reference changes with:
   - `.agent/rules/unity-csharp-conventions.md`
   - `.agent/rules/unity-asset-rules.md`
   - Software Engineering Fundamentals (SOLID, DRY/KISS).
   - Performance & Memory (Allocations in `Update`, pooling).
5. **Draft Comprehensive Comments**:
   - Create a list of findings categorized by **Severity Levels** (Critical, Major, Minor, Suggestion).
   - Include **Positive Highlights** for high-quality implementations.
   - Ensure the line number matches the **RIGHT** side (new file) in the diff.
6. **Prepare JSON**: Create `review.json` following the detailed template in `.agent/skills/unity-pr-reviewer/SKILL.md`.
7. **Submit Review**: Run `.agent/skills/unity-pr-reviewer/scripts/post_review.sh <number> review.json`.
8. **Confirmation**: Inform the user that the review has been posted and provide the PR URL.

// turbo-all
9. **Cleanup**: Remove `pr_diff.patch` and `review.json`.
