#!/bin/bash

user=tejonaco

gh repo list $user --limit 1000 | while read -r repo _; do
    repoName=$(echo "$repo" | cut -d "/" -f 2)
    echo "https://github.com/$repo"
    if [ -d "$repoName" ]; then
        cd "$repoName"
        git pull
        cd ..
    else
        git clone "https://github.com/$repo"
    fi
done
