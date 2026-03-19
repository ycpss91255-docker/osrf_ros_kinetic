#!/usr/bin/env bash

set -euo pipefail

FILE_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

usage() {
    cat >&2 <<'EOF'
Usage: ./run.sh [-h] [-d|--detach] [--no-env] [TARGET]

Options:
  -h, --help     Show this help
  -d, --detach   Run in background (docker compose up -d)
  --no-env       Skip .env regeneration

Targets:
  devel    Development environment (default)
  runtime  Minimal runtime
EOF
    exit 0
}

# Parse arguments
SKIP_ENV=false
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
        --no-env)
            SKIP_ENV=true
            shift
            ;;
        *)
            TARGET="$1"
            shift
            ;;
    esac
done

# Generate / refresh .env
if [[ "${SKIP_ENV}" == false ]]; then
    "${FILE_PATH}/docker_setup_helper/src/setup.sh" --base-path "${FILE_PATH}"
fi

# Load .env for xhost
set -o allexport
# shellcheck disable=SC1091
source "${FILE_PATH}/.env"
set +o allexport

# Allow X11 forwarding
xhost "+SI:localuser:${USER_NAME}" >/dev/null 2>&1 || true

if [[ "${DETACH}" == true ]]; then
    docker compose -f "${FILE_PATH}/compose.yaml" \
        --env-file "${FILE_PATH}/.env" \
        down 2>/dev/null || true
    docker compose -f "${FILE_PATH}/compose.yaml" \
        --env-file "${FILE_PATH}/.env" \
        up -d "${TARGET}"
else
    docker compose -f "${FILE_PATH}/compose.yaml" \
        --env-file "${FILE_PATH}/.env" \
        run --rm "${TARGET}"
fi
