---
trigger: always_on
glob: Unity C# Coding Conventions
description: C# coding standards for Unity development including naming, architecture, Unity 6 features, and performance.
---

## Naming Conventions

| Element | Convention | Example |
|:--------|:-----------|:--------|
| Scripts/Classes | PascalCase | `PlayerController.cs` |
| Methods | PascalCase | `TakeDamage(int amount)` |
| Private Fields | _camelCase | `private int _health;` |
| Public Properties | PascalCase | `public int CurrentHealth { get; }` |
| Local Variables | camelCase | `int damageAmount = 10;` |
| Constants | PascalCase | `const float MaxSpeed = 10f;` |

## Architecture

- **Component-Based**: Small, single-responsibility components
- **ScriptableObjects**: Configuration/static data, not hardcoded
- **Object Pooling**: Required for frequently instantiated objects
- **Assembly Definitions**: `.asmdef` for code organization

## Unity 6 Awaitable Pattern

```csharp
// ✅ CRITICAL: Always check for destruction after await
private async Awaitable LoadDataAsync()
{
    var data = await DataService.FetchAsync();
    
    if (this == null) return;  // Object may be destroyed!
    
    _data = data;
    OnDataLoaded?.Invoke();
}
```

## Performance

- **Avoid Update()**: Use events/reactive patterns when possible
- **Cache References**: Never `GetComponent`/`Camera.main` in loops
- **String Allocation**: Use `StringBuilder` in hot paths
- **Boxing**: Avoid with generics/object parameters

## Testing

- **Location**: `Tests/EditMode/` or `Tests/PlayMode/`
- **Naming**: `[Subject]_[Scenario]_[ExpectedResult]`
