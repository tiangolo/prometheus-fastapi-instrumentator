# Frequently Asked Questions

<!--TOC-->

- [How to release a new version?](#how-to-release-a-new-version)
- [How to setup local dev environment?](#how-to-setup-local-dev-environment)
- [How to test the asdf bin scripts locally?](#how-to-test-the-asdf-bin-scripts-locally)

<!--TOC-->

## How to release a new version?

Push the default branch to remote and wait for the finish of the GitHub Actions
workflow "primary".

According to the rules of semantic versioning and conventional commits
a new version might be released. This is handled by semantic-release. Read
[`semantic-release.md`](semantic-release.md) for more information.

If a new version is released, edit the GitHub release notes to add anything
noteworthy beyond the automatically generated content. Also make sure to add
the same to the changelog. This last step is optional.

## How to setup local dev environment?

Ensure that [asdf](https://github.com/asdf-vm/asdf) is installed. It is used for
a few CLI tools that are executed automatically by pre-commit. You can skip this
step if you prefer to install the tools directly.

Install the required tools:

    asdf install

Read [`asdf.md`](asdf.md) for more information.

Ensure that [pre-commit](https://github.com/pre-commit/pre-commit) is installed.
Pre-commit is used for maintaing Git hooks used in this project.

Install the Git hooks with pre-commit:

    pre-commit install --install-hooks
    pre-commit install --hook-type commit-msg

Read [`pre-commit.md`](pre-commit.md) for more information.

Follow the usual Git workflow. Work on a dedicated branch instead of the trunk.

For developing the scripts it's recommened to set `LOGSH_LEVEL` env variable.

    export LOGSH_LEVEL=4

## How to test the asdf bin scripts locally?

Execute the following block of code in the root dir of this project.

    rm -rf tmp
    export LOGSH_LEVEL=4
    export ASDF_INSTALL_VERSION=0.9.4
    export ASDF_DOWNLOAD_PATH=$(pwd)/tmp
    export ASDF_INSTALL_TYPE=version
    export ASDF_INSTALL_PATH=$(pwd)/tmp

Now you can execute the bin scripts one by one.

    ./bin/list-all
    ./bin/download
    ./bin/install
