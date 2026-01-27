---
name: unity-performance-optimizer
description: Identification and resolution of performance bottlenecks in Unity projects. Use when: (1) Frame rate (FPS) is low or inconsistent, (2) Memory usage is high or leaking, (3) Load times are excessive, or (4) You need to audit scripts and assets for performance risks.
---

# Unity Performance Optimizer

Expert in diagnosing and resolving performance issues across logic, graphics, and memory.

## Core Capabilities

- **Logic Audit**: Detect expensive calls (`GetComponent`, `Find`, `Instantiate`) in hot loops or `Update()`.
- **Memory Management**: Identify excessive allocations, boxing, and potential memory leaks.
- **Graphic Optimization**: Audit draw calls, shaders, and asset compression settings.
- **Async Transformation**: Convert blocking logic to `Awaitable` or Coroutines with load-balancing.

## Optimization Workflow

1.  **Baseline Check**:
    - Use `manage_scene` (action="get_hierarchy") to analyze object counts and hierarchy depth.
    - Monitor the console for high-frequency logs using `read_console`.
2.  **Bottleneck Detection**:
    - Use `grep_search` to find expensive methods in logic scripts.
    - Identify excessive string concatenations or frequently called `Component` lookups.
3.  **Graphic Audit**:
    - List large assets using `manage_asset` with specific search filters.
    - Check for complex shaders or unoptimized materials using `manage_material`.
4.  **Implementation**:
    - **Logic**: Implement object pooling, cache references in `Awake`, and optimize algorithms.
    - **Assets**: Combine materials, simplify meshes, and adjust texture compression (e.g., ASTC 6x6).
5.  **Validation**:
    - Enter Play Mode and observe the console or frame timing logs for improvements.
    - Ensure optimization didn't introduce visual or logical regressions.
6.  **Documentation**:
    - Update the project documentation via `/unity-documentation` if core architectures were modified for performance.

## Best Practices

- **Avoid Update**: Move logic to event-based or reactive patterns wherever possible.
- **Cache Everything**: Never call `GetComponent` or `Camera.main` inside a loop or `Update`.
- **Pool Frequent Objects**: Use object pooling for projectiles, VFX, and UI elements.
- **Mobile Target**: Always optimize with mobile-first constraints (memory/thermals).
