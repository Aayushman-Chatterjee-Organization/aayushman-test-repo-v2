#!/bin/bash

echo "CHANGELOG"
echo ----------------------
# $TAG=v2.1.5

GIT_PAGER=cat git log --no-merges --format=" * %s" v2.6..HEAD

# FIRST=$(git tag -l | head -1)
# LATEST=$(git tag -l | head 1)
echo
# echo [$FIRST]
# echo [$LATEST]
# GIT_PAGER=cat git log --no-merges --format=" * %s" $FIRST
# GIT_PAGER=cat git log --no-merges --format=" * %s" $LATEST