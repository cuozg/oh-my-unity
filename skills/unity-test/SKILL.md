---
name: unity-test
description: Expert in automated testing using the Unity Test Framework (UTF). Handles unit, integration, and play mode tests.
---

# Unity Test Skill

This skill is specialized for creating, executing, and managing tests within Unity using the **Unity Test Framework (UTF)**. It focuses on ensuring code quality, preventing regressions, and validating game systems.

## Core Capabilities

### 1. Test Suite Creation
- **Edit Mode Tests**: Fast-running tests for non-MonoBehaviour logic and utility functions.
- **Play Mode Tests**: Tests that run in a simulated game loop to validate `MonoBehaviour` interactions, physics, and UI.
- **Assembly Setup**: Configuring `.asmdef` files to properly include the `UnityEngine.TestRunner` and `UnityEditor.TestRunner`.

### 2. Test Development
- **Mocking & Stubs**: Creating mock objects for dependencies to isolate logic.
- **Test Base Classes**: Implementing standard `SetUp` and `TearDown` patterns for clean test environments.
- **Assertions**: Utilizing `NUnit.Framework` and `UnityEngine.TestTools` assertions.

### 3. Execution & Reporting
- **Automated Execution**: Running tests via `unityMCP` or command line.
- **Result Analysis**: Parsing test logs to identify failures and regressions.
- **Coverage Tracking**: Integrating with Unity Code Coverage to identify untested code paths.

## Investigation Workflow

Before writing tests, the agent should:
1.  **Identify Target Logic**: Use `/investigate-code` to understand the class or system to be tested.
2.  **Determine Test Mode**: Decide between Edit Mode (logic-only) or Play Mode (component/interaction).
3.  **Map Dependencies**: Identify what needs to be mocked or instantiated.

## Standard Test Structure

### Assembly Definition (`Tests.asmdef`)
```json
{
    "name": "Tests",
    "references": [
        "UnityEngine.TestRunner",
        "UnityEditor.TestRunner",
        "YourProjectAssembly"
    ],
    "includePlatforms": [],
    "excludePlatforms": [],
    "overrideReferences": true,
    "precompiledReferences": [
        "nunit.framework.dll"
    ],
    "autoReferenced": false,
    "defineConstraints": [
        "UNITY_INCLUDE_TESTS"
    ]
}
```

### Example Test Class
```csharp
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using System.Collections;

public class PlayerActionTests
{
    [Test]
    public void Player_TakesDamage_HealthDecreases()
    {
        // Arrange
        var player = new GameObject().AddComponent<PlayerHealth>();
        player.Initialize(100);

        // Act
        player.TakeDamage(20);

        // Assert
        Assert.AreEqual(80, player.CurrentHealth);
    }

    [UnityTest]
    public IEnumerator Play_PlayerMoves_PositionChanges()
    {
        // Arrange
        var player = new GameObject().AddComponent<PlayerMovement>();
        Vector3 startPos = player.transform.position;

        // Act
        player.Move(Vector3.forward);
        yield return new WaitForSeconds(0.1f);

        // Assert
        Assert.AreNotEqual(startPos, player.transform.position);
    }
}
```

## Best Practices
- **Isolation**: Tests should not depend on external data or local machine state.
- **Cleanup**: Always destroy test GameObjects in `TearDown` or using `Undo.DestroyObjectImmediate` in Edit Mode.
- **naming**: Use `[Subject]_[Scenario]_[ExpectedResult]` naming convention.
- **Fast Feedback**: Prioritize Edit Mode tests where possible for speed.
