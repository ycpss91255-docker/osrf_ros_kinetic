#!/usr/bin/env bash

set -euo pipefail

FILE_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

usage() {
    cat >&2 <<'EOF'
Usage: ./build.sh [-h] [TARGET]

Targets:
  devel    Development environment (default)
  test     Run smoke tests
  runtime  Minimal runtime image
EOF
    exit 0
}

if [[ "${1:-}" =~ ^(-h|--help)$ ]]; then
    usage
fi

# Generate .env if not exists
if [[ ! -f "${FILE_PATH}/.env" ]]; then
    "${FILE_PATH}/docker_setup_helper/src/setup.sh" --base-path "${FILE_PATH}"
fi

# Build target: devel (default), test, runtime
TARGET="${1:-devel}"

docker compose -f "${FILE_PATH}/compose.yaml" \
    --env-file "${FILE_PATH}/.env" \
    build "${TARGET}"
