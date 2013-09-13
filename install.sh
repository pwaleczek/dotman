#!/usr/bin/env bash

DOTMAN_DIR="$HOME/.dotman"

printf "\e[0;34m      _       _                         \n"
printf "   __| | ___ | |_ _ __ ___   __ _ _ __  \n"
printf "  / _\` |/ _ \\| __| \'_ \` _ \\ / _\` | \'_ \\ \n"
printf " | (_| | (_) | |_| | | | | | (_| | | | |\n"
printf "  \\__,_|\___/ \\__|_| |_| |_|\__,_|_| |_|\e[0m\n\n"

if [ -d "$DOTMAN_DIR" ]; then
  printf "\e[0;33m***\e[0m dotman is already installed.\n"
  printf "\e[0;32m==>\e[0m Updating...\n"
  cd $DOTMAN_DIR
  OUT=$(git pull 2>&1)
  if [ "$?" != 0 ]; then
    printf "...\e[0;31msomething went wrong\e[0m. Here's the output:\n"
    echo "$OUT"
  else
    printf "\e[0;32m==>\e[0mDone!\n"
  fi
else
  printf "\e[0;32mInstalling dotman...\n"
  OUT=$(git clone https://github.com/pwaleczek/dotman.git $DOTMAN_DIR 2>&1)
  if [ "$?" != 0 ]; then
    printf "\e[0;31m!!!\e[0m Something went wrong. Here's the output:\n"
    echo "$OUT"
  else
    printf "\e[0;32m==>\e[0mDone!\n"
  fi
fi


if [ ! -z "$1" ]; then
  PROFILE="$1"
else
  if [ -f "$HOME/.bash_profile" ]; then
    PROFILE="$HOME/.bash_profile"
  elif [ -f "$HOME/.profile" ]; then
    PROFILE="$HOME/.profile"
  fi
fi

PROFILE_ADD="# load dotman\n[[ -s \"$DOTMAN_DIR/dotman.sh\" ]] && . \"$DOTMAN_DIR/dotman.sh\""

if [ -z "$PROFILE" ] || [ ! -f "$PROFILE" ]; then
  if [ -z $PROFILE ]; then
    printf "\e[0;31m!!!\e[0mNo \e[0;34m$HOME/.bash_profile\e[0m or \e[0;34m$HOME/.profile\e[0m found.\n"
  else
    printf "\e[0;31m!!!\e[0mNo \e[0;34m$PROFILE\e[0m found.\n"
  fi

  while true; do
    read -p "Do you want to create one? yes/no " answer
    case $answer in
      [Yy]* )
        printf "\e[0;32m==>\e[0m \e[0;34m$HOME/.bash_profile\e[0m created.\n"
        printf "\e[0;32m==>\e[0m Updating your new profile script..."
        printf "\n\n$PROFILE_ADD\n" >> "$HOME/.bash_profile"
        source $HOME/.bash_profile
        printf "\e[0;32m==>\e[0m And you're good to go!"
        
        exit;;
      [Nn]* )
        printf "\e[0;33m***\e[0m Ok, so do it on your own, like this:\n"
        printf "  touch \$HOME/.bash_profile\n"
        printf "  add this line:\n"
        printf "    $PROFILE_ADD\n\n"
        printf "  and reopen the terminal."
        printf "...\e[0;32mbye\e[0m!\n"

        exit;;
      * )
        printf "Can't hear you!\n";;
    esac
  done
fi

if ! grep -qc 'dotman.sh' $PROFILE; then
  printf "\e[0;32m==>\e[0m Updating your new profile script..."
  printf "\n$PROFILE_ADD\n" >> "$PROFILE"
  source $PROFILE
  printf "\n\e[0;32m==>\e[0m And you're good to go!\n"
else
  printf "\e[0;32m==>\e[0m Everything in your \e[0;34m$PROFILE\e[0m looks great!\n"
fi
