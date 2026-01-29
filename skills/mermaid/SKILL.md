---
name: mermaid
description: "Create visual diagrams with Mermaid.js. Use when: documenting logic flows, creating architecture diagrams, visualizing state machines, or mapping data structures."
---

# Mermaid Diagrams

Visualize systems with Mermaid.js syntax.

## Quick Examples

### Flowchart (Logic/Decision)
```mermaid
flowchart TD
    A[Start] --> B{Health > 0?}
    B -->|Yes| C[Continue]
    B -->|No| D[Game Over]
```

### Sequence (Communication)
```mermaid
sequenceDiagram
    Player->>+Server: Attack Request
    Server->>Server: Validate
    Server-->>-Player: Damage Result
```

### State (Transitions)
```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Running: Move Input
    Running --> Idle: Stop
    Running --> Jumping: Jump Input
```

### Class (Structure)
```mermaid
classDiagram
    class Player {
        +int Health
        +TakeDamage(int)
        +Heal(int)
    }
    Player --> HealthManager
```

## Workflow

1. **Analyze**: Identify entities and relationships, pick chart type
2. **Author**: Use patterns from [MERMAID_PATTERNS.md](references/MERMAID_PATTERNS.md)
3. **Validate**: Check syntax, verify accuracy
4. **Embed**: Wrap in ` ```mermaid ` code blocks

## Principles

- **Keep Simple**: Multiple small diagrams > one giant spaghetti
- **Top-Down**: Prefer `TD` or `LR` direction
- **Highlight Critical**: Use `classDef` for special entities (Singletons, external APIs)
- **Consistent Aliases**: Same participant names across all docs
