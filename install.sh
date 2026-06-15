#!/usr/bin/env bash
set -euo pipefail

# ANSI color codes
GREEN='\x1b[32m'
BLUE='\x1b[34m'
YELLOW='\x1b[33m'
RED='\x1b[31m'
RESET='\x1b[0m'

echo -e "${BLUE}ℹ Installing looksmith-cli globally...${RESET}"
if ! npm install -g looksmith-cli; then
  echo -e "${RED}✘ Failed to install looksmith-cli globally. Make sure you have npm installed and write permissions (or run with sudo).${RESET}"
  exit 1
fi
echo -e "${GREEN}✔ looksmith-cli installed successfully.${RESET}"

SKILL_DIR="${HOME}/.gemini/config/skills/looksmith-ops"
echo -e "${BLUE}ℹ Setting up Looksmith agent skill in ${SKILL_DIR}...${RESET}"
mkdir -p "${SKILL_DIR}"

# Copy the SKILL.md file
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "${SCRIPT_DIR}/SKILL.md" "${SKILL_DIR}/SKILL.md"
echo -e "${GREEN}✔ Agent skill SKILL.md copied successfully.${RESET}"

echo -e "${YELLOW}ℹ Checking API configuration...${RESET}"
if [ -z "${LOOKSMITH_API_KEY:-}" ] && [ ! -f "${HOME}/.config/looksmith/config.json" ]; then
  echo -e "${YELLOW}⚠ No Looksmith API key detected.${RESET}"
  echo -e "To configure it now, please run:"
  echo -e "  looksmith configure --key <your_api_key>"
else
  echo -e "${GREEN}✔ Looksmith API key detected!${RESET}"
fi

echo -e "\n${GREEN}✔ Installation complete! The 'looksmith-ops' skill is now available for your AI agents.${RESET}"
