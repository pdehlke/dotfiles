#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# Run a command with privilege escalation when not already root.
_sudo() {
  if [ "$(id -u)" -eq 0 ]; then
    "$@"
  elif command -v sudo >/dev/null 2>&1; then
    sudo "$@"
  else
    "$@"
  fi
}

_install_via_mise() {
  echo "Installing chezmoi via mise" >&2
  mise use -g chezmoi@latest
}

_install_via_asdf() {
  echo "Installing chezmoi via asdf" >&2
  asdf plugin add chezmoi 2>/dev/null || true
  asdf install chezmoi latest
  asdf global chezmoi latest
}

_install_via_brew() {
  echo "Installing chezmoi via Homebrew" >&2
  brew install chezmoi
}

_install_via_apt() {
  echo "Installing chezmoi via apt" >&2
  _sudo apt-get install -y chezmoi
}

_install_via_dnf() {
  echo "Installing chezmoi via dnf" >&2
  # EPEL provides chezmoi on RHEL-family systems (not needed on Fedora).
  if [ -f /etc/redhat-release ] && ! grep -qi "fedora" /etc/redhat-release; then
    _sudo dnf install -y epel-release 2>/dev/null || true
  fi
  _sudo dnf install -y chezmoi
}

_install_via_apk() {
  echo "Installing chezmoi via apk" >&2
  _sudo apk add chezmoi
}

_install_via_pacman() {
  echo "Installing chezmoi via pacman" >&2
  _sudo pacman -S --noconfirm chezmoi
}

if ! chezmoi="$(command -v chezmoi 2>/dev/null)"; then
  if command -v mise >/dev/null 2>&1; then
    _install_via_mise
  elif command -v asdf >/dev/null 2>&1; then
    _install_via_asdf
  elif command -v brew >/dev/null 2>&1; then
    _install_via_brew
  elif command -v apt-get >/dev/null 2>&1; then
    _install_via_apt
  elif command -v dnf >/dev/null 2>&1; then
    _install_via_dnf
  elif command -v apk >/dev/null 2>&1; then
    _install_via_apk
  elif command -v pacman >/dev/null 2>&1; then
    _install_via_pacman
  else
    echo "No supported package manager found. Install chezmoi manually: https://chezmoi.io/install" >&2
    exit 1
  fi

  # Resolve the chezmoi binary. Tool managers may not have shims active yet
  # in the current shell, so check their canonical paths explicitly.
  if chezmoi="$(command -v chezmoi 2>/dev/null)"; then
    :
  elif command -v mise >/dev/null 2>&1 && chezmoi="$(mise which chezmoi 2>/dev/null)"; then
    :
  elif command -v asdf >/dev/null 2>&1; then
    _asdf_bin="$(asdf where chezmoi 2>/dev/null)/bin/chezmoi"
    if [ -x "${_asdf_bin}" ]; then
      chezmoi="${_asdf_bin}"
    else
      echo "chezmoi installed via asdf but binary not found at '${_asdf_bin}'" >&2
      exit 1
    fi
    unset _asdf_bin
  else
    echo "chezmoi was installed but is not in PATH. Ensure your package manager's bin directory is on PATH." >&2
    exit 1
  fi
fi

if [ -z "${ACT:+false}${CODESPACES:+false}${DEBIAN_FRONTEND:+false}" ]; then
  echo "Running interactive" >&2
  "${chezmoi}" init "--source=${script_dir}"
  "${chezmoi}" diff --verbose
  # shellcheck disable=SC3045,2162
  read -p 'Apply modifications? (y/n) ' r
  case "${r}" in
  y | Y | s | S)
    set -- apply --verbose "--source=${script_dir}"
    ;;
  *)
    set -- diff
    ;;
  esac
else
  set -- init --apply --verbose --source="${script_dir}" --no-pager
fi

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
exec "$chezmoi" "$@"
