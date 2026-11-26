#!/usr/bin/env bash
set -euo pipefail

REPO="Mare02/t3-code-themes"
BRANCH="main"
DEST="${T3_THEMES_DIR:-$HOME/.t3/userdata/themes}"

usage() {
  echo "Usage: install.sh <theme> [<theme>...] | --all | --list"
}

[ $# -ge 1 ] || { usage; exit 1; }

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fsSL "https://codeload.github.com/$REPO/tar.gz/refs/heads/$BRANCH" | tar -xz -C "$tmp" --strip-components=1

available() {
  for d in "$tmp"/*/; do
    [ -n "$(ls "$d"*.json 2>/dev/null)" ] && basename "$d"
  done
}

case "$1" in
  --list) available; exit 0 ;;
  --all) set -- $(available) ;;
  -h|--help) usage; exit 0 ;;
esac

mkdir -p "$DEST"
for theme in "$@"; do
  if [ ! -d "$tmp/$theme" ]; then
    echo "Unknown theme: $theme (available: $(available | tr '\n' ' '))" >&2
    exit 1
  fi
  cp "$tmp/$theme"/*.json "$tmp/$theme"/*.jpg "$DEST"/ 2>/dev/null || cp "$tmp/$theme"/* "$DEST"/
  echo "Installed $theme -> $DEST"
done

echo "Open T3 Code -> Settings -> Appearance and select the theme."
