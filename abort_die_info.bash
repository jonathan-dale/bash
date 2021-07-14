#!/bin/bash

abort() {
	EXIT_VAL="$?"
	echo "ABORT ERROR: exit code $EXIT_VAL occurred, failed to execute '$BASH_COMMAND' on line '${BASH_LINENO[0]}' "
	exit "$EXIT_VAL"
}


die() {
	MESS="$1"
	EXIT_VAL="${2:-1}"
	echo '[DIE] ' "$MESS" 1>&2
	exit "$EXIT_VAL"
}


info() {
        CALL_TIME=`date +%M%S`
        DIFF=`expr $CALL_TIME - $START_TIME`
	echo '[INFO]['$DIFF'] ' "$@"
}


# Stop execution on any error, call abort, include message
trap abort ERR

START_TIME=`date +%M%S`


## Only if the user needs to be root
# AM_I_ROOT=`id -u`
# [[ "$AM_I_ROOT" == 0 ]] || die "must be root to run this script..."
