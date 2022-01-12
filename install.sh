#!/usr/bin/env bash

set -e # -e: exit on error

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$script_dir/bin"
  chezmoi="$bin_dir/chezmoi"
  echo "Installing chezmoi to $chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

if [ -z "CODESPACES" ]; then
  echo "Running chezmoi init"
  "$chezmoi" init "--source=$script_dir"
  "$chezmoi" diff --verbose
  read -p 'Apply modifications? (y/n) ' r
  case $r in
    y|Y|s|S)
      "$chezmoi" apply --verbose "--source=$script_dir"
      ;;
    *)
  esac
else
  # exec: replace current process with chezmoi
  exec "$chezmoi" init --apply --verbose "--source=$script_dir"
fi
