---
name: unity-editor-tools
description: "Create Unity Editor tools and workflow automations. Use when: building custom Editor Windows/Inspectors, automating asset management, creating batch processors, or using UI Toolkit (UXML/USS)."
---

# Unity Editor Tools

Extend Unity Editor with custom tools and automated workflows.

## Tool Types

| Type | Use Case | Base Class |
|:-----|:---------|:-----------|
| Editor Window | Global tools (search, batch ops) | `EditorWindow` |
| Custom Inspector | Component-specific UI | `Editor` |
| Property Drawer | Field visualization | `PropertyDrawer` |
| Asset Postprocessor | Import automation | `AssetPostprocessor` |

## Templates

- [EDITOR_WINDOW_TEMPLATE.md](assets/templates/EDITOR_WINDOW_TEMPLATE.md)
- [CUSTOM_INSPECTOR_TEMPLATE.md](assets/templates/CUSTOM_INSPECTOR_TEMPLATE.md)
- Patterns: [EDITOR_SCRIPTING_PATTERNS.md](references/EDITOR_SCRIPTING_PATTERNS.md)
- UI Toolkit: [EDITOR_UI_TOOLKIT_GUIDE.md](references/EDITOR_UI_TOOLKIT_GUIDE.md)

## Critical Requirements

```csharp
// ✅ ALWAYS support Undo
Undo.RecordObject(target, "Change Health");
target.maxHealth = newValue;

// ✅ Batch asset operations
AssetDatabase.StartAssetEditing();
try {
    // Multiple asset operations
} finally {
    AssetDatabase.StopAssetEditing();
}

// ✅ Progress bar for long operations
EditorUtility.DisplayProgressBar("Processing", "Item " + i, progress);
EditorUtility.ClearProgressBar();
```

## Workflow

1. **Assess**: Identify pain point, choose Window vs Inspector
2. **Architecture**: UI Toolkit (preferred) or IMGUI, plan data persistence
3. **Implement**: Use templates, support Undo, mark dirty
4. **Verify**: Test domain reloads, scene changes, profile large datasets

## Principles

- **Undo is Mandatory**: Always `SerializedObject` or `Undo.RecordObject`
- **Theme Aware**: Use USS variables for Dark/Light mode
- **No Polling**: Use `TrackPropertyValue` or events, not OnGUI checks
- **Batch Safely**: Wrap in `Start/StopAssetEditing`
