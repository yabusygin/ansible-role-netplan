#!/bin/sh

set -o errexit
set -o nounset

exit_handler() {
    if [ $? -ne 0 ]; then
        echo "Failure" >&2
    fi
}

trap exit_handler EXIT

echo "Running ansible-lint..."
ANSIBLE_ROLES_PATH="${MOLECULE_EPHEMERAL_DIRECTORY}/roles" \
ANSIBLE_COLLECTIONS_PATH="${MOLECULE_EPHEMERAL_DIRECTORY}/collections" \
ansible-lint \
    "${MOLECULE_PROJECT_DIRECTORY}" \
    "${MOLECULE_SCENARIO_DIRECTORY}"

echo "Success"
