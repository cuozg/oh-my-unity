# Specialist Execution Mapping

Guide for choosing the right specialized skill for a task based on the domain.

| Task Domain | Specialist Skill to Load |
| :--- | :--- |
| **C# Logic, MonoBehaviours, Managers** | `unity-coder` |
| **Shaders, VFX, Materials, AssetPostprocessors** | `unity-tech-artist` |
| **Editor Windows, Custom Inspectors, Tools** | `unity-editor-developer` |
| **FlatBuffer Schema (.fbs), JSON Data, Binary** | `flatbuffers` |
| **Mobile Interop, Android/iOS Features** | `unity-mobile-developer` |
| **WebGL, JS Interop, Browser Optimization** | `unity-web-developer` |
| **Profiling, FPS Fixes, Memory Leaks** | `unity-performance-optimizer` |
| **Automated Tests (Edit/Play Mode)** | `unity-test` |
| **Code Structure, API Documentation** | `unity-documentation` |

## Composite Tasks

If a task detail file (`.md`) includes multiple domains:
1.  **Phase 1**: Load `unity-coder` to set up the logic backbone.
2.  **Phase 2**: Load specialists for specific assets (e.g., `flatbuffers` for data or `unity-tech-artist` for shaders).
3.  **Phase 3**: Load `unity-test` to verify implementation.
