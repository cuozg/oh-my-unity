# oh-my-unity

AI agent configuration toolkit for Unity game development. Provides specialized skills, rules, and workflows for Claude and other AI assistants.

## ⚙️ Installation

```bash
# Clone into your Unity project root
git clone https://github.com/cuozg/oh-my-unity.git ./.claude
```

## 🚀 Quick Start

| Task | Command/Prompt |
|:-----|:---------------|
| Review a PR | "Review PR #25141 for performance issues" |
| Fix errors | `/unity-fix-errors` |
| Plan a feature | `/unity-plan` "Add player health bar to UI" |
| Investigate code | "How does the combat system work?" |

---

## 📁 Structure

```
.claude/
├── rules/          # Always-on constraints (conventions, standards)
├── skills/         # Specialized capabilities (22 skills)
└── workflows/      # Step-by-step procedures (11 workflows)
```

---

## 📜 Rules

Always-active constraints the agent must follow.

| Rule | Purpose |
|:-----|:--------|
| `agent-behavior.md` | Safety, proactivity, tool usage |
| `unity-csharp-conventions.md` | C# naming, architecture, Unity 6 patterns |
| `unity-asset-rules.md` | Folder structure, asset naming, optimization |

---

## 🛠️ Skills

Specialized capabilities organized by domain.

### Orchestration
| Skill | Use For |
|:------|:--------|
| `unity-orchestrator` | Routes all Unity requests to specialists |

### Implementation
| Skill | Use For |
|:------|:--------|
| `unity-implement-logic` | C# logic, gameplay systems, Unity 6 Awaitable |
| `unity-fix-errors` | Debug console errors, crashes, build failures |
| `unity-investigate-code` | Trace execution, understand features |
| `unity-optimize-performance` | FPS drops, memory leaks, profiling |
| `unity-test` | Edit/Play Mode tests with UTF |

### Planning Pipeline
| Skill | Use For |
|:------|:--------|
| `unity-plan` | Break features into Epics/Tasks |
| `unity-plan-review` | Audit and refine plans |
| `unity-plan-detail` | Create task skeletons |
| `unity-plan-brainstorm` | Technical deep-dive, code changes |
| `unity-plan-executor` | Execute task instructions |

### Documentation
| Skill | Use For |
|:------|:--------|
| `unity-write-docs` | READMEs, architecture docs, API refs |
| `unity-write-tdd` | Technical Design Documents |
| `mermaid` | Diagrams (flowcharts, sequence, state) |

### Platform & Deployment
| Skill | Use For |
|:------|:--------|
| `unity-mobile-deploy` | iOS/Android builds, native interop |
| `unity-web-deploy` | WebGL builds, JS interop |
| `unity-review-pr` | GitHub PR code reviews |

### Specialized
| Skill | Use For |
|:------|:--------|
| `unity-editor-tools` | Custom Editor windows, inspectors |
| `unity-tech-art` | Shaders, asset pipelines, PCG |
| `unity-mcp-basics` | Editor automation via unityMCP |
| `flatbuffers-coder` | FlatBuffers schemas, data tables |

---

## 🔄 Implementation Pipeline

```mermaid
graph LR
    A[Feature Request] --> B[unity-plan]
    B --> C[unity-plan-review]
    C --> D[unity-plan-detail]
    D --> E[unity-plan-brainstorm]
    E --> F[unity-plan-executor]
    F --> G[Feature Complete]
```

| Stage | Output |
|:------|:-------|
| `unity-plan` | Epics, tasks, cost estimates |
| `unity-plan-review` | Refined task list |
| `unity-plan-detail` | Task skeletons in `Documents/Tasks/` |
| `unity-plan-brainstorm` | Execution-ready code changes |
| `unity-plan-executor` | Implemented feature |

---

## 📝 Creating Skills

```
skills/<skill-name>/
├── SKILL.md           # Required: Instructions + frontmatter
├── scripts/           # Optional: Automation
├── references/        # Optional: Domain knowledge
└── assets/            # Optional: Templates
```

**SKILL.md frontmatter:**
```yaml
---
name: skill-name
description: "When to use this skill. Include ALL trigger conditions here."
---
```

---

## 🔧 Creating Rules

```yaml
---
trigger: always_on
glob: Human Readable Title
description: What this rule enforces.
---

## Rule content in Markdown...
```

---

## 📚 More Info

See `docs/` for detailed guides on creating agents, skills, and workflows.
