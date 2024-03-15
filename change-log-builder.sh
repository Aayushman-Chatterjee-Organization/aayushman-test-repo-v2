#!/usr/bin/env bash

previous_tag=0
for current_tag in $(git tag --sort=-creatordate)
do
if [ "$previous_tag" != 0 ];then
    tag_date=$(git log -1 --pretty=format:'%ad' --date=short ${previous_tag})
    echo "## ${previous_tag} (${tag_date})\n\n"
    git log ${current_tag}...${previous_tag} --pretty=format:'*  %s [View](https://github.com/Aayushman-Chatterjee-Organization/aayushman-test-repo-v2/commits/development)' --reverse | grep -v Merge
    echo "\n\n"
fi
previous_tag=${current_tag}
done