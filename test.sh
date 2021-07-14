#!/bin/bash

source abort_die_info.bash


function usage {
  EXIT_VAL="${1:-0}"
  MESS="$2"
  SCRIPT="$(basename $0)"

  cat<<-EOF


	USAGE: "$SCRIPT" is a dumb script, will not do anything important.
	        Checks for a directory named 'dogs' in ~/tmp/dogs


	EOF

  [[ -z "$MESS" ]] || echo -e 1>&2 "$MESS\n"
  exit "$EXIT_VAL"
}


trap abort ERR


echo "first line"

while getopts ":t:" opt; do
  case ${opt} in
    h )
      usage 1 "called help option"
      ;;
    t )
      echo "called option t"
      ;;
    * )
      usage 1 "Must pass in options"
      ;;
    : )
      echo "Invalad option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))


#usage 1 "TEST MESSAGE FOR USAGE"
#usage 1 


TEST_DIR=/home/desktop/tmp/dogs

# this one checks for TEST-DIR
[[ -d "$TEST_DIR" ]] || usage 1 "ERROR:   $TEST_DIR not found, create $TEST_DIR first"


# original WORKS
#[[ ! -d "$TEST_DIR" ]] && usage 1 "ERROR:   $TEST_DIR not found, create the dir first"
