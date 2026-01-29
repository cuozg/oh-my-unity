---
name: unity-plan-brainstorm
description: "Technical deep-dive for task implementation. Input: task.md from Documents/Tasks/. Investigates code, brainstorms with user, generates specific code changes, updates task to be execution-ready."
---

# Unity Plan Brainstorm

Refine task skeletons into precise, execution-ready implementation guides.

## Code Change Format

```markdown
### Change 1: Add Heal Method

**File**: `Assets/_Project/Scripts/Player/HealthManager.cs`
**After line**: 45 (after TakeDamage method)

```csharp
/// <summary>
/// Restores health, capped at MaxHealth.
/// </summary>
public void Heal(int amount)
{
    if (amount <= 0) return;
    _currentHealth = Mathf.Min(_currentHealth + amount, MaxHealth);
    OnHealthChanged?.Invoke(_currentHealth);
}
```

**Rationale**: Using Mathf.Min prevents exceeding max health. Event invocation allows UI to update reactively.
```

## Workflow

1. **Intake**: Read `Documents/Tasks/[Number][Epic][Task].md`
2. **Investigate**: Load `unity-investigate-code`, trace exact files/lines
3. **Brainstorm**: Identify risks, **ask user** key decisions:
   - "Should cooldown be global or per-instance?"
   - "Support pooled objects here?"
4. **Detail**: Define every code change with file, location, snippet, rationale
5. **Update**: Rewrite task file with precise implementation guide

## Principles

- **No Ambiguity**: "Add `Heal(int)` to `HealthManager.cs` at line 45" not "Update Health class"
- **Explain "Why"**: Architecture rationale for every change
- **Execution Ready**: Final task = blueprint for `unity-plan-executor`
- **Research If Needed**: Use browser for Unity 6000.1 docs on unfamiliar APIs
