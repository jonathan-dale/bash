#!/bin/bash

#set -e
trap abort ERR


function abort {
  EXIT_VAL="$?"
  echo "Aborting! ERROR: $EXIT_VAL occurred, failed to execute '$BASH_COMMAND', line ${BASH_LINENO[0]}"
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
  SCRIPT="$(basename $0)"

  cat<<-EOF

	USAGE: $SCRIPT run   (any argument will do)
	    
	    	
	    	This is a demenstration of bash trap.
	    	A bash trap allows you to execute a command when specific situation occurs.
	    	Situations that can be trapped include:
	    	- ERR		errors
	    	- EXIT		script exit 
	    	- SIGINT	interrupt signal 
	    	- SIGTERM	terminate signal
	    	- KILL		kill signal
	    
	    	We are using the function 'abort' to handle trap situations and errors
	    	To control the return status of a script use exit <status>
	    	To control the return status of a function use return <status>
	    	The return status of a function or script is the return status of the last executed statement.
		Use exit-on-error mode (set -e) in the script.
		Trap only the exit signals not the errors
		
	    
	    
	EOF
  [[ -z "$MESS" ]] || echo -e 1>&2 "$MESS\n"

  exit "$EXIT_VAL" 
}



[[ "$#" -ne 0 ]] || usage 1 "Must pass in some argument, anything will do..."
FIRST_ARG="$1"
echo "here is the first argument $FIRST_ARG"
trap abort ERR



echo "before badcommand"
badcommand
echo "After badcommand"


