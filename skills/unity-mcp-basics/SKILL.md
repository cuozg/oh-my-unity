---
name: unity-mcp-basics
description: Mastery of using the unityMCP server to interact with the Unity Editor.
---

# Unity MCP Basics Skill

This skill enables the agent to effectively use the `unityMCP` toolset to automate Unity tasks.

## Core Capabilities

### 1. GameObject & Scene Management
- Use `find_gameobjects` to locate objects by name, tag, or component.
- Use `manage_gameobject` to create, modify, or delete GameObjects.
- Use `manage_scene` to get the hierarchy, save the scene, or take screenshots.

### 2. Component Interaction
- Use `manage_components` to add/remove components and set properties.
- Use `mcpforunity://scene/gameobject/{id}/components` to inspect existing components.

### 3. Scripting & Assets
- Use `create_script` and `manage_script` for C# development.
- Use `apply_text_edits` for precise script modifications.
- Use `manage_asset` for importing, moving, and searching project assets.

### 4. Specialized Systems
- Use `manage_material` for material and shader property updates.
- Use `manage_vfx` for Particle Systems and VFX Graph.
- Use `manage_prefabs` to handle prefab stages and creation.

## Best Practices

1. **Hierarchy Awareness**: Always check the hierarchy before creating objects to avoid duplicates.
2. **Instance ID Preference**: Use Instance IDs for targeting GameObjects when available, as they are most reliable.
3. **Batch Operations**: Use `batch_execute` when performing multiple similar operations (e.g., creating 10 cubes) to save time and tokens.
4. **Console Monitoring**: Regularly check `read_console` for errors or warnings after performing editor actions.

## Example Workflow: Creating a Light
1. `manage_gameobject` with action="create" and name="SceneLight".
2. `manage_components` with action="add" and component_type="Light".
3. `manage_components` with action="set_property" on "SceneLight" to set "type" = "Directional" and "intensity" = "1.5".
