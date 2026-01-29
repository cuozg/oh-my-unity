---
name: unity-tech-art
description: "Technical art for Unity. Use when: authoring/optimizing shaders, creating artist tools, automating asset pipelines, implementing procedural generation, or profiling rendering performance."
---

# Unity Technical Art

Bridge between artistic vision and technical implementation.

## Key Areas

| Area | Tools/APIs | References |
|:-----|:-----------|:-----------|
| Shaders | HLSL, Shader Graph | [SHADER_OPTIMIZATION_GUIDE.md](references/SHADER_OPTIMIZATION_GUIDE.md) |
| Pipeline | AssetPostprocessor | [ASSET_POSTPROCESSOR_TEMPLATE.md](assets/templates/ASSET_POSTPROCESSOR_TEMPLATE.md) |
| Tools | EditorWindow, PropertyDrawer | [PIPELINE_AUTOMATION_GUIDE.md](references/PIPELINE_AUTOMATION_GUIDE.md) |
| Rendering | Frame Debugger, Profiler | - |
| PCG | Procedural systems | Deterministic seeds |

## Workflow

1. **Assess**: Is it workflow speed (artistic) or performance (technical)?
2. **Scope**: Single asset fix vs project-wide automation
3. **Implement**: Use templates, follow optimization guides
4. **Validate**: Frame Debugger + Profiler for rendering, "Artist Acceptance" for tools
5. **Polish**: XML docs, help boxes, proper asset cleanup

## Shader Optimization Checklist

```hlsl
// ✅ Use half precision when possible
half4 color = tex2D(_MainTex, uv);

// ✅ Avoid expensive operations in fragment
// Move to vertex shader when possible

// ✅ Use texture atlases to reduce draw calls

// ✅ LOD variants for mobile
#pragma shader_feature_local _DETAIL_ON
```

## Principles

- **Artist First**: Visual tools with sliders, color fields, previews
- **Non-Destructive**: Generate new assets, don't overwrite sources
- **Batching Aware**: Consider SRP/Static/Dynamic batching in material design
- **Deterministic PCG**: Controllable seeds for reproducible results
- **Undo Always**: Wrap editor operations in Undo groups
