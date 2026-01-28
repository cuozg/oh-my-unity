# Unity C# Implementation Patterns

Best practices for writing clean, performant, and maintainable C# code in Unity 6 (6000.x).

## 1. Asynchronous Logic (Awaitable)

Unity 6's `Awaitable` is preferred over Coroutines for complex async flows.

```csharp
private async Awaitable PerformDelayedAction(float delay)
{
    // Wait for seconds
    await Awaitable.WaitForSecondsAsync(delay);
    
    // Wait for next frame
    await Awaitable.NextFrameAsync();
    
    // Perform logic
    Debug.Log("Action executed");
}
```

## 2. Event-Driven Architecture (Observer Pattern)

Use `Action` or `UnityEvent` to decouple systems.

```csharp
public class PlayerHealth : MonoBehaviour
{
    // Preferred: C# Action for pure logic listeners
    public event Action<int> OnHealthChanged;
    
    // Use UnityEvent for Designer-friendly Inspector hooks
    public UnityEngine.Events.UnityEvent OnDeath;

    public void TakeDamage(int damage)
    {
        health -= damage;
        OnHealthChanged?.Invoke(health);
        
        if (health <= 0) OnDeath.Invoke();
    }
}
```

## 3. Persistent Systems (Singleton Pattern)

Use singletons sparingly for global managers.

```csharp
public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }
}
```

## 4. State Management (State Machine)

For complex behavior like Player or AI states.

```csharp
public enum PlayerState { Idle, Walking, Jumping }

public class PlayerController : MonoBehaviour
{
    private PlayerState currentState;

    public void ChangeState(PlayerState newState)
    {
        if (currentState == newState) return;
        
        // Handle Exit logic
        ExitState(currentState);
        
        currentState = newState;
        
        // Handle Enter logic
        EnterState(currentState);
    }
}
```

## 5. Performance Best Practices

- **Avoid Update**: Use events or reactive patterns instead.
- **Cache References**: Always cache `GetComponent` and `Camera.main` in `Awake` or `Start`.
- **String Optimization**: Use `StringBuilder` or pre-allocated strings for frequent HUD updates.
- **Boxing**: Use generic collections (`List<T>`) to avoid boxing/unboxing.
- **Object Pooling**: Mandatory for high-frequency objects (projectiles, impact VFX).
