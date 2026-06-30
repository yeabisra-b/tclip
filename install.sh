#!/bin/bash
set -e

URL="https://github.com/yeabisra-b/tclip/releases/download/v0.1.1/tclip"
TARGET_DIR="$HOME/.local/bin"
TARGET_FILE="$TARGET_DIR/tclip"

echo "Creating directory $TARGET_DIR if it doesn't exist..."
mkdir -p "$TARGET_DIR"

echo "Downloading tclip from GitHub..."
if command -v curl >/dev/null 2>&1; then
    curl -fLo "$TARGET_FILE" "$URL"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$TARGET_FILE" "$URL"
else
    echo "Error: Neither curl nor wget found. Please install one of them."
    exit 1
fi

echo "Making tclip executable..."
chmod +x "$TARGET_FILE"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
    echo ""
    echo "Warning: $TARGET_DIR is not in your PATH."
    echo "To use 'tclip' from anywhere, add the following line to your ~/.bashrc or ~/.zshrc file:"
    echo 'export PATH="$HOME/.local/bin:$PATH"'
    echo ""
else
    echo "$TARGET_DIR is already in your PATH."
fi

echo -e "\nInstallation complete! You can now use the 'tclip' command."
