#!/usr/bin/env bash

# example script notice that BASH_SOURCE[0] is the how the script was called, usually ./test.sh
# but most of the time it's not the same as DIR.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BSZ=${BASH_SOURCE[0]}

#echo "DIR is (dirname \"{BASH_SOURCE[0]}\" ) expands to--->  $DIR "
#echo "BASH_SOURCE[0] is how this script was called, it expands to --->  $BSZ "


cat<<-EOF

        DIR is (dirname \"{BASH_SOURCE[0]}\" ) expands to--->  $DIR 
        BASH_SOURCE[0] is how this script was called, it expands to --->  $BSZ

EOF
