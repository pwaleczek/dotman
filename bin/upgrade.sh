#!/usr/bin/env bash

# include
. $DOTMAN_DIR/bin/_variables.sh
. $DOTMAN_DIR/bin/_functions.sh

print_info "Updating...\n"
cd $DOTMAN_DIR
OUT=$(git pull 2>&1)
if [ "$?" != 0 ]; then
  print_err "Something went wrong. Here's the output:\n"
  echo "$OUT"
else
  print_info "Done!\n"
fi