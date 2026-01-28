# Unity Skill Catalog

This catalog maps high-level development tasks to the specialized Skills available in the `.claude/skills/` directory.

| Task Domain | Target Skill | Key Capability |
| :--- | :--- | :--- |
| **Project Setup & Logic** | `unity-implement-logic` | Implementation of C# systems, MonoBehaviours, and design patterns. |
| **Data & Serialization** | `flatbuffers-coder` | Specialist in FlatBuffers schema, C# generation, and binary data. |
| **Visualization** | `mermaid` | Specialist in visual diagrams, charts, and architectural mapping. |
| **Mobile Specifics** | `unity-mobile-deploy` | iOS/Android optimizations, touch input, and native interop. |
| **Web Specifics** | `unity-web-deploy` | WebGL deployment, browser interop, and JS communication. |
| **Pipeline & Tools** | `unity-tech-art` | Shaders, `AssetPostprocessor`, and art pipeline automation. |
| **Editor Utilities** | `unity-editor-tools` | Custom Handles, Windows, Inspectors, and engineer-centric tools. |
| **Performance** | `unity-optimize-performance` | Profiling, bottleneck identification, and optimization strategies. |
| **Debugging** | `unity-fix-errors` | Console analysis, stack trace investigation, and error resolution. |
| **Code Quality** | `unity-review-pr` | Automated GitHub PR reviews and standards analysis. |
| **Planning & Docs** | `unity-plan` | Requirement decomposition and implementation roadmap. |
| **Planning & Docs** | `unity-plan-review` | High-level decomposition audit and task list finalization. |
| **Planning & Docs** | `unity-plan-detail` | Detailed task investigation, code planning, and test design. |
| **Planning & Docs** | `unity-plan-brainstorm` | Refinement of task instructions with precise code changes. |
| **Implementation** | `unity-plan-executor` | Executing detailed engineering tasks from Documents/Tasks/. |
| **Planning & Docs** | `unity-write-tdd` | Technical Design Document (TDD) generation. |
| **Planning & Docs** | `unity-write-docs` | Architecture and API documentation. |
| **Code Investigation** | `unity-investigate-code` | Tracing complex execution flows and static analysis. |
| **Testing** | `unity-test` | Edit Mode and Play Mode automated test implementation. |
| **Fundamental Tools** | `unity-mcp-basics` | Mastering `unityMCP` capabilities for editor control. |
| **Skill Management** | `skill-creator` | Creating or updating specialized agent skills. |

## Routing Guidance

- **If the user asks "How do I implement...?"** -> Load `unity-plan` then `unity-implement-logic`.
- **If the user says "My game is slow."** -> Load `unity-optimize-performance`.
- **If the user says "Review this code."** -> Load `unity-review-pr`.
- **If the user has a console error.** -> Load `unity-fix-errors`.
- **If the user says "Create a tool for artists."** -> Load `unity-tech-art` or `unity-editor-tools`.
