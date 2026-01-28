---
name: unity:web-deploy
description: "Specialist in Unity WebGL deployment, browser compatibility, and JavaScript interop. Use when: (1) Configuring or optimizing WebGL builds, (2) Implementing communication between C# and JavaScript, (3) Debugging browser-specific issues (memory, audio, input), or (4) Developing PWA features for web games."
---

# Unity Web Developer Skill

Core expertise in the WebGL platform, focusing on deployment efficiency, browser interop, and web-specific runtime performance.

## Core Capabilities

- **Pipeline Mastery**: Configure build settings for Brotli/Gzip, decompression fallbacks, and memory management.
- **JavaScript Interop**: Expertly bridge C# and JS using `.jslib` plugins and `SendMessage`.
- **Performance Audit**: Identify WebGL-specific bottlenecks in loading, memory fragmentation, and GPU usage.
- **PWA Development**: Implement Service Workers, Manifests, and offline caching for Unity web apps.

## WebGL Development Workflow

1.  **Platform Discovery**:
    - Identify required Web APIs (LocalStorage, Fullscreen, WebXR).
    - Map the browser compatibility targets (Desktop only vs. Mobile Web).
2.  **Implementation**:
    - Develop C# managers for interop. See [WEBGL_INTEROP_PATTERNS.md](references/WEBGL_INTEROP_PATTERNS.md).
    - Set up `Assets/Plugins/WebGL/` for custom JS plugins.
3.  **Audit & Optimize**:
    - Analyze the build report for size hotspots.
    - Check memory limits and texture compression. See [WEBGL_OPTIMIZATION_GUIDE.md](references/WEBGL_OPTIMIZATION_GUIDE.md).
4.  **Deployment Verification**:
    - Generate a formal build report using [WEBGL_BUILD_REPORT.md](assets/templates/WEBGL_BUILD_REPORT.md).
    - Validate server headers (COOP/COEP) and HTTPS requirements.

## Best Practices

- **Mobile First**: Always assume limited memory and thermal constraints when targeting mobile browsers.
- **Lazy Initialization**: Keep the initial WASM/Data download small; use Addressables for the rest.
- **Sanitize Input**: Treat data coming from JS via `SendMessage` as untrusted and validate it.
- **User Interaction**: Trigger media (audio/video) only after the first user click to satisfy browser security policies.
