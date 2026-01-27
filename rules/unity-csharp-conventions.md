---
trigger: always_on
glob: Unity C# Coding Conventions
description: This rule defines the coding standards for C# development in this Unity project.
---

## Naming Conventions

- **Scripts/Classes**: PascalCase (e.g., `PlayerController.cs`)
- **Methods**: PascalCase (e.g., `public void TakeDamage(int amount)`)
- **Private Fields**: camelCase with underscore prefix (e.g., `private int _health;`)
- **Public Fields/Properties**: PascalCase (e.g., `public int CurrentHealth { get; private set; }`)
- **Local Variables**: camelCase (e.g., `int damageAmount = 10;`)
- **Constants**: PascalCase or SCREAMING_SNAKE_CASE (e.g., `const float MaxSpeed = 10f;`)

## Architecture Principles

1. **Component-Based Design**: Keep components small and focused on a single responsibility.
2. **ScriptableObjects for Data**: Store configuration and static data in ScriptableObjects, not hardcoded in MonoBehaviours.
3. **Object Pooling**: Always use object pooling for frequently instantiated objects like projectiles or particles.
4. **Assembly Definitions**: Use `.asmdef` files to organize code and minimize compilation times.

## Unity 6 (6000.1) Specifics

1. **Awaitable API**: Prefer `Awaitable` over Coroutines for asynchronous logic.
   ```csharp
   private async Awaitable Start()
   {
       await Awaitable.WaitForSecondsAsync(1f);
       Debug.Log("One second passed");
   }
   ```
2. **Modern Tooling**: Leverage `unityMCP` for asset management and editor operations.

## Performance Guidelines

1. **Avoid `Update()` when unnecessary**: Use events or reactive patterns instead.
2. **Minimize `GetComponent` calls**: Cache references in `Awake` or `Start`.
3. **Strings and Allocations**: Avoid frequent string concatenations in hot loops; use `StringBuilder` or pre-allocated strings.
4. **Boxing**: Be mindful of boxing when using generics or object parameters.

## Testing

1. **Unit Tests**: Place unit tests in `Tests/EditMode` or `Tests/PlayMode`.
2. **Test Naming**: `[Subject]_[Scenario]_[ExpectedResult]` (e.g., `Player_TakesDamage_HealthDecreases`).
