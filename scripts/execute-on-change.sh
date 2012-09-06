#!/bin/bash

watchfile=$1
watchfile_dir=`dirname $watchfile`
watchfile_base=`basename $watchfile`

shift
cmd=$@

while true; do
    change=$(inotifywait -e close_write,moved_to,create $watchfile_dir 2>/dev/null)
    change=${change#$watchfile_dir/ * }

    # inotifywait appends a tilda to the end of symlinks -- remove it
    change=`echo $change | sed s/~$//`

    if [ "$change" = "$watchfile_base" ]; then
        echo File changed, executing command: $cmd
        eval $cmd
        echo ...done!
    fi
done
