#!/bin/bash

echo -e "\033[0;32mPushing generated website...\033[0m"

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Build the project.
jekyll build

# echo -e "\033[0;32mPush 'public' to '<username>.github.io'...\033[0m"
# Go To Public folder
cd _site
# Add changes to git.
git add .

git commit -m "$msg"

# Push source and build repos.
git push origin main -f

echo -e "\033[0;32mPushing source code...\033[0m"
# Come Back up to the Project Root
cd ..
git add .
git commit -m "$msg"
git push origin main -f
