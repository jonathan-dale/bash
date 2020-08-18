#!/bin/bash

function testA {
echo "TestA $1"
}

function testB {
echo "TestB $2"
}

#"$@"

# check if function exists
if declare -f "$1" >&2 dev/null
  then
  ## call cmd line args
  "$@"
else
  # message
  echo "$1 is not a known function name" >&2
  exit 1
fi

