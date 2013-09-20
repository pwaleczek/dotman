#!/usr/bin/env bash

# wrapper function for dotman
export DOTMAN_DIR="$HOME/.dotman"

dotman() {
  local DOTMAN_DIR="$HOME/.dotman"
  local -a FUNCTIONS=(
    "install"
    "remove"
    "list"
    "update"
    "upgrade"
    "register"
    "init"
    "build"
    "publish"
    "unpublish"
    "help"
    "version"
  )
  local -a ARGS="$@"

  if [ ! "$1" ] || [[ ! "${FUNCTIONS[*]}" =~ (^|[^[:alpha:]])$1([^[:alpha:]]|$) ]]; then
    $DOTMAN_DIR/bin/help.sh
  else
    # run sub script with filtered arguments
    $DOTMAN_DIR/bin/$1.sh ${ARGS[@]/$1/}
  fi
}
