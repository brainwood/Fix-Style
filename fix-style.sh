#!/bin/bash

echo "Fixing style in current git directory from commit ${2:-HEAD} to ${1:-develop}."
FILESCHANGED=$(git diff-tree --no-commit-id --name-only -r ${2:-HEAD}..${1:-develop} | xargs -I {} php-cs-fixer fix {} | wc -l)
if [ $FILESCHANGED -gt 0 ]
	then

	git add -u
	git commit -m "Fixed Style"
fi