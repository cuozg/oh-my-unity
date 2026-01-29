---
name: unity-implement-logic
description: "Implement Unity C# logic, gameplay systems, and architecture. Use when: creating scripts/MonoBehaviours, refactoring logic, implementing gameplay features, or integrating Unity 6 features (Awaitable, New Input System)."
---

# Unity Logic Implementation

Implement robust, performant C# logic following project conventions.

## Critical: Async Safety Pattern

```csharp
// ✅ ALWAYS check for destruction after await in MonoBehaviours
private async Awaitable LoadPlayerData()
{
    var data = await DataService.FetchAsync();
    
    // Object may be destroyed during await - CHECK REQUIRED
    if (this == null) return;
    
    _playerData = data;
    OnDataLoaded?.Invoke();
}

// ✅ With CancellationToken
private CancellationTokenSource _cts;

private void OnEnable() => _cts = new CancellationTokenSource();
private void OnDisable() => _cts?.Cancel();

private async Awaitable LoadWithToken()
{
    try {
        await SomeOperation(_cts.Token);
        if (this == null) return;
        // Safe to proceed
    } catch (OperationCanceledException) { }
}
```

## Performance Reference

| Pattern | Issue | Fix |
|:--------|:------|:----|
| `GetComponent<T>()` in Update | Allocation every frame | Cache in Awake/Start |
| `Find*()` methods | O(n) scene search | Cache references, use DI |
| String concat in loop | GC allocation | StringBuilder or interpolation |
| `new` in Update | GC pressure | Object pooling |
| `Camera.main` | Calls FindGameObjectWithTag | Cache reference |

## Workflow

1. **Plan**: Identify dependencies, determine assembly (.asmdef)
2. **Implement**: Use [SCRIPT_TEMPLATE.md](assets/templates/SCRIPT_TEMPLATE.md), follow [UNITY_CSHARP_PATTERNS.md](references/UNITY_CSHARP_PATTERNS.md)
3. **Review**: Check async safety, performance pitfalls, null guards
4. **Compile**: `refresh_unity(compile="request")`, fix errors immediately

## Principles

- **Composition > Inheritance**: Small, focused components
- **Data-Driven**: Configuration in ScriptableObjects
- **Namespace Everything**: `_Project.Scripts.Feature`
- **Designer-Friendly**: Expose meaningful Inspector properties
