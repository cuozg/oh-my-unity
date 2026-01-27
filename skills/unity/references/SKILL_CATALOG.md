# Unity Skill Catalog

This catalog maps high-level development tasks to the specialized Skills available in the `.agent/skills/` directory.

| Task Domain | Target Skill | Key Capability |
| :--- | :--- | :--- |
| **Project Setup & Logic** | `unity-coder` | Implementation of C# systems, MonoBehaviours, and design patterns. |
| **Data & Serialization** | `flatbuffers` | Specialist in FlatBuffers schema, C# generation, and binary data. |
| **Visualization** | `mermaid` | Specialist in visual diagrams, charts, and architectural mapping. |
| **Mobile Specifics** | `unity-mobile-developer` | iOS/Android optimizations, touch input, and native interop. |
| **Web Specifics** | `unity-web-developer` | WebGL deployment, browser interop, and JS communication. |
| **Pipeline & Tools** | `unity-tech-artist` | Shaders, `AssetPostprocessor`, and art pipeline automation. |
| **Editor Utilities** | `unity-editor-developer` | Custom Handles, Windows, Inspectors, and engineer-centric tools. |
| **Performance** | `unity-performance-optimizer` | Profiling, bottleneck identification, and optimization strategies. |
| **Debugging** | `unity-debugger` | Console analysis, stack trace investigation, and error resolution. |
| **Code Quality** | `unity-pr-reviewer` | Automated GitHub PR reviews and standards analysis. |
| **Planning & Docs** | `unity-plan` | Requirement decomposition and implementation roadmap. |
| **Planning & Docs** | `unity-tdd-writer` | Technical Design Document (TDD) generation (WWE 2025). |
| **Planning & Docs** | `unity-documentation` | Architecture and API documentation. |
| **Code Investigation** | `unity-code-investigator` | Tracing complex execution flows and static analysis. |
| **Testing** | `unity-test` | Edit Mode and Play Mode automated test implementation. |
| **Fundamental Tools** | `unity-mcp-basics` | Mastering `unityMCP` capabilities for editor control. |
| **Skill Management** | `skill-creator` | Creating or updating specialized agent skills. |

## Routing Guidance

- **If the user asks "How do I implement...?"** -> Load `unity-plan` then `unity-coder`.
- **If the user says "My game is slow."** -> Load `unity-performance-optimizer`.
- **If the user says "Review this code."** -> Load `unity-pr-reviewer`.
- **If the user has a console error.** -> Load `unity-debugger`.
- **If the user says "Create a tool for artists."** -> Load `unity-tech-artist` or `unity-editor-developer`.
