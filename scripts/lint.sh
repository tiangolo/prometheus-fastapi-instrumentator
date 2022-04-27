#!/bin/sh

usage() {
  cat <<EOF
Lint project.
EOF
}

case $1 in -h|--help|help) usage && exit ;; esac

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_dir="$(dirname "$source_dir")"

. "$source_dir/main.sh"

# ------------------------------------------------------------------------------

set -eu

cd "$repo_dir"

loginfo "Execute Flake8."
poetry run flake8 --config .flake8 --statistics

loginfo "Execute MyPy."
poetry run mypy $project_name --allow-redefinition
