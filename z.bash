#!/bin/bash

function usage {
  EXIT_VAL="${1:-0}"
  MESS="$2"

  [[ -z "$MESS" ]] || echo -e 1>&2 "$MESS\n"
  SCRIPT="$(basename $0)"

  cat<<-EOF

	USAGE $SCRIPT [OPTIONS]

	here the ? holds the exit value of the most recent completed process and the : is the conditional operator
	so the value of be will be 10 if a<10 or 6 if a<100 or else 5


	EOF

  exit "$EXIT_VAL"
}


#usage 0 ## testing 
a=10
b=$(($a<10?10:$a<100?6:5))
echo "a = $a "
echo "now set b based on the value of a: where b = $ (( $ a<10?10: $ a<100?6:5))"
echo "and we see that b will be equal to 6"
echo "b = $b "
#exit 0




