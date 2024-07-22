#!/bin/bash
# Install and test steps on Linux
set -e
echo "starting docker wrap test"
# "python" and "pip" are already on the path as part of the docker
# startup code in choose_python.sh, but the following are required and not
# necessarily already set

PYTHON_EXE=${PYTHON_EXE:-python}
PIP_CMD=${PIP_CMD:-pip}
echo "python exe: $PYTHON_EXE"
echo "pip cmd: $PIP_CMD"
# Get needed utilities
MULTIBUILD_DIR=$(dirname "${BASH_SOURCE[0]}")
source $MULTIBUILD_DIR/common_utils.sh

# Change into root directory of repo
cd /io

# Configuration for this package in `config.sh`.
# This can overwrite `install_run` and `install_wheel` (called from
# `install_run`). These are otherwise defined in common_utils.sh.
# `config.sh` must define `run_tests` if using the default `install_run`.
CONFIG_PATH=${CONFIG_PATH:-config.sh}
source "$CONFIG_PATH"

echo "install run from docker"
install_run
echo "install run from docker done"
