---
name: unity:mcp-basics
description: "Core Mastery of the unityMCP toolset for Unity Editor automation. Use when you need to: (1) Find, create, or modify GameObjects and Components, (2) Manage scenes and prefabs, (3) Update materials and shaders, or (4) Execute batch operations in the Editor."
---

# Unity MCP Basics

Mastery of the `unityMCP` toolset to automate tasks directly within the Unity Editor.

## Core Capabilities

- **Hierarchy Control**: Find objects (`find_gameobjects`), modify them (`manage_gameobject`), and inspect hierarchies (`manage_scene`).
- **Component Management**: Add/remove components and update properties via `manage_components`.
- **Scripting & Assets**: Automated script creation and precise text edits (`apply_text_edits`).
- **Specialized Tools**: Deep control over materials, VFX, and prefab stages.

## Best Practices

- **Instance ID Preference**: Use Instance IDs for reliable targeting of GameObjects.
- **Batching**: Always use `batch_execute` for multiple similar operations to save tokens and time.
- **Verification**: Check the hierarchy before creating objects to avoid duplicates.
- **Monitor logs**: Use `read_console` to verify success after critical Editor actions.

## Standard Action Sequence

1. **Locate**: Find target with `find_gameobjects`.
2. **Modify**: Apply changes with `manage_components` or `manage_gameobject`.
3. **Verify**: Use `manage_scene` (screenshot) or `read_console` to confirm.
