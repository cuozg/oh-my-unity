---
name: unity-mobile-deploy
description: "iOS and Android development. Use when: implementing touch controls, optimizing for mobile constraints (battery/heat/memory), integrating native features (IAP/notifications), or configuring mobile builds."
---

# Unity Mobile Development

iOS and Android platform optimization and native integration.

## Platform Comparison

| Aspect | iOS | Android |
|:-------|:----|:--------|
| Graphics API | Metal | Vulkan/OpenGL ES |
| Build Tool | Xcode | Gradle |
| Native Lang | Obj-C/Swift | Java/Kotlin |
| Store | App Store | Google Play |

## Workflow

1. **Profile**: Identify target devices, minimum specs, required permissions
2. **Implement**: Platform-aware managers per [MOBILE_INTEROP_PATTERNS.md](references/MOBILE_INTEROP_PATTERNS.md)
3. **Optimize**: Real hardware profiling, audit textures/shaders/memory per [MOBILE_OPTIMIZATION_GUIDE.md](references/MOBILE_OPTIMIZATION_GUIDE.md)
4. **Deploy**: Build report via [MOBILE_BUILD_REPORT.md](assets/templates/MOBILE_BUILD_REPORT.md), validate Gradle/Xcode settings

## Critical Mobile Patterns

```csharp
// ✅ Respect safe area (notches, home indicators)
var safeArea = Screen.safeArea;
panel.anchoredPosition = new Vector2(safeArea.x, safeArea.y);

// ✅ Battery-conscious frame rate
Application.targetFrameRate = isGameplay ? 60 : 30;

// ✅ Handle app lifecycle
private void OnApplicationPause(bool paused) {
    if (paused) SaveProgress();
}

// ✅ Low memory warning
private void OnLowMemory() => Resources.UnloadUnusedAssets();
```

## Principles

- **Test on Hardware**: Simulators lie about performance and thermals
- **Fail Gracefully**: Handle network drops, backgrounding, low memory
- **Battery-Centric**: Reduce frame rate when idle
- **Privacy First**: Request permissions only when needed, explain why
- **Dynamic Resolution**: Scale gameplay, keep UI sharp
