---
trigger: always_on
glob: Unity Asset Management Rules
description: Asset organization, naming conventions, and optimization rules for Unity projects.
---

## Project Structure

```
Assets/
├── _Project/          # Main project files
│   ├── Scripts/       # C# by feature
│   ├── Prefabs/       # Character/environment
│   ├── Materials/     # Shared and specific
│   ├── Textures/      # Albedo, Normal, Metallic
│   └── Scenes/        # Main and test
├── _ThirdParty/       # External plugins
├── Plugins/           # Native plugins
└── Settings/          # Project settings, URP
```

## Naming Conventions

| Type | Convention | Example |
|:-----|:-----------|:--------|
| Prefabs | PascalCase | `PlayerCharacter.prefab` |
| Materials | PascalCase_Purpose | `Wood_Table.mat` |
| Textures | PascalCase_Suffix | `Wood_Albedo.png`, `Wood_Normal.png` |
| Scenes | PascalCase | `MainLevel.unity` |

## Asset Optimization

| Asset | Mobile | PC | Notes |
|:------|:-------|:---|:------|
| Textures | 2048 max, ASTC 6x6 | 4096 max | Disable Read/Write |
| Models | < 100k tris/scene | - | Use LOD groups |
| Materials | URP/Lit or SimpleLit | - | Minimize unique shaders |

## Prefab Workflow

- **Nested Prefabs**: Modularize complex objects
- **Variants**: Specialize base prefabs (`Enemy_Base` → `Enemy_Fire`)
- **Apply**: Verify in Prefab Mode before applying to instances
