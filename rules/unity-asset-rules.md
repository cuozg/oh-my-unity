---
trigger: always_on
glob: Unity Asset Management Rules
description: Asset organization and optimization standards.
---

## Project Structure

```
Assets/
├── _Project/          # Main project files
│   ├── Scripts/       # C# by feature
│   ├── Prefabs/       # Character/environment
│   ├── Materials/     # Shared materials
│   ├── Textures/      # Albedo, Normal, Metallic
│   └── Scenes/        # Game and test scenes
├── _ThirdParty/       # External plugins
├── Plugins/           # Native plugins
└── Settings/          # URP, project settings
```

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Prefabs | PascalCase | `PlayerCharacter.prefab` |
| Materials | PascalCase_Purpose | `Wood_Table.mat` |
| Textures | PascalCase_Suffix | `Wood_Albedo.png` |
| Scenes | PascalCase | `MainLevel.unity` |

## Optimization

**Textures**: Max 2048 mobile / 4096 PC, ASTC 6x6, disable Read/Write  
**Models**: < 100k tris/scene mobile, use LOD groups  
**Materials**: URP/Lit or SimpleLit, minimize unique shaders

## Prefab Workflow

1. **Nested Prefabs**: Modularize complex objects
2. **Variants**: Specialize base prefabs (`Enemy_Base` → `Enemy_Fire`)
3. **Verify**: Always check Prefab Mode before applying
