#!/bin/bash

# Simple script to investigate a project base for planning a feature
# Usage: ./investigate_feature.sh [keyword1] [keyword2] ...

if [ $# -eq 0 ]; then
    echo "Usage: $0 [keyword1] [keyword2] ..."
    exit 1
fi

KEYWORDS=$@

echo "=== Investigating Keywords: $KEYWORDS ==="

for KEYWORD in $KEYWORDS; do
    echo -e "\n--- Finding scripts related to: $KEYWORD ---"
    grep -rl "$KEYWORD" Assets/Scripts --include="*.cs" | head -n 10
    
    echo -e "\n--- Finding prefabs related to: $KEYWORD ---"
    find Assets -name "*$KEYWORD*.prefab" | head -n 5
done

echo -e "\n=== Potentially Relevant Classes (Public API) ==="
for KEYWORD in $KEYWORDS; do
    grep -r "public class.*$KEYWORD" Assets/Scripts --include="*.cs" | sed 's/.*public //' | head -n 5
done

echo -e "\n=== Search Summary ==="
echo "Total relevant scripts found: $(grep -rl "$KEYWORDS" Assets/Scripts --include="*.cs" | wc -l)"
