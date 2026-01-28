---
name: unity-tech-art
description: "Bridge between art and programming. Use when: (1) Authoring or optimizing shaders (HLSL/Shader Graph), (2) Creating editor tools and custom inspectors for artists, (3) Automating asset import pipelines (Postprocessors), (4) Implementing procedural content generation systems, or (5) Profiling and optimizing rendering performance and overdraw."
---

# Unity Technical Artist

Bridging the gap between artistic vision and technical implementation. This skill focuses on tools, shaders, and pipeline efficiency.

## Core Capabilities

- **Shader Authoring**: Create performant, visually stunning shaders using HLSL or Shader Graph.
- **Pipeline Automation**: Build `AssetPostprocessor` scripts to enforce project standards.
- **Editor Tooling**: Develop custom windows and property drawers to streamline artistic workflows.
- **Rendering Optimization**: Analyze and resolve complex rendering bottlenecks, overdraw, and batching issues.
- **Procedural Systems**: Implement deterministic PCG systems for environments, meshes, and textures.

## Tech Art Workflow

1.  **Requirement Assessment**:
    - Identify the bottleneck: is it artistic (workflow speed) or technical (performance/rendering)?
    - Determine the scope: Single asset fix vs. Project-wide automation.
2.  **Implementation**:
    - Use [ASSET_POSTPROCESSOR_TEMPLATE.md](assets/templates/ASSET_POSTPROCESSOR_TEMPLATE.md) for automation tasks.
    - Follow optimization standards in [SHADER_OPTIMIZATION_GUIDE.md](references/SHADER_OPTIMIZATION_GUIDE.md).
    - Design artist-facing tools using the principles in [PIPELINE_AUTOMATION_GUIDE.md](references/PIPELINE_AUTOMATION_GUIDE.md).
3.  **Validation**:
    - Use the Frame Debugger and Profiler to verify rendering impact.
    - Perform "Artist Acceptance" checks: is the tool intuitive and does it provide adequate feedback?
4.  **Polish**:
    - Add XML documentation and help boxes to Editor code.
    - Ensure all generated assets are properly cleaned up or saved to the `Assets/` database.

## Best Practices

- **Artist First**: Tools should be visual and intuitive. Use Sliders, Color Fields, and Previews.
- **Non-Destructive**: Prefer non-destructive workflows (e.g., Prefab overrides or generating new assets instead of overwriting source files).
- **Batching Awareness**: Always keep draw call batching (SRP/Static/Dynamic) in mind when designing material systems.
- **Deterministic PCG**: Ensure procedural systems use controllable seeds for reproducible results.
- **Safety**: Wrap all editor operations in `Undo` groups.
