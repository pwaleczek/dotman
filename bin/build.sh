#!/usr/bin/env bash

# include
. $DOTMAN_DIR/bin/_variables.sh 
. $DOTMAN_DIR/bin/_functions.sh 

set -e 

ARGS="$@"

# check if we have any arguments to process
#
if [ ${#ARGS[@]} -eq 0 ]; then
  print_warn "Give me a package to install.\n"
  exit 
fi

