---
trigger: always_on
glob: Unity C# Coding Conventions
description: C# coding standards for Unity development.
---

## Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Classes | PascalCase | `PlayerController` |
| Methods | PascalCase | `TakeDamage(int amount)` |
| Private Fields | _camelCase | `private int _health;` |
| Public Properties | PascalCase | `public int CurrentHealth { get; }` |
| Local Variables | camelCase | `int damageAmount = 10;` |
| Constants | PascalCase | `const float MaxSpeed = 10f;` |

## Architecture

1. **Component-Based**: Small, focused, single-responsibility components
2. **ScriptableObjects**: Configuration data, not hardcoded values
3. **Object Pooling**: Mandatory for frequently instantiated objects
4. **Assembly Definitions**: Use `.asmdef` to organize code

## Unity 6 (6000.1)

Prefer `Awaitable` over Coroutines:
```csharp
private async Awaitable Start()
{
    await Awaitable.WaitForSecondsAsync(1f);
    if (this == null) return; // Safety check!
    Debug.Log("Done");
}
```

## Performance

- **Avoid Update()**: Use events or reactive patterns
- **Cache References**: `GetComponent` and `Camera.main` in `Awake`/`Start`
- **No String Concat**: Use `StringBuilder` in hot paths
- **Watch Boxing**: Use generic collections `List<T>`

## Testing

- Location: `Tests/EditMode/` and `Tests/PlayMode/`
- Naming: `[Subject]_[Scenario]_[ExpectedResult]`
