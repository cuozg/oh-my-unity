---
name: unity-fix-errors
description: "Diagnose and fix Unity errors. Use when: console shows compiler errors/exceptions, Play Mode is broken, build fails, or you need to generate debug reports in Documents/Debugs/."
---

# Unity Error Debugger

Systematic diagnosis and resolution of Unity technical issues.

## Common Fixes

| Error | Likely Cause | Quick Fix |
|:------|:-------------|:----------|
| `NullReferenceException` | Unassigned reference | Add null guard: `if (obj == null) return;` |
| `MissingReferenceException` | Destroyed object access | Check `this == null` after await |
| `IndexOutOfRangeException` | Array bounds | Validate index before access |
| `CS0246 type not found` | Missing using/assembly | Add `using` or reference .asmdef |
| `CS0103 name not found` | Typo or scope issue | Check spelling and variable scope |

## Debugging Workflow

1. **Gather Intel**
   ```
   read_console → Get exact error, stack trace, frequency
   ```
   Identify: script, line number, error type

2. **Investigate**
   - `view_file` around reported line
   - `grep_search` for all references to failing object
   - `mcpforunity://scene/gameobject/{id}/components` for runtime state

3. **Fix & Verify**
   - Apply fix via `script_apply_edits`
   - `refresh_unity(compile="request", wait_for_ready=true)`
   - `read_console` to confirm clear

4. **Runtime Test**
   - `manage_editor(action="play")` to verify in action
   - Ensure no regressions

5. **Document** (for complex issues)
   - Use `assets/templates/DEBUG_REPORT_TEMPLATE.md`
   - Save to `Documents/Debugs/DEBUG_[ErrorName]_[Timestamp].md`

## Tips

- **Stack Trace Priority**: Top of stack = immediate trigger
- **Clean Slate**: `refresh_unity` first to rule out stale state
- **Isolate**: Reproduce in empty test scene if systemic
