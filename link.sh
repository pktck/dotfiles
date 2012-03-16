#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT=`basename $0`

for filename in `ls -A $DIR`; do
	if [ $filename != $SCRIPT ] && [ $filename != ".git" ]; then
		ln -s "$DIR/$filename" "$HOME/$filename";
	fi
done
