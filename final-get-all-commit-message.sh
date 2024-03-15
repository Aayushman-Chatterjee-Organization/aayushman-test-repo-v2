#!/bin/bash

# Export latest and previous version tags
export VERSION=$(git tag --sort=-version:refname | head -1)
export PREVIOUS_VERSION=$(git tag --sort=-version:refname | head -2 | tail -1)

# Export changes between the latest and previous version
export CHANGES=$(git log --no-merges --all --pretty="- %s" $PREVIOUS_VERSION...$VERSION)

# Initialize variables to store features and bugfixes
FEAT=""
FIX=""

# Loop through each change
while read -r change; do
    # Check if the change contains "feat"
    if [[ "$change" == *feat* ]]; then
        FEAT+="\n$change"
    # Check if the change contains "fix"
    elif [[ "$change" == *fix* ]]; then
        FIX+="\n$change"
    fi
done <<< "$CHANGES"

# Output the collected changes with separate sections for features and bugfixes
printf "# 🎁 Release notes (\`$VERSION\`)\n\n## 🎉 New Features\n$FEAT\n\n## 🐛 Bugfixes\n$FIX\n\n## Metadata\n\`\`\`\nThis version -------- $VERSION\nPrevious version ---- $PREVIOUS_VERSION\nTotal commits ------- $(echo "$CHANGES" | wc -l)\n\`\`\`\n" > release_notes.md
