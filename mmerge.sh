#!/bin/bash
# mmerge, version 1
# -----------------
# author: pat@daburu.net

# Run this script to merge your current branch with the 'master' branch.

BRANCH=`git rev-parse --abbrev-ref HEAD`
if [ $BRANCH == "master" ]; then
    echo You are already on the master branch.
else
    echo Checking out master...
    if git checkout master; then
        echo Pulling master...
        if git pull; then
            echo Checking out $BRANCH ...
            if git checkout $BRANCH; then
                echo Merging master...
                if git merge master; then
                    echo Pushing changes...
                    if git push; then
                        echo Done.
                    fi
                fi
            fi
        fi
    fi
fi