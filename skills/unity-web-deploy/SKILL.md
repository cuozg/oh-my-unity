---
name: unity-web-deploy
description: "Unity WebGL deployment and JS interop. Use when: configuring WebGL builds, implementing C#/JS communication, debugging browser issues (memory/audio/input), or developing PWA features."
---

# Unity WebGL Development

WebGL platform optimization and browser integration.

## Build Settings

| Setting | Recommended | Notes |
|:--------|:------------|:------|
| Compression | Brotli | Best size, needs server config |
| Memory Size | 256-512MB | Browser dependent |
| Exception Handling | Explicit Throw | Smaller builds |
| Strip Engine Code | Yes | Reduces size significantly |

## Workflow

1. **Discover**: Identify Web APIs needed (LocalStorage, Fullscreen, WebXR), browser targets
2. **Implement**: C# interop managers per [WEBGL_INTEROP_PATTERNS.md](references/WEBGL_INTEROP_PATTERNS.md), plugins in `Assets/Plugins/WebGL/`
3. **Optimize**: Build report analysis, memory limits, texture compression per [WEBGL_OPTIMIZATION_GUIDE.md](references/WEBGL_OPTIMIZATION_GUIDE.md)
4. **Deploy**: Build report via [WEBGL_BUILD_REPORT.md](assets/templates/WEBGL_BUILD_REPORT.md), validate COOP/COEP headers, HTTPS

## JS Interop Pattern

```csharp
// C# side
public class WebBridge : MonoBehaviour
{
    [DllImport("__Internal")]
    private static extern void JS_SaveToLocalStorage(string key, string value);
    
    // Called from JavaScript
    public void OnJSMessage(string data) {
        // ⚠️ ALWAYS validate data from JS
        if (string.IsNullOrEmpty(data)) return;
        ProcessData(JsonUtility.FromJson<Data>(data));
    }
}
```

```javascript
// Assets/Plugins/WebGL/bridge.jslib
mergeInto(LibraryManager.library, {
    JS_SaveToLocalStorage: function(keyPtr, valuePtr) {
        var key = UTF8ToString(keyPtr);
        var value = UTF8ToString(valuePtr);
        localStorage.setItem(key, value);
    }
});
```

## Principles

- **Mobile First**: Assume limited memory and thermal constraints on mobile browsers
- **Lazy Load**: Keep initial WASM/Data small, use Addressables for rest
- **Sanitize JS Input**: Treat `SendMessage` data as untrusted
- **User Interaction First**: Audio/video only after first click (browser policy)
