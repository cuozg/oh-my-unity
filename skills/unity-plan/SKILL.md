---
name: unity-plan
description: "Break down Unity features into implementation plans. Use when: analyzing requirements, decomposing work into Epics/Tasks, estimating effort, or defining technical roadmaps."
---

# Unity Planning

Transform requirements into structured implementation plans.

## Output Format

Save to `Documents/Plans/IMPLEMENTATION_PLAN_[FeatureName].md`

### Required Task Table
| # | Epic | Task | Description | Type | Cost | Note |
|:--|:-----|:-----|:------------|:----:|:----:|:-----|
| 1.1 | Player | Health System | Implement damage/heal | Logic | M | |
| 1.2 | Player | Death Handler | Respawn logic | Logic | S | Depends on 1.1 |
| 2.1 | UI | Health Bar | Display health | UI | S | |

**Types**: Logic, UI, Data, API, Asset, Test  
**Costs**: S (< 2h), M (2-8h), L (8-24h), XL (> 24h)

## Workflow

1. **Analyze**: Review requirements for functional goals and constraints
2. **Discover**: Run `scripts/investigate_feature.sh [Keywords]`, map dependencies
3. **Assess**: Check architecture compatibility, identify migration paths
4. **Decompose**: Break into Epics → Tasks (7-column format)
5. **Cost**: Assign T-shirt sizes, flag high-risk areas
6. **Document**: Use [IMPLEMENTATION_PLAN.md](assets/templates/IMPLEMENTATION_PLAN.md)
7. **Review**: Verify alignment with `.claude/rules/`

## Principles

- **Atomic Tasks**: Small, specific, testable
- **Honest Costing**: Realistic estimates for legacy systems
- **Plan Migration**: Safe paths for breaking changes
