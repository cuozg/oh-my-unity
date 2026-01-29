---
name: unity-test
description: "Create and run Unity tests. Use when: creating Edit/Play Mode tests, configuring test assemblies, mocking dependencies, or analyzing test results."
---

# Unity Testing

Automated testing with Unity Test Framework (UTF).

## Example Test

```csharp
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

[TestFixture]
public class PlayerHealthTests
{
    private Player _player;
    private GameObject _go;

    [SetUp]
    public void SetUp()
    {
        _go = new GameObject();
        _player = _go.AddComponent<Player>();
        _player.Initialize(maxHealth: 100);
    }

    [TearDown]
    public void TearDown() => Object.DestroyImmediate(_go);

    [Test]
    public void TakeDamage_ReducesHealth()
    {
        // Arrange
        int damage = 30;
        
        // Act
        _player.TakeDamage(damage);
        
        // Assert
        Assert.AreEqual(70, _player.CurrentHealth);
    }

    [Test]
    public void TakeDamage_BelowZero_ClampsToZero()
    {
        _player.TakeDamage(150);
        Assert.AreEqual(0, _player.CurrentHealth);
    }
}
```

## Test Types

| Type | Use For | Location |
|:-----|:--------|:---------|
| Edit Mode | Pure logic, algorithms, no Unity lifecycle | `Tests/EditMode/` |
| Play Mode | Physics, coroutines, component lifecycles, UI | `Tests/PlayMode/` |

## Workflow

1. **Analyze**: Identify target method/class, check existing `.asmdef`
2. **Strategy**: Edit Mode for pure logic, Play Mode for Unity systems
3. **Setup**: Create `Tests/` folder + `.asmdef` referencing `UnityEngine.TestRunner`
4. **Implement**: Arrange-Act-Assert pattern, `[SetUp]`/`[TearDown]` for state
5. **Run**: `unityMCP.run_tests`
6. **Fix**: On failure → `/unity-fix-errors` or `/unity-investigate-code`

See [TEST_EXAMPLES.md](references/TEST_EXAMPLES.md) for more patterns.

## Naming Convention

`[Subject]_[Scenario]_[ExpectedResult]`  
Example: `Player_TakesDamage_HealthDecreases`
