---
name: unity-write-tdd
description: "Generate Technical Design Documents for Unity features. Use when: formalizing implementation plans into specs, documenting architecture decisions, defining client/server logic, or specifying API/data architectures."
---

# Unity TDD Writer

Generate formal Technical Design Documents from implementation plans.

## Required Sections

1. **Overview**: Feature summary, goals, constraints
2. **Architecture**: System diagram, foundational assumptions
3. **Components**: Feature modules mapped from Epics/Tasks
4. **Performance**: Target FPS, memory budget, CPU constraints
5. **API Reference**: Endpoints, request/response formats
6. **Data Schema**: Blueprint/database changes
7. **Analytics**: Events to track, KPIs
8. **Error Handling**: Failure cases, offline behavior

## Workflow

1. **Source**: Load `Documents/Plans/IMPLEMENTATION_PLAN_[Feature].md` (run `/unity-plan` if missing)
2. **Architecture**: Document constraints (target FPS, memory, CPU budget)
3. **Components**: Map Epics → logical TDD components
4. **Detail**: UI lifecycle, asset loading (Addressables/Resources/Pooling), client-server
5. **Generate**: Use [UNITY_TDD_TEMPLATE.md](assets/templates/UNITY_TDD_TEMPLATE.md)
6. **Save**: `Documents/TDDs/TDD_[FeatureName].md`

## Output Example

```markdown
## 3. Performance Constraints

| Metric | Target | Risk |
|:-------|:-------|:-----|
| Frame Rate | 60 FPS | Particle system may spike |
| Memory | < 50MB | Large texture atlases |
| Load Time | < 2s | Addressables async load |
```

## Principles

- **Explicit Assumptions**: Never leave constraints undocumented
- **Mobile First**: Address low-end hardware risks
- **UI Lifecycle**: When is data populated? When refreshed?
- **Error Paths**: Document API failures and offline cases
