#!/bin/bash
touch README.md
for i in {1..15}
do
  echo "Commit #$i" >> README.md
  git add README.md
  day=$(( (RANDOM % 30) + 1 ))
  hour=$(( (RANDOM % 12) + 10 ))
  minute=$(( RANDOM % 60 ))
  second=$(( RANDOM % 60 ))
  date="2025-06-${day}T${hour}:${minute}:${second}"
  GIT_AUTHOR_DATE="$date" GIT_COMMITTER_DATE="$date" \
  git commit -m "Backdated commit #$i on $date"
  echo "Committed #$i with date $date"
done
