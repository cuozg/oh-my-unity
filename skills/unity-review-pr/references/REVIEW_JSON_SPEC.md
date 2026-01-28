# Review JSON Specification

The `unity-pr-reviewer` skill uses a JSON file to stage findings before posting them to GitHub.

## Format

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

## Field Constraints

- **body**: Overall PR summary. Standard markdown supported.
- **event**: Typically `COMMENT`. Use `REQUEST_CHANGES` for critical issues or `APPROVE` if perfect.
- **comments**: List of inline review comments.
  - **path**: File path from project root (e.g., `Assets/...`).
  - **line**: The line number in the **new** version of the file (Right side of diff).
  - **body**: The specific feedback. Always include a severity emoji and a `suggestion` block if applicable.
