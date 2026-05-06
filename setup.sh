#!/bin/bash

# --- Color setup for that hacker aesthetic ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Starting BiggieCheese's DSBDA Speedrun Setup...${NC}"

# 1. Extract uv if binary doesn't exist
if [ ! -f "./uv" ]; then
    echo -e "${GREEN}Extracting uv binary...${NC}"
    tar -xf uv.tar.xz
fi

# 2. Ensure execution permissions
chmod +x ./uv

# 3. Sync the environment
# This uses the uv.lock file to ensure you get the EXACT versions from home
echo -e "${GREEN}Syncing virtual environment (Hold tight)...${NC}"
./uv sync

# 4. Register the Kernel so Jupyter sees the venv
echo -e "${GREEN}Registering Jupyter Kernel...${NC}"
./uv run python -m ipykernel install --user --name dsbda --display-name "DSBDA-Venv"

echo -e "${BLUE}==========================================${NC}"
echo -e "${GREEN}SETUP COMPLETE!${NC}"
echo -e "${NC}Staring up jupyter notebook"
echo -e "${BLUE}./uv run jupyter notebook${NC}"
echo -e "${BLUE}==========================================${NC}"
./uv run jupyter notebook
