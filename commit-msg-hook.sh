#!/bin/sh

# Create a regex for a conventional commit.
conventional_commit_regex="^\(build\|chore\|ci\|docs\|feat\|fix\|perf\|refactor\|revert\|style\|test\)(\([a-zA-Z]\+-[0-9 \-]\+\))?!\?: .\+$"

# Get the commit message (the file path is passed as $1).
commit_message="$(cat "$1")"

echo "Commit message identified as: $commit_message"

# Check if the message matches the regex
echo "$commit_message" | grep -Eq "$conventional_commit_regex"
if [ $? -eq 0 ]; then
  echo "Commit message meets Conventional Commit standards."
  exit 0
fi

# Not a conventional commit – print error and example
echo "\033[31m Commit message does not meet the Conventional Commit standard\033[0m"
echo " Example of a valid message is:"
echo " feat(login): add the 'remember me' button"
echo " More details at: https://www.conventionalcommits.org/en/v1.0.0/#summary"
exit 1
