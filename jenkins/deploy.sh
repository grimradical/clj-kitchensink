#!/usr/bin/env bash

set -e
set -x

git fetch --tags

lein test
echo "Tests passed!"

lein release
echo "Release plugin successful, pushing changes to git"

git push origin `git rev-parse --abbrev-ref HEAD`
git push origin --tags `git rev-parse --abbrev-ref HEAD`

echo "git push successful."
