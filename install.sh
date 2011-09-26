#!/bin/bash

DST_DIR=$HOME
DIR="$( dirname "$0" )"

exec 5<"$DIR"/filelist.txt
while read -u5 file; do
	original="$file"
	# skip empty lines
	[ -z "$original" ] && continue
	
	# normalize the filename (remote dot)
	[ "${file:0:1}" == "." ] && file="${file:1}"

	# copy file or create symlink
	cp -vi "$DIR/$file" "$DST_DIR/$original" 
done
exec 5<&-

