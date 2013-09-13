#!/usr/bin/env bash

case $1 in
  install)
    
  ;;
  usage | "")
    printf "Do it like this:\n"
    printf "  dotman install <package> [version]    Install package\n"
    printf "  dotman remove <package> [version]     Uninstall package\n"
    printf "  dotman list                           List available packages\n"
    printf "  dotman update [package]               Update package[s]\n"
    printf "  dotman upgrade                        Upgrade dotman\n"
    printf "  dotman help [command]                 Display help\n"
    printf "  dotman version                        Display version\n\n"
    printf "Register yourself:\n"
    printf "  dotman register <username>            Register to supply a package\n\n"
    printf "Manage your own packages:\n"
    printf "  dotman status <package>               Check your package's status\n"
    printf "  dotman publish <package>              Publish your package\n"
    printf "  dotman unpublish <package>            Remove your package\n"
  ;;
esac
