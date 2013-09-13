#!/usr/bin/env bash

# helper functions
#

# print messages
#
#   @param message
#   @param type
#
print_err() {
  printf "$RED!!!$NO_COLOR $1"
}
print_warn() {
  printf "$YELLOW***$NO_COLOR $1"
}
print_info() {
  printf "$GREEN==>$NO_COLOR $1"
}
print_color() {
  printf "$1$2$NO_COLOR"
}

# chech if we are good to go
#
check_dir() {
  if [ ! -f $1 ]; then
    print_color $BLUE "Looks like you're using dotman for the first time!\n"
    printf "Setting up directories...\n"
    mkdir -p $1
    print_info "Created \"$1\"\n" info
    cd $1
    printf "OK\n"
    #echo $OUT
    #exit
    #curl -o ~/.dotfiles/packages.list "http://dots.thisismyasterisk.org/packages.list" > /dev/null
    
    curl --progress-bar -O http://static.thisismyasterisk.org/packages.list > $PACKAGES_DIR/packages.list

  fi
}

# list available packages
#
list_packages() {
  local -a PACKAGES
  #echo $(ls -d $PACKAGES_DIR/*/)
  for package in $(ls -d $PACKAGES_DIR/*/); do
    name=${package%%/}
    PACKAGES=("${PACKAGES[@]}" "${name/$PACKAGES_DIR\//}")
  done
  echo ${PACKAGES[*]}
}

check_packages() { 
  local -a ARGS=("${!1}")
  local -a PACKAGES=("${!2}")
  local -a AVAILABLE
  local -a NOT_AVAILABLE

  for arg in $ARGS; do
    for package in $PACKAGES; do
      if [ "$package" == "$arg" ]; then
        AVAILABLE=("${AVAILABLE[@]}" "$arg")
      fi
    done
  done

  NOT_AVAILABLE=(${ARGS[@]/${AVAILABLE[*]}/})

  echo "${AVAILABLE[*]}"
  echo "${NOT_AVAILABLE[*]}"
}

# download package
# 
get_package() {
  cd $PACKAGES_DIR
} 
