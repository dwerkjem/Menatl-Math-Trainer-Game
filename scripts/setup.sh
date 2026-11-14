#!/usr/bin/env bash

# Initial variables
dependencies=true

# Constants
SCRIPT_DIRECTORY=$(dirname "$0")

# Use pushd NOTE: must use popd latter  
# push and popd are noisy so redirect stdout to dev null
pushd "$SCRIPT_DIRECTORY/.." > /dev/null || exit 3 # code 3 for

while getopts "dh" opt; do
  case "$opt" in
    d) dependencies=false ;;
    h) echo "Usage: $0 add usage string"; exit 0 ;;
    *) exit 1 ;;
  esac
done
shift $((OPTIND - 1))   # "$@" is now the non-option args

if "$dependencies"; then source "./scripts/check_deps.sh"; fi

# Check 

popd > /dev/null ||exit 3