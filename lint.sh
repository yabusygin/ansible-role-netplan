#!/bin/sh

set -o errexit

exit_handler() {
    if [ $? -ne 0 ]; then
        echo "Failure" >&2
    fi
}

ansible_lint_workaround_setup() {
    for scenario in "${@}"; do
        mkdir "molecule/${scenario}/roles/"
        ln -s ../../../ "molecule/${scenario}/roles/netplan"
    done
}

ansible_lint_workaround_teardown() {
    for scenario in "${@}"; do
        rm -r -f "molecule/${scenario}/roles/"
    done
}

ansible_lint_wrapper() {
    local molecule_scenarios="default"
    local ansible_lint_status

    set +o errexit

    # A workaround to bypass the "role was not found" error. See:
    # https://github.com/ansible/ansible-lint/issues/1329
    ansible_lint_workaround_setup ${molecule_scenarios}

    ansible-lint
    ansible_lint_status=$?

    ansible_lint_workaround_teardown ${molecule_scenarios}

    if [ ${ansible_lint_status} -ne 0 ]; then
        exit 1
    fi

    set -o errexit
}

trap exit_handler EXIT

echo "Running yamllint..."
yamllint .

echo "Running ansible-lint..."
ansible_lint_wrapper

echo "Running flake8..."
flake8 molecule/

echo "Success"
