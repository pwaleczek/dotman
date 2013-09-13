#!/usr/bin/env bash

dotman() {
  local -a ARGS="$@"

  if [ ! "$1" ]; then
    printf "Do it like this:\n"
    printf "  dotman install <package> [version]\n"
    printf "  dotman remove <package> [version]\n"
    printf "  dotman list\n"
    printf "  dotman update [package]\n"
    printf "  dotman upgrade\n\n"
    printf "Register yourself:\n"
    printf "  dotman register <username>\n\n"
    printf "Manage your own packages:\n"
    printf "  dotman build <name> [directory]\n"
    printf "  dotman publish <package>\n"
    printf "  dotman unpublish <package>\n"
    return
  fi

  if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    printf "Help will go here\n"
    return
  fi

  # run sub script with filtered arguments
  ./bin/$1.sh ${ARGS[@]/$1/}

}
