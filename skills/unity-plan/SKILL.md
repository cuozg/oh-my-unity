---
name: unity-plan
description: "Plan Unity features. Use when: (1) Analyzing requirements, (2) Breaking work into Epics/Tasks, (3) Estimating effort, (4) Creating implementation roadmaps."
---

# Unity Planning

Transform requirements into structured implementation plans.

## Output Format

Save to `Documents/Plans/IMPLEMENTATION_PLAN_[FeatureName].md` using template from `assets/templates/`.

### Task Table (Required)
| # | Epic | Task | Description | Type | Cost | Note |
|:-:|:-----|:-----|:------------|:----:|:----:|:-----|
| 1.1 | Player | Health System | Add health component | Logic | M | Core feature |

**Types**: Logic, UI, Data, API, Asset, Test  
**Costs**: S, M, L, XL (T-shirt sizing)

## Workflow

1. **Analyze**: Review spec for goals and constraints
2. **Discover**: Run `.claude/skills/unity-plan/scripts/investigate_feature.sh [Keywords]`
3. **Assess**: Check if architecture supports feature without major debt
4. **Decompose**: Break into Epics → Tasks (7-column table)
5. **Cost**: Assign T-shirt sizes, highlight risks
6. **Document**: Use template, save to `Documents/Plans/`
7. **Review**: Verify alignment with `.claude/rules/`

## Best Practices

- **Atomic Tasks**: Small, specific, one responsibility
- **Honest Costing**: Be realistic about legacy complexity
- **Safe Migration**: Plan paths for breaking changes
