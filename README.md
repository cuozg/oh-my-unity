# Unity Agent Configuration

This directory contains configuration files for AI agents (like Google Antigravity) to work effectively with this Unity project.

## 📁 Directory Structure

```
.agent/
├── README.md           # This file
├── agents/             # Agent definitions (orchestrators, core, specialized)
├── docs/               # Documentation on creating agents and best practices
├── rules/              # Project-wide rules agents must follow
├── skills/             # Specialized capabilities for agents
└── workflows/          # Step-by-step procedures for common tasks
```

---

## 📜 Rules

**Location**: `.agent/rules/`

Rules are **always-on** constraints that the agent must follow during every interaction. They define coding standards, asset conventions, and behavioral expectations.

### Current Rules

| File | Description |
|------|-------------|
| `agent-behavior.md` | How the agent should interact: safety, proactivity, tool mastery. |
| `unity-csharp-conventions.md` | C# naming, architecture (SOLID, ScriptableObjects), and performance. |
| `unity-asset-rules.md` | Folder structure, asset naming, and optimization for textures/models. |

### How to Add a Rule

1.  Create a new `.md` file in `.agent/rules/`.
2.  Add YAML frontmatter:
    ```yaml
    ---
    trigger: always_on
    glob: Human Readable Title
    description: What this rule enforces.
    ---
    ```
3.  Write the rule content in Markdown.

---

## 🛠️ Skills

**Location**: `.agent/skills/`

Skills are **specialized capabilities** that extend the agent's expertise. Each skill lives in its own folder and contains a `SKILL.md` file with instructions, plus optional helper scripts.

### Current Skills

| Skill | Description |
|-------|-------------|
| `unity-mcp-basics/` | Core knowledge for using the `unityMCP` toolset (GameObjects, Components, Scenes). |
| `unity-technical-lead/` | High-level project coordination, architecture planning, and budgeting. |
| `unity-pr-reviewer/` | Automate GitHub PR reviews with inline, severity-tagged comments. |

### Skill Folder Structure

```
skills/<skill-name>/
├── SKILL.md           # Main instructions with YAML frontmatter
├── scripts/           # (Optional) Helper bash/python scripts
└── examples/          # (Optional) Reference implementations
```

### How to Create a Skill

1.  Create a folder: `.agent/skills/<your-skill-name>/`.
2.  Add a `SKILL.md` file with:
    ```yaml
    ---
    name: your-skill-name
    description: A concise description of the skill.
    ---
    # Your Skill Name

    Detailed instructions for the agent...
    ```

---

## 🔄 Workflows

**Location**: `.agent/workflows/`

Workflows are **step-by-step procedures** for complex, repetitive tasks. They can be invoked with a slash command (e.g., `/fix-errors`).

### Current Workflows

| Command | Description |
|---------|-------------|
| `/fix-errors` | Diagnose and fix Unity compiler or runtime errors. |
| `/optimize-performance` | Identify and resolve performance bottlenecks. |
| `/review-pr` | Conduct a full code review on a GitHub Pull Request. |

### How to Create a Workflow

1.  Create a new `.md` file: `.agent/workflows/<your-workflow>.md`.
2.  Add YAML frontmatter with a description:
    ```yaml
    ---
    description: What this workflow does.
    ---
    ```
3.  Write numbered steps. Use `// turbo` above a step to auto-run it, or `// turbo-all` anywhere to auto-run all steps.

---

## 🤖 Agents

**Location**: `.agent/agents/`

Agents are specialized AI personas designed for specific roles in game development. They are organized into categories:

-   **`orchestrators/`**: High-level coordinators (e.g., `unity-tech-lead`).
-   **`core/`**: Cross-cutting concerns (Performance, Build, QA, Code Review).
-   **`specialized/`**: Domain experts (Graphics, Networking, Animation).
-   **`platforms/`**: Platform-specific agents (Mobile, VR).
-   **`universal/`**: Non-Unity roles (Game Design, Audio).

See `.agent/docs/creating-agents.md` for how to create a new agent.

---

## 🚀 Quick Start

1.  **Ask for a review**: *"Review PR #25141 for performance issues."*
2.  **Fix errors**: *"/fix-errors"*
3.  **Create a feature**: *"Add a player health bar to the UI."* (Agent will use rules and skills automatically).

For more details, see the files in `.agent/docs/`.
