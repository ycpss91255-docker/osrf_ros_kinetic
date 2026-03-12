#!/usr/bin/env bash

set -euo pipefail

FILE_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

# Container name: defaults to IMAGE_NAME from .env
if [[ -f "${FILE_PATH}/.env" ]]; then
    set -o allexport
    # shellcheck disable=SC1091
    source "${FILE_PATH}/.env"
    set +o allexport
fi

CONTAINER="${IMAGE_NAME:-ros_noetic}"
CMD="${1:-bash}"

docker exec -it "${CONTAINER}" "${CMD}"
