#!/usr/bin/env bash

set -e

if [[ -f PRFILE ]]; then
  touch PRFILE
  PR_NUMBER="$(<PRFILE)"
  gh pr close "$PR_NUMBER"
fi

RESULT="$(gh pr create --base static --head pr-1 --title "$(date +%s)" --body "")"
echo "$(echo "$RESULT" | grep github.com | cut -d / -f 7-)" | tee PRFILE
echo "$RESULT"
