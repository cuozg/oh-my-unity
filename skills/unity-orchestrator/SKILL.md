---
name: unity-orchestrator
description: "Master Unity technical lead. Use for ALL Unity requests. Analyzes prompts, routes to specialized skills (logic, art, performance, mobile, PR review, debugging), and coordinates multi-step implementations."
---

# Unity Orchestrator

Route tasks to specialized skills and coordinate complex implementations.

## Quick Routing

| User Says | Load Skill(s) |
|:----------|:--------------|
| "Review PR #X" | `unity-review-pr` |
| "Fix this error/crash" | `unity-fix-errors` → `unity-investigate-code` |
| "Implement [feature]" | `unity-plan` → `unity-plan-review` → `unity-plan-detail` → `unity-plan-brainstorm` → `unity-plan-executor` |
| "Game is slow/laggy" | `unity-optimize-performance` |
| "Android/iOS issue" | `unity-mobile-deploy` |
| "WebGL problem" | `unity-web-deploy` |
| "Create editor tool" | `unity-editor-tools` |
| "Shader/art pipeline" | `unity-tech-art` |
| "Write tests" | `unity-test` |
| "Write TDD/docs" | `unity-write-tdd` or `unity-write-docs` + `mermaid` |
| "Add data table" | `flatbuffers-coder` |
| "Explain how X works" | `unity-investigate-code` |

For full catalog, see [SKILL_CATALOG.md](references/SKILL_CATALOG.md).

## Protocol

1. **Route**: Match intent to skill(s), state which you're loading
2. **Delegate**: Adopt specialist's workflow and best practices
3. **Verify**: Check result against original goal

For multi-step coordination patterns, see [ORCHESTRATION_PATTERNS.md](references/ORCHESTRATION_PATTERNS.md).

## Guiding Principles

- **Performance First**: Consider frame rate impact
- **Safety First**: Non-destructive operations, verify before execution
- **Tool Mastery**: Use `unityMCP` for Editor tasks
- **Document "Why"**: Explain architectural decisions
