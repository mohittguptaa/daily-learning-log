#!/usr/bin/env bash
# Usage: scripts/daily.sh <notes-dir>
# Each subdirectory of <notes-dir> becomes one PR; each .md file inside it becomes one commit.
set -euo pipefail
cd "$(dirname "$0")/.."
src=$1
today=$(date +%F)
git checkout -q main && git pull -q
for pr in "$src"/*/; do
  topic=$(basename "$pr")
  branch="$today-$topic"
  git checkout -qb "$branch"
  mkdir -p "logs/$today"
  for f in "$pr"*.md; do
    cp "$f" "logs/$today/$topic-$(basename "$f")"
    title=$(head -1 "$f" | sed 's/^# *//')
    echo "| $today | $title |" >> README.md
    git add . && git commit -qm "$title" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
  done
  for t in 1 2 3; do git push -qu origin "$branch" 2>/dev/null && break; sleep 5; done
  url=$(gh pr create -t "$today: $topic" -b "Daily learning notes on $topic." -B main -H "$branch")
  gh pr merge "$url" --merge --delete-branch >/dev/null
  git checkout -q main && git pull -q
  echo "merged $url ($(ls "$pr"*.md | wc -l) commits)"
done
