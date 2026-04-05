# Force everyone to use the correct python
if ! PYENV_ROOT=$(pyenv root 2>/dev/null); then
  PYENV_ROOT="${HOME}/.pyenv"
fi

function check_py_prereq() {
  if ! type -p python3 >/dev/null; then
    log fatal "python3 not installed. Maybe try 'brew install python'?"
  fi
  if ! type -p pyenv-virtualenv >/dev/null; then
    log fatal "pyenv-virtualenv not installed. Maybe try 'brew install pyenv-virtualenv'?"
  fi
}

function setup_venv() {
  SOURCE_VERSION="$1"
  VENV_NAME="$2"
  check_py_prereq
  if ! [ -d "${PYENV_ROOT}/versions/${SOURCE_VERSION}" ]; then
    log warning "Python version ${SOURCE_VERSION} is not yet installed; installing..."
    pyenv install "${SOURCE_VERSION}"
  fi
  if ! [ -f "${PYENV_ROOT}/versions/${VENV_NAME}/bin/activate" ]; then
    log info "Setting up python environment"
    pyenv virtualenv "${SOURCE_VERSION}" "${VENV_NAME}"
  fi
}

function py3() {
  if command -pv deactivate >/dev/null; then
    # shellcheck disable=SC1091
    source deactivate || deactivate
  fi
  if ! [ -d "${PYENV_ROOT}/versions/${PYTHON_3_VERSION}/envs/py3" ]; then
    setup_venv "${PYTHON_3_VERSION}" py3
  fi
  log info "Switching python environment to python ${PYTHON_3_VERSION} (${PYENV_ROOT}/versions/py3)"
  echo 'py3' >~/.python-version
}

function pydefault() {
  if [ -z "${DEFAULT_PYENV_VIRTUALENV}" ]; then
    log error "Env var DEFAULT_PYENV_VIRTUALENV unset, so I don't know what to do"
    return
  fi
  if [ "${PYENV_VERSION}" = "${DEFAULT_PYENV_VIRTUALENV}" ]; then
    # nothing to do here
    return
  fi
  log debug "Switching to default python virtualenv: ${DEFAULT_PYENV_VIRTUALENV}"
  /bin/rm -f ~/.python-version
  echo "${DEFAULT_PYENV_VIRTUALENV}" >~/.python-version
}

function ensure_venv() {
  setup_venv "${PYTHON_3_VERSION}" py3
}

function repy() {
  if [ "$1" = "--nuke" ]; then
    rm -rf "${PYENV_ROOT}"
    pyenv_init
  fi
  log info "resetting python virtualenvs"
  rm -rf "${PYENV_ROOT}/versions/py3"
  rm -rf "${PYENV_ROOT}/versions/${PYTHON_3_VERSION}/envs/py3"
  ensure_venv
}

function pyenv_init() {
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

function pyenv_import_brew() {
  rm -f "${PYENV_ROOT}/versions/*-brew"
  CELLAR="$(brew --cellar)"

  if [ -d "${CELLAR}/python" ]; then
    for i in "${CELLAR}"/python/*; do
      ln -sf "$i" "${HOME}/.pyenv/versions/${i##/*/}-brew"
    done
  fi

  if [ -d "${CELLAR}/python@2" ]; then
    for i in "${CELLAR}"/python@2/*; do
      ln -sf "$i" "${HOME}/.pyenv/versions/${i##/*/}-brew"
    done
  fi

  if [ -d "${CELLAR}/python@3" ]; then
    for i in "${CELLAR}"/python@3/*; do
      ln -sf "$i" "${HOME}/.pyenv/versions/${i##/*/}-brew"
    done
  fi
}

PYTHON_3_VERSION="${PYTHON_3_VERSION:-"3.9.1"}"
. "${HOME}/.pyversion"

# . "${PYENV_ROOT}/completions/pyenv.zsh"

# make sure our python environments are up to date
pyenv_init

# I have never been happier to dump a piece of software than I am
# to have dumped cassandra version 3
#
# We need python2 for cqlsh until we move to cassandra 4 :()
# setup_venv 2.7.18 py2

ensure_venv
# activate the current default python virtualenv
pydefault
