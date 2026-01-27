# Unity Test Examples

## Edit Mode Test
Fast-running tests for pure logic.

```csharp
[Test]
public void Health_TakesDamage_ValueDecreases()
{
    var health = new Health();
    health.SetMax(100);
    health.TakeDamage(20);
    Assert.AreEqual(80, health.Current);
}
```

## Play Mode Test (Coroutine)
Tests involving GameObjects, Physics, or UI.

```csharp
[UnityTest]
public IEnumerator Player_MovesOnInput_PositionChanges()
{
    var go = new GameObject();
    var movement = go.AddComponent<PlayerMovement>();
    Vector3 start = go.transform.position;

    movement.Move(Vector3.forward);
    yield return new WaitForSeconds(0.1f);

    Assert.IsTrue(go.transform.position.z > start.z);
    Object.Destroy(go);
}
```

## Assembly Definition (Tests.asmdef)
Ensure the `UNITY_INCLUDE_TESTS` constraint is present.

```json
{
    "name": "Tests",
    "references": ["UnityEngine.TestRunner", "UnityEditor.TestRunner", "GameCode"],
    "includePlatforms": [],
    "excludePlatforms": [],
    "overrideReferences": true,
    "precompiledReferences": ["nunit.framework.dll"],
    "autoReferenced": false,
    "defineConstraints": ["UNITY_INCLUDE_TESTS"]
}
```
