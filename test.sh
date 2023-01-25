#!/bin/sh

# platform images
set -- \
    geerlingguy/docker-ubuntu2004-ansible:latest \
    geerlingguy/docker-ubuntu2204-ansible:latest

for image in "${@}"; do
    echo "Running Molecule tests for '${image}'..."
    TEST_IMAGE="${image}" molecule test --all
    if [ $? -ne 0 ]; then
        echo "Error: Molecule test failed" >&2
        exit 1
    fi
done

echo "Success: all tests are passed"
