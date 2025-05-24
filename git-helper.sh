#!/bin/bash

# Git Helper Script

usage() {
  echo "Usage: $0 {new-branch <branch-name> | tag <tag-name> | rollback <commit-hash>}"
  exit 1
}

if [ $# -lt 2 ]; then
  usage
fi

ACTION=$1
ARGUMENT=$2

case "$ACTION" in
  new-branch)
    git checkout -b "$ARGUMENT"
    ;;
  tag)
    git tag "$ARGUMENT"
    git push origin "$ARGUMENT"
    ;;
  rollback)
    git reset --hard "$ARGUMENT"
    git push --force
    ;;
  *)
    usage
    ;;
esac