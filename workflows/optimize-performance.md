---
description: Workflow for identifying and resolving performance bottlenecks in Unity.
---

# Workflow: Performance Optimization

Use this workflow when the game is laggy or frame rate drops below targets.

1. **Initial Assessment**:
   - Get project stats using `manage_scene` (action="screenshot").
   - Check console for high-frequency logs using `read_console`.
2. **identify Hotspots**:
   - Search for `Update()`, `FixedUpdate()`, and `LateUpdate()` methods in the logic scripts.
   - Look for `GetComponent`, `Find`, or `Instantiate` calls inside loops.
3. **Analyze Graphics**:
   - Check for heavy shaders or high draw calls.
   - List materials using `manage_asset` with search_pattern="*.mat".
4. **Implement Optimizations**:
   - **Scripting**: Use object pooling, cache components, or move logic to `Awaitable` or Coroutines with delays.
   - **Graphics**: Combine materials, use simpler shaders, or implement LODs.
   - **Settings**: Adjust quality settings based on the platform.
5. **Validation**:
   - Enter Play Mode and monitor the console.
   - If possible, check relevant profiler markers if they were added to the code.
6. **Documentation**: Update the `documentation-specialist` if architectural changes were made.
