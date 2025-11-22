#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Executing mdformat...${NC}"
mdformat .

echo -e "\n${GREEN}Executing markdownlint-cli2...${NC}"
npx markdownlint-cli2 "**/*.md" "!./.venv/**" "!./node_modules/**"
