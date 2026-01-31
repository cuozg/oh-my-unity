# Review JSON Specification

JSON format for staging PR review findings before posting to GitHub.

## Format

```json
{
  "body": "## Unity PR Review Summary\n\n### 🔴 Breaking Changes (2)\n- Method signature change affects 12 callers\n- Event parameter change breaks 5 subscribers\n\n### 🟡 Potential Issues (3)\n[...]\n\n### Impact Analysis\nInvestigated 45 files, found 17 affected call sites.",
  "event": "REQUEST_CHANGES",
  "comments": [
    {
      "path": "Assets/Scripts/Rewards/RewardManager.cs",
      "line": 42,
      "side": "RIGHT",
      "body": "🔴 **Critical**: Method signature changed from `ProcessReward(int amount)` to `ProcessReward(RewardData data)`.\n\n**Impact Analysis**: Found 12 callers that will break:\n- `QuestSystem.cs:123`\n- `DailyBonus.cs:67`\n- `AchievementHandler.cs:89`\n\n```suggestion\n// Add backward-compatible overload\npublic void ProcessReward(int amount) => ProcessReward(new RewardData { Amount = amount });\n```"
    },
    {
      "path": "Assets/Scripts/Events/GameEvents.cs",
      "line": 15,
      "side": "RIGHT",
      "body": "🔴 **Critical**: Event `OnMatchComplete` signature changed.\n\n**Before**: `Action<int>`\n**After**: `Action<MatchResult>`\n\n**Subscribers requiring update**:\n| File | Line | Handler |\n|:-----|:-----|:--------|\n| ScoreUI.cs | 45 | `OnScore(int)` |\n| Analytics.cs | 78 | `TrackMatch(int)` |"
    },
    {
      "path": "Assets/Scripts/Data/PlayerData.cs",
      "line": 8,
      "side": "RIGHT",
      "body": "🟡 **Major**: Field `score` renamed to `playerScore`. This will break serialization for existing save files.\n\n```suggestion\n[FormerlySerializedAs(\"score\")]\npublic int playerScore;\n```"
    }
  ]
}
```

## Field Reference

### Root Fields

| Field | Type | Description |
|:------|:-----|:------------|
| `body` | string | PR summary with categorized findings and impact analysis |
| `event` | string | `APPROVE`, `COMMENT`, or `REQUEST_CHANGES` |
| `comments` | array | Inline review comments |

### Comment Fields

| Field | Type | Description |
|:------|:-----|:------------|
| `path` | string | File path from project root |
| `line` | number | Line number in NEW version (right side) |
| `side` | string | Always `"RIGHT"` for new code |
| `body` | string | Feedback with severity, impact analysis, and suggestion |

## Body Structure (Recommended)

```markdown
## Unity PR Review Summary

### 🔴 Breaking Changes (N)
- [Brief description of each critical issue]

### 🟡 Potential Issues (N)
- [Brief description of each major issue]

### 🔵 Code Quality (N)
- [Brief description of minor issues]

### Impact Analysis
- Files investigated: X
- Callers/references found: Y
- Breaking call sites: Z
```

## Comment Body Structure

For critical issues with impact:

```markdown
🔴 **Critical**: [What changed]

**Impact Analysis**: [What breaks]
- `File.cs:line` - [why it breaks]
- `File2.cs:line` - [why it breaks]

\`\`\`suggestion
[Fixed code]
\`\`\`
```

For issues without breaking impact:

```markdown
🟡 **Major**: [Issue description]

\`\`\`suggestion
[Fixed code]
\`\`\`
```

## Event Selection

| Condition | Event |
|:----------|:------|
| Any 🔴 Critical issues | `REQUEST_CHANGES` |
| Only 🟡/🔵/💚 issues | `COMMENT` |
| No issues found | `APPROVE` |
