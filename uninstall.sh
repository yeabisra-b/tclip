#!/bin/bash
set -e

TARGET="$HOME/.local/bin/tclip"

if [ ! -f "$TARGET" ]; then
    echo "tclip is not installed at $TARGET."
    exit 0
fi

echo "Removing $TARGET..."
rm "$TARGET"

echo "tclip has been uninstalled."
