#!/bin/bash
set -e

FONT_NAME="JetBrainsMono"
FONT_DIR="$HOME/.local/share/fonts/$FONT_NAME"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/${FONT_NAME}.zip"
TMP_ZIP="/tmp/${FONT_NAME}.zip"

echo "Installing JetBrainsMono Nerd Font..."

# Create font directory
mkdir -p "$FONT_DIR"

# Download font
echo "Downloading..."
curl -fsSL "$DOWNLOAD_URL" -o "$TMP_ZIP"

# Extract
echo "Extracting..."
unzip -q "$TMP_ZIP" -d "$FONT_DIR"

# Remove non-font files (README, license, etc.)
find "$FONT_DIR" -type f ! -name "*.ttf" ! -name "*.otf" -delete

# Update font cache
echo "Updating font cache..."
fc-cache -fv "$FONT_DIR"

# Cleanup
rm -f "$TMP_ZIP"

echo "✅ JetBrainsMono Nerd Font installed to $FONT_DIR"
fc-list | grep -i "JetBrainsMono" | head -5
