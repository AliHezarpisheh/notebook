#!/usr/bin/env bash

set -e

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Files
MDFORMAT_ARG="${1:-.}"
MARKDOWNLINT_CLI2_ARG="${1:-**/*.md}"

echo -e "${GREEN}Executing mdformat...${NC}"
mdformat $MDFORMAT_ARG

echo -e "\n${GREEN}Executing markdownlint-cli2...${NC}"
npx markdownlint-cli2 $MARKDOWNLINT_CLI2_ARG "!./.venv/**" "!./node_modules/**"
