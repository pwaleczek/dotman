#!/usr/bin/env bash

# include
. ./bin/_variables.sh
. ./bin/_functions.sh

set -e

ARGS="$@"

# check for package list and update if necesary
#
check_dir $PACKAGES_DIR

# get available 'packages'
#
PACKAGES=("$(list_packages)")

# check if specified packages exist and tell about it
#
CHECKED_PACKAGES="$(check_packages 'ARGS[@]' 'PACKAGES[@]')"
AVAILABLE=($(echo "${CHECKED_PACKAGES[*]}" | awk 'NR==1'))
NOT_AVAILABLE=($(echo "${CHECKED_PACKAGES[*]}" | awk 'NR==2'))

if [ ${#NOT_AVAILABLE[@]} -ne 0 ]; then
  print_err "These packages could not be found:\n"
  printf "  ${NOT_AVAILABLE[*]}\n"

  if [ ${#AVAILABLE[@]} -eq 0 ]; then
    print_err "No available packages to install.\n"
    printf "Exiting... sorry!\n"

    exit
  else
    while true; do
      read -p "Do you want to install the rest? yes/no " answer
      case $answer in
        [Yy]* )
          break;;
        [Nn]* )
          printf "Ok, so exiting... bye!\n"

          exit;;
        * )
          print_warn "Can't hear you!\n";;
      esac
    done
  fi
fi

# TODO: check if already installed

# install
#
print_info "Installing packages:\n"
printf "  $AVAILABLE\n\n"
for package in "$AVAILABLE"; do
  print_info "Installing $package...\n"
done
