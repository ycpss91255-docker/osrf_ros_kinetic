#!/usr/bin/env bash

set -euo pipefail

FILE_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

usage() {
    cat >&2 <<'EOF'
Usage: ./run.sh [-h] [-d|--detach] [TARGET]

Options:
  -h, --help     Show this help
  -d, --detach   Run in background (docker compose up -d)

Targets:
  devel    Development environment (default)
  runtime  Minimal runtime
EOF
    exit 0
}

# Generate .env if not exists
if [[ ! -f "${FILE_PATH}/.env" ]]; then
    "${FILE_PATH}/docker_setup_helper/src/setup.sh" --base-path "${FILE_PATH}"
fi

# Load .env for xhost
set -o allexport
# shellcheck disable=SC1091
source "${FILE_PATH}/.env"
set +o allexport

# Parse arguments
DETACH=false
TARGET="devel"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            usage
            ;;
        -d|--detach)
            DETACH=true
            shift
            ;;
        *)
            TARGET="$1"
            shift
            ;;
    esac
done

# Allow X11 forwarding
xhost "+SI:localuser:${USER_NAME}" >/dev/null 2>&1 || true

if [[ "${DETACH}" == true ]]; then
    docker compose -f "${FILE_PATH}/compose.yaml" \
        --env-file "${FILE_PATH}/.env" \
        up -d "${TARGET}"
else
    docker compose -f "${FILE_PATH}/compose.yaml" \
        --env-file "${FILE_PATH}/.env" \
        run --rm "${TARGET}"
fi
