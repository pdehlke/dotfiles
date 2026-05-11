#!/usr/bin/env bash

# This script ensures that uv installs required interpreters,
# sets up a virtual environment and syncs dependencies to the environment.
# It also activates the virtual environment in your shell.

PYTHON_VERSION=$(mise ls --local python 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" {print $2}')

[[ -z ${PYTHON_VERSION} ]] || USE_PYTHON="-p ${PYTHON_VERSION}"

layout_uv() {
	UV=$(which uv || true)
	if has mise; then
		UV=$(mise which uv || true)
	fi

	if [ -z "$UV" ]; then
		log_error "bin \`uv\` not found"
		return
	fi

	VIRTUAL_ENV="$(pwd)/.venv"
	export VIRTUAL_ENV

	PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
	if [ ! -f "$PYPROJECT_TOML" ]; then
		log_error "no \`$PYPROJECT_TOML\` found"
		log_status "creating a \`$PYPROJECT_TOML\` with \`uv\`"
		$UV init ${USE_PYTHON}
	fi

	if [ ! -d "$VIRTUAL_ENV" ]; then
		log_status "installing python interpreters with \`uv\`"
		$UV python install -q
		log_status "creating venv with \`uv\`"
		$UV venv .venv -q
	fi

	log_status "syncing venv with \`uv\`"
	$UV sync

	PATH_add "$VIRTUAL_ENV/bin"
}

layout_uv-package() {
	UV=$(which uv || true)
	if has mise; then
		UV=$(mise which uv || true)
	fi

	if [ -z "$UV" ]; then
		log_error "bin \`uv\` not found"
		return
	fi

	VIRTUAL_ENV="$(pwd)/.venv"
	export VIRTUAL_ENV

	PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
	if [ ! -f "$PYPROJECT_TOML" ]; then
		log_error "no \`$PYPROJECT_TOML\` found"
		log_status "creating a \`$PYPROJECT_TOML\` with \`uv init --package\`"
		$UV init ${USE_PYTHON} --package
	fi

	if [ ! -d "$VIRTUAL_ENV" ]; then
		log_status "installing python interpreters with \`uv\`"
		$UV python install -q
		log_status "creating venv with \`uv\`"
		$UV venv .venv -q
	fi

	log_status "syncing venv with \`uv\`"
	$UV sync

	PATH_add "$VIRTUAL_ENV/bin"
}

layout_uv-app() {
	UV=$(which uv || true)
	if has mise; then
		UV=$(mise which uv || true)
	fi

	if [ -z "$UV" ]; then
		log_error "bin \`uv\` not found"
		return
	fi

	VIRTUAL_ENV="$(pwd)/.venv"
	export VIRTUAL_ENV

	PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
	if [ ! -f "$PYPROJECT_TOML" ]; then
		log_error "no \`$PYPROJECT_TOML\` found"
		log_status "creating a \`$PYPROJECT_TOML\` with \`uv init --app\`"
		$UV init ${USE_PYTHON} --app
	fi

	if [ ! -d "$VIRTUAL_ENV" ]; then
		log_status "installing python interpreters with \`uv\`"
		$UV python install -q
		log_status "creating venv with \`uv\`"
		$UV venv .venv -q
	fi

	log_status "syncing venv with \`uv\`"
	$UV sync

	PATH_add "$VIRTUAL_ENV/bin"
}

layout_uv-lib() {
	UV=$(which uv || true)
	if has mise; then
		UV=$(mise which uv || true)
	fi

	if [ -z "$UV" ]; then
		log_error "bin \`uv\` not found"
		return
	fi

	VIRTUAL_ENV="$(pwd)/.venv"
	export VIRTUAL_ENV

	PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
	if [ ! -f "$PYPROJECT_TOML" ]; then
		log_error "no \`$PYPROJECT_TOML\` found"
		log_status "creating a \`$PYPROJECT_TOML\` with \`uv init --lib\`"
		$UV init ${USE_PYTHON} --lib
	fi

	if [ ! -d "$VIRTUAL_ENV" ]; then
		log_status "installing python interpreters with \`uv\`"
		$UV python install -q
		log_status "creating venv with \`uv\`"
		$UV venv .venv -q
	fi

	log_status "syncing venv with \`uv\`"
	$UV sync

	PATH_add "$VIRTUAL_ENV/bin"
}
