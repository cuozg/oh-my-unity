---
name: unity:editor-tools
description: "Specialist in creating Unity Editor tools, custom windows, and workflow automations to support engineering teams. Use when: (1) Creating custom Editor Windows or Inspectors, (2) Automating asset management or scene validation, (3) Building technical utilities for engineers (e.g., search tools, batch processors), or (4) Integrating modern Editor UI Toolkit (UXML/USS) interfaces."
---

# Unity Editor Developer

Empowering engineering teams by extending the Unity Editor with high-quality, performant tools and automated workflows.

## Core Capabilities

- **UI Development**: Author modern Editor interfaces using UI Toolkit (UXML/USS) and legacy IMGUI where needed.
- **Workflow Automation**: Implement `AssetPostprocessor`, `MenuItem`, and `Shortcut` systems to drive efficiency.
- **Data Engineering**: Build custom SerializedProperty drawers and inspectors that handle complex project data safely.
- **Project Governance**: Automate scene validation, asset auditing, and technical debt detection.

## Editor Development Workflow

1.  **Requirement Assessment**:
    - Identify the specific pain point (e.g., "Finding missing scripts takes too long").
    - Decide between an `EditorWindow` (global tool) or a `CustomEditor` (component-specific tool).
2.  **Architecture**:
    - Choose between modern [UI Toolkit](references/EDITOR_UI_TOOLKIT_GUIDE.md) or legacy IMGUI.
    - Plan data persistence (e.g., `EditorPrefs` for UI state or `ScriptableObject` for tool configuration).
3.  **Implementation**:
    - Use [EDITOR_WINDOW_TEMPLATE.md](assets/templates/EDITOR_WINDOW_TEMPLATE.md) or [CUSTOM_INSPECTOR_TEMPLATE.md](assets/templates/CUSTOM_INSPECTOR_TEMPLATE.md).
    - Leverage common scripting patterns from [EDITOR_SCRIPTING_PATTERNS.md](references/EDITOR_SCRIPTING_PATTERNS.md).
    - Ensure all modifications support **Undo** and **Dirty Marking** for scene/assets.
4.  **Verification**:
    - Test the tool's resilience against domain reloads and scene changes.
    - Profile memory and CPU usage if the tool handles large asset databases.

## Best Practices

- **Undo is Mandatory**: Always use `SerializedObject` or `Undo.RecordObject`. Never modify data directly without an undo entry.
- **Match the Engine**: Use Unity's built-in UI variables (USS themes) so tools look native in both Dark and Light modes.
- **Feedback & Feedback**: Use `EditorUtility.DisplayProgressBar` for long-running batch tasks.
- **Safety First**: Wrap `AssetDatabase` batch operations in `StartAssetEditing`/`StopAssetEditing` blocks.
- **Avoid Polling**: Use `TrackPropertyValue` or events instead of checking for changes in `OnGUI` or `Update`.
