#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="spec-driven-develop"
REPO_URL="https://github.com/zhu1090093659/spec_driven_develop"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
TARGET_DIR="$CODEX_HOME/skills/$SKILL_NAME"
SKILL_SUBPATH="plugins/spec-driven-develop/skills/$SKILL_NAME"

install_from_local() {
    local source_dir
    source_dir="$(cd "$(dirname "$0")/../$SKILL_SUBPATH" && pwd)"
    if [ ! -d "$source_dir" ]; then
        echo "Error: source directory not found: $source_dir"
        exit 1
    fi
    cp -r "$source_dir" "$TARGET_DIR"
}

install_from_remote() {
    local tmp_dir
    tmp_dir="$(mktemp -d)"
    trap 'rm -rf "$tmp_dir"' EXIT

    echo "Downloading from $REPO_URL ..."
    git clone --depth 1 --filter=blob:none --sparse "$REPO_URL" "$tmp_dir/repo" 2>/dev/null
    (cd "$tmp_dir/repo" && git sparse-checkout set "$SKILL_SUBPATH" 2>/dev/null)

    if [ ! -d "$tmp_dir/repo/$SKILL_SUBPATH" ]; then
        echo "Error: failed to download skill files."
        exit 1
    fi
    cp -r "$tmp_dir/repo/$SKILL_SUBPATH" "$TARGET_DIR"
}

if [ -d "$TARGET_DIR" ]; then
    echo "Skill '$SKILL_NAME' already exists at $TARGET_DIR"
    read -p "Overwrite? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    rm -rf "$TARGET_DIR"
fi

mkdir -p "$(dirname "$TARGET_DIR")"

if [ -f "$(dirname "$0")/../$SKILL_SUBPATH/SKILL.md" ] 2>/dev/null; then
    install_from_local
else
    install_from_remote
fi

echo "Installed '$SKILL_NAME' to $TARGET_DIR"
echo "Restart Codex to activate the skill."
