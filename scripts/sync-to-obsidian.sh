#!/usr/bin/env bash
# sync-to-obsidian.sh — filesystem half of `sync`.
# One-way mirror of the repo bible/ into the Obsidian project folder.
# The repo is the source of truth; the Obsidian mirror is derived. Do not hand-edit the mirror.
#
# Project name is auto-derived from the repo directory name, so this works unedited
# for any project cloned from the template. Override with PROJECT_OBSIDIAN_DIR if needed.
#
# Usage: bash scripts/sync-to-obsidian.sh [--dry-run]
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT="$(basename "$REPO_ROOT")"
SRC="$REPO_ROOT/bible/"
DEST="${PROJECT_OBSIDIAN_DIR:-$HOME/Obsidian/zettelkasten/projects/$PROJECT}/bible/"

DRY=""
if [[ "${1:-}" == "--dry-run" ]]; then DRY="--dry-run"; fi

if [[ ! -d "$SRC" ]]; then
  echo "error: source bible not found at $SRC" >&2
  exit 1
fi

mkdir -p "$DEST"

if command -v rsync >/dev/null 2>&1; then
  # -a archive, --itemize-changes for a clear summary. No --delete: never remove
  # files that exist only in the mirror (the vault may add local notes).
  rsync -a --itemize-changes $DRY "$SRC" "$DEST"
else
  echo "rsync not found; falling back to cp -R" >&2
  [[ -z "$DRY" ]] && cp -R "$SRC". "$DEST" || echo "(dry-run: would cp -R $SRC -> $DEST)"
fi

count="$(find "$SRC" -type f | wc -l | tr -d ' ')"
echo "bible → obsidian mirror complete ($PROJECT): $count files"
echo "  src:  $SRC"
echo "  dest: $DEST"
