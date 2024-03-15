#!/bin/bash

if [ $(git show-ref --verify --quiet refs/remotes/origin/release_services_uat@v2.1.9 && echo 1) ]; then
            echo "[release_services_uat@v2.1.9] Branch exists"
            git checkout release_services_uat@v2.1.9 
            git pull origin release_services_uat@v2.1.9
            git add . 
            git commit -m "Updated UI Services Library"
            git push origin release_services_uat@v2.1.9
            # commit_id=$(git rev-parse HEAD)
            # git tag -a v2.1.9 $commit_id -m "v2.1.9 tag added"
            # git push origin v2.1.9
else
            echo "[release_services_uat@v2.1.9] Branch created"
            git checkout -b release_services_uat@v2.1.9
            git add .
            git commit -m "Updated UI Services Library" 
            git push origin release_services_uat@v2.1.9
            # commit_id=$(git rev-parse HEAD) 
            # git tag -a v2.1.9 $commit_id -m "v2.1.9 tag added"
            # git push origin v2.1.9 
fi 