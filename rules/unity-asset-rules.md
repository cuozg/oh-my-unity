---
trigger: always_on
glob: Unity Asset Management Rules
description: This rule defines how assets should be organized and managed in the project.
---

## Project Structure

```
Assets/
├── _Project/          # Main project files
│   ├── Scripts/       # C# Scripts organized by feature
│   ├── Prefabs/       # Character and environment prefabs
│   ├── Materials/     # Shared and specific materials
│   ├── Textures/      # Albedo, Normal, Metallic maps
│   └── Scenes/        # Main game and test scenes
├── _ThirdParty/       # External plugins and assets
├── Plugins/           # Platform-specific native plugins
└── Settings/          # Project settings, URP assets, etc.
```

## Naming Conventions for Assets

- **Prefabs**: PascalCase (e.g., `PlayerCharacter.prefab`)
- **Materials**: PascalCase_Purpose (e.g., `Wood_Table.mat`)
- **Textures**: PascalCase_Suffix (e.g., `Wood_Albedo.png`, `Wood_Normal.png`)
- **Scenes**: PascalCase (e.g., `MainLevel.unity`)

## Asset Optimization

1. **Textures**:
   - Max size 2048 for mobile, 4096 for PC.
   - Use ASTC 6x6 compression for mobile.
   - Disable "Read/Write" unless necessary.
2. **Models**:
   - Minimize triangle count (target budgets: Mobile < 100k per scene).
   - Use LOD (Level of Detail) groups for complex meshes.
3. **Materials**:
   - Use URP/Lit or URP/SimpleLit for mobile.
   - Minimize the number of unique shaders and materials to improve batching.

## Prefab Workflow

1. **Nested Prefabs**: Use nested prefabs to modularize complex objects.
2. **Prefab Variants**: Use variants for specializing base prefabs (e.g., `Enemy_Base` -> `Enemy_Fire`).
3. **Apply Changes**: Always verify changes in Prefab Mode before applying to all instances.
