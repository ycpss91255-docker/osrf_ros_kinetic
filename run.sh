#!/usr/bin/env bash

set -euo pipefail

FILE_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

# Generate .env if not exists
if [[ ! -f "${FILE_PATH}/.env" ]]; then
    "${FILE_PATH}/docker_setup_helper/src/setup.sh" --base-path "${FILE_PATH}"
fi

# Load .env for xhost
set -o allexport
# shellcheck disable=SC1091
source "${FILE_PATH}/.env"
set +o allexport

# Run target: devel (default), runtime
TARGET="${1:-devel}"

# Allow X11 forwarding
xhost "+SI:localuser:${USER_NAME}" >/dev/null 2>&1 || true

docker compose -f "${FILE_PATH}/compose.yaml" \
    --env-file "${FILE_PATH}/.env" \
    run --rm "${TARGET}"
