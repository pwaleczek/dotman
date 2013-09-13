#!/usr/bin/env bash

# include
. $DOTMAN_DIR/bin/_variables.sh
. $DOTMAN_DIR/bin/_functions.sh

printf "$BLUE      _       _                         \n"
printf "   __| | ___ | |_ _ __ ___   __ _ _ __  \n"
printf "  / _\` |/ _ \\| __| \'_ \` _ \\ / _\` | \'_ \\ \n"
printf " | (_| | (_) | |_| | | | | | (_| | | | |\n"
printf "  \\__,_|\___/ \\__|_| |_| |_|\__,_|_| |_|$NO_COLOR\n"
if [ "$1" != "logo" ]; then
  printf "  created by Pawel Waleczek <pawel@thisismyasterisk.org>\n\n"
  printf "Version? Managed by git.\n"
  printf "  $BLUEdotman upgrade$NO_COLOR for the latest.\n"
else
  printf "\n"
fi