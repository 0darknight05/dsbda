#!/bin/bash

# --- Aesthetic Colors ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

PRAC_NUM=$1
BASE_DIR="./dsbda/pracs"

echo -e "${BLUE}Starting BiggieCheese's DSBDA Hardcoded Setup...${NC}"

# 1. Environment Check
if [ ! -f "./uv" ]; then
    tar -xf uv.tar.xz
fi
chmod +x ./uv
./uv sync --quiet
./uv run python -m ipykernel install --user --name dsbda --display-name "DSBDA-Venv" &> /dev/null

# 2. Hardcoded Path Mapping
declare -A PRACS
PRACS[1]="$BASE_DIR/pr1-data-wrangling/pr1-data-wrangling.ipynb"
PRACS[2]="$BASE_DIR/pr2-acacdemic-dataset/pr2-acacdemic-dataset.ipynb"
PRACS[3]="$BASE_DIR/pr3-central-tendency/pr3-central-tendency.ipynb"
PRACS[4]="$BASE_DIR/pr4-linear-regression/pr4-linear-regression.ipynb"
PRACS[5]="$BASE_DIR/pr5-social-networks/pr5-social-networks.ipynb"
PRACS[6]="$BASE_DIR/pr6-bayes/pr6-bayes.ipynb"
PRACS[7]="$BASE_DIR/pr7-token-lemma/pr7-token-lemma.ipynb"
PRACS[8]="$BASE_DIR/pr8-histogram/pr8-histogram.ipynb"
PRACS[9]="$BASE_DIR/pr9-box-plot/pr9-box-plot.ipynb"
PRACS[10]="$BASE_DIR/pr10-visualiazation/pr10-visualiazation.ipynb"

# Java Mappings
declare -A JAVA
JAVA[11]="$BASE_DIR/pr11-wordcount/wordcount.java"
JAVA[12]="$BASE_DIR/pr12-mapreduce/MapReduceLogProcessor.java"
JAVA[13]="$BASE_DIR/pr13-weather-data/weatherdata.java"

# 3. Execution Logic
if [ -z "$PRAC_NUM" ]; then
    echo -e "${CYAN}No number. Starting general Jupyter...${NC}"
    ./uv run jupyter notebook
elif [[ -n "${PRACS[$PRAC_NUM]}" ]]; then
    echo -e "${GREEN}Executing Python Practical $PRAC_NUM...${NC}"
    ./uv run jupyter notebook "${PRACS[$PRAC_NUM]}"
elif [[ -n "${JAVA[$PRAC_NUM]}" ]]; then
    echo -e "${GREEN}Executing Java Practical $PRAC_NUM...${NC}"
    firefox "https://www.programiz.com/java-programming/online-compiler/" &
    echo -e "${BLUE}Copy this code:${NC}"
    echo -e "------------------------------------"
    cat "${JAVA[$PRAC_NUM]}"
    echo -e "------------------------------------"
else
    echo -e "${RED}Error: Practical $PRAC_NUM not recognized.${NC}"
fi
