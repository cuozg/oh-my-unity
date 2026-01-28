#!/bin/bash

# Script to trace usages of a specific method or field across the codebase
# Usage: ./trace_logic.sh [ClassName].[MethodName]

if [ $# -eq 0 ]; then
    echo "Usage: $0 [SearchPattern]"
    exit 1
fi

PATTERN=$1

echo "=== Tracing Usages of: $PATTERN ==="

# Find direct references (method calls, field access)
echo -e "\n--- Direct Code References ---"
grep -rn "$PATTERN" Assets/Scripts --include="*.cs" | grep -v "public class" | grep -v "public interface"

# Find event bindings in prefabs (if pattern is simple enough)
# Note: This is a best-effort check for string-based event bindings
if [[ $PATTERN != *"."* ]]; then
    echo -e "\n--- Potential Asset Bindings (Prefabs/Scenes) ---"
    grep -rl "$PATTERN" Assets --include="*.prefab" --include="*.unity" | head -n 10
fi

echo -e "\n=== Inheritance & Implementation Check ==="
# If searching for a class, find its heirs
if [[ $PATTERN != *"("* ]]; then
    CLEAN_NAME=$(echo $PATTERN | cut -d. -f1)
    grep -rn ":.*$CLEAN_NAME" Assets/Scripts --include="*.cs"
fi
