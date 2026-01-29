---
name: unity-optimize-performance
description: "Identify and fix Unity performance bottlenecks. Use when: FPS is low/inconsistent, memory usage is high/leaking, load times are slow, or auditing scripts/assets for performance risks."
---

# Unity Performance Optimizer

Diagnose and resolve performance issues across logic, graphics, and memory.

## Quick Detection Patterns

```bash
# Find expensive calls in hot paths
grep -r "GetComponent\|FindObjectOfType\|Find(" Assets/_Project/Scripts --include="*.cs" | grep -v "Awake\|Start\|OnEnable"

# Find allocations in Update
grep -rn "void Update\|void FixedUpdate\|void LateUpdate" -A 20 Assets/ --include="*.cs" | grep "new \|string \+\+"
```

## Common Fixes

| Issue | Detection | Fix |
|:------|:----------|:----|
| GetComponent in Update | Grep pattern above | Cache in Awake/Start |
| Find* methods | `FindObjectOfType`, `Find(` | Cache reference, use DI |
| Frequent Instantiate | Profiler: GC spikes | Object pooling |
| String concat | `+ ""` in loops | StringBuilder |
| Camera.main | Direct usage | Cache `_mainCamera` |
| Deep hierarchy | `manage_scene` hierarchy | Flatten structure |
| Large textures | Asset audit | Compress, reduce size |

## Optimization Workflow

1. **Baseline**: `manage_scene(action="get_hierarchy")` for object count, `read_console` for logs
2. **Detect**: Use grep patterns, asset search filters
3. **Fix**:
   - **Logic**: Cache refs, pool objects, use events instead of Update
   - **Assets**: Combine materials, simplify meshes, ASTC 6x6 compression
4. **Validate**: Play Mode, check frame timing, no visual regressions
5. **Document**: Update docs if architecture changed (`/unity-documentation`)

## Principles

- **Avoid Update**: Use events/reactive patterns when possible
- **Cache Everything**: Never call `GetComponent` or `Camera.main` in loops
- **Pool Frequent Objects**: Projectiles, VFX, UI elements
- **Mobile-First**: Optimize for mobile constraints (memory/thermals)
