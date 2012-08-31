#!/bin/bash

watchfile=$1
watchfile_dir=`dirname $watchfile`
watchfile_base=`basename $watchfile`

shift
cmd=$@

while true; do
    change=$(inotifywait -e close_write,moved_to,create $watchfile_dir)
    change=${change#$watchfile_dir/ * }
    echo change: $change
    if [ "$change" = "$watchfile_base" ]; then
        eval $cmd
    fi
done
