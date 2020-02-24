#!/bin/bash

function abort {
  EXIT_VAL="$?"
  echo "ERROR: failed to execute '$BASH_COMMAND', line ${BASH_LINENO[0]}"
  exit "$EXIT_VAL"
}


function die {
  MESS="$1"
  EXIT_VAL="${2:-1}"
  echo 1>&2 "$MESS"
  exit "$EXIT_VAL"
}


function usage {
  EXIT_VAL="${1:-0}"
  MESS="$2"

#  [[ -z "$MESS" ]] || echo -e 1>&2 "$MESS\n"
#  SCRIPT="$(basename $0)"

  cat<<-EOF

	USAGE: $SCRIPT START_VALUE FINAL_VALUE ACTION[+:-]

	This script will start counting at the value START_VALUE and continue to END_VALUE 
	using either addition or subtraction for the value of ACTION.


	EOF

  [[ -z "$MESS" ]] || echo -e 1>&2 "$MESS\n"
  SCTIPT="$(basename $0)"

  exit "$EXIT_VAL" 
}

trap abort ERR


START=$1
TO=$2
ACTION=$3

[[ -z "$START" ]] && usage 1 "ERROR: Must pass in a starting value"
[[ -z "$TO" ]] && usage 1 "ERROR: Must pass in an ending value"
[[ -z "$ACTION" ]] && usage 1 "ERROR: Must pass in an opperation [add or subtract] (+/-)"


#die "I AM HERE!" 0

if [ $ACTION == "+" ] ; then

  while [ $START -le $TO ]
  do
  echo -n $START ""
  (( START++ ))
  sleep 1
  done
echo ""
else
  while [ $START -ge $TO ]
  do
  echo -n $TO ""
  (( TO++ ))
  sleep 1
  done
echo ""
fi
echo "last line"


