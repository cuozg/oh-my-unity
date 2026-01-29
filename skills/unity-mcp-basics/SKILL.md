---
name: unity-mcp-basics
description: "Unity Editor automation via unityMCP tools. Use when: finding/creating/modifying GameObjects and Components, managing scenes/prefabs, updating materials, or executing batch Editor operations."
---

# Unity MCP Basics

Automate Unity Editor tasks with `unityMCP` tools.

## Core Tools

| Tool | Purpose | Example |
|:-----|:--------|:--------|
| `find_gameobjects` | Locate objects | `find_gameobjects(name="Player")` |
| `manage_gameobject` | Create/modify objects | `manage_gameobject(action="create", name="Enemy")` |
| `manage_components` | Add/remove/update components | `manage_components(add="Rigidbody")` |
| `manage_scene` | Scene operations, screenshots | `manage_scene(action="get_hierarchy")` |
| `manage_material` | Material properties | `manage_material(color=Color.red)` |
| `refresh_unity` | Recompile | `refresh_unity(compile="request")` |
| `read_console` | Check logs/errors | `read_console()` |
| `batch_execute` | Multiple operations | Combine operations efficiently |

## Standard Sequence

```
1. Locate   → find_gameobjects(name="Target")
2. Modify   → manage_components(id=123, add="BoxCollider")
3. Verify   → read_console() or manage_scene(action="screenshot")
```

## Principles

- **Use Instance IDs**: Reliable targeting, not names (which may duplicate)
- **Batch Operations**: Use `batch_execute` for multiple similar operations
- **Verify First**: Check hierarchy before creating to avoid duplicates
- **Monitor Logs**: `read_console` after critical operations
