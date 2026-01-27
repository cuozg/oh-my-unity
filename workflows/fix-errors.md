---
description: How to diagnose and fix Unity compiler or runtime errors.
---

# Workflow: Fix Unity Errors

Follow these steps when encountered with errors in the Unity Editor console.

1. **Read Console Logs**: Use `read_console` to get the latest errors.
   - Look for the file path and line number in the stack trace.
2. **Analyze the Script**: Use `view_file` to examine the code at the reported location.
3. **Check Context**: Use `grep_search` to see where the failing method or variable is used.
4. **Apply Fix**:
   - For simple fixes, use `apply_text_edits`.
   - For logic changes, consider `script_apply_edits`.
5. **Refresh Unity**: Call `refresh_unity` with `compile="request"` and `wait_for_ready=true`.
6. **Verify**:
   - Run `read_console` again to ensure the error is gone.
   - If it was a runtime error, enter Play Mode using `manage_editor` with action="play" and observe the behavior.

// turbo-all
7. **Clean up**: If unnecessary temporary files were created, delete them.
