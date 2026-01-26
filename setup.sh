#!/bin/bash
#
# Setup script for Obsidian plugin template
# This script replaces placeholders with your plugin's actual values
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Obsidian Plugin Template Setup${NC}"
echo "================================"
echo ""
echo "This script will configure the template for your plugin."
echo "Press Ctrl+C at any time to cancel."
echo ""

# Get current year as default
CURRENT_YEAR=$(date +%Y)

# Prompt for values with defaults
read -rp "Plugin ID (e.g., my-plugin): " PLUGIN_ID
if [ -z "$PLUGIN_ID" ]; then
    echo -e "${RED}Error: Plugin ID is required${NC}"
    exit 1
fi

read -rp "Plugin name (e.g., My Plugin): " PLUGIN_NAME
if [ -z "$PLUGIN_NAME" ]; then
    echo -e "${RED}Error: Plugin name is required${NC}"
    exit 1
fi

read -rp "Plugin description: " PLUGIN_DESCRIPTION
if [ -z "$PLUGIN_DESCRIPTION" ]; then
    echo -e "${RED}Error: Plugin description is required${NC}"
    exit 1
fi

read -rp "CSS prefix (default: ${PLUGIN_ID}): " PLUGIN_PREFIX
PLUGIN_PREFIX=${PLUGIN_PREFIX:-$PLUGIN_ID}

read -rp "Author name: " AUTHOR
if [ -z "$AUTHOR" ]; then
    echo -e "${RED}Error: Author name is required${NC}"
    exit 1
fi

read -rp "Author URL (e.g., https://github.com/username): " AUTHOR_URL
if [ -z "$AUTHOR_URL" ]; then
    echo -e "${RED}Error: Author URL is required${NC}"
    exit 1
fi

read -rp "Copyright year (default: ${CURRENT_YEAR}): " YEAR
YEAR=${YEAR:-$CURRENT_YEAR}

echo ""
echo -e "${YELLOW}Configuration summary:${NC}"
echo "  Plugin ID:          $PLUGIN_ID"
echo "  Plugin name:        $PLUGIN_NAME"
echo "  Plugin description: $PLUGIN_DESCRIPTION"
echo "  CSS prefix:         $PLUGIN_PREFIX"
echo "  Author:             $AUTHOR"
echo "  Author URL:         $AUTHOR_URL"
echo "  Year:               $YEAR"
echo ""

read -rp "Proceed with these values? (y/N): " CONFIRM
if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "Setup cancelled."
    exit 0
fi

echo ""
echo -e "${YELLOW}Replacing placeholders...${NC}"

# Files to process
FILES=(
    "package.json"
    "manifest.json"
    "LICENSE"
    "PLUGIN_README.md"
    "CLAUDE.md"
    "src/styles.src.css"
    ".github/workflows/publish.yml"
)

# Function to replace placeholders in a file
replace_in_file() {
    local file=$1
    if [ -f "$file" ]; then
        # Use | as delimiter to avoid issues with URLs containing /
        sed -i.bak \
            -e "s|{{PLUGIN_ID}}|${PLUGIN_ID}|g" \
            -e "s|{{PLUGIN_NAME}}|${PLUGIN_NAME}|g" \
            -e "s|{{PLUGIN_DESCRIPTION}}|${PLUGIN_DESCRIPTION}|g" \
            -e "s|{{PLUGIN_PREFIX}}|${PLUGIN_PREFIX}|g" \
            -e "s|{{AUTHOR}}|${AUTHOR}|g" \
            -e "s|{{AUTHOR_URL}}|${AUTHOR_URL}|g" \
            -e "s|{{YEAR}}|${YEAR}|g" \
            "$file"
        rm -f "${file}.bak"
        echo "  ✓ $file"
    else
        echo -e "  ${YELLOW}⚠ $file (not found, skipping)${NC}"
    fi
}

# Replace placeholders in each file
for file in "${FILES[@]}"; do
    replace_in_file "$file"
done

echo ""
echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Review the changes in the files listed above"
echo "  2. Replace README: rm setup.sh README.md && mv PLUGIN_README.md README.md"
echo "  3. Run 'yarn install' to install dependencies"
echo "  4. Run 'yarn dev' to build the plugin"
echo "  5. Initialize git: git init && git add . && git commit -m 'Initial commit'"
echo ""
