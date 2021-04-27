#!/bin/bash

function abort {
	EXIT_VAL="$?"
	echo "ABORT ERROR: exit code $EXIT_VAL occured, failed to execute '$BASH_COMMAND' on line '${BASH_LINENO[0]}' "
	exit "$EXIT_VAL"
}


function die {
	MESS="$1"
	EXIT_VAL="${2:-1}"
	echo '[DIE] ' "$MESS" 1>&2
	exit "$EXIT_VAL"
}


function info {
        CALL_TIME=`date +%M%S`
        DIFF=`expr $CALL_TIME - $START_TIME`
	echo '[INFO]['$DIFF'] ' "$@"
}

#Stop execution on any error, call abort, include message
trap abort ERR

START_TIME=`date +%M%S`

AM_I_ROOT=`id -u`
## comment for easy testing
[[ "$AM_I_ROOT" == 0 ]] || die "must be root to run this script..."


echo "START_TIME VALUE IS = '$START_TIME'"
echo "sleeping 2 sec"
sleep 2
info "waited 2 sec...."
sleep 2
info "sleep 2 more..."
sleep 3
info "sleep 3 more..."
sleep 4
info "sleep 4 more..."
echo "done"
