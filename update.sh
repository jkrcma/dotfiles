#!/bin/bash

SRC_DIR=$HOME
DIR="$( dirname "$0" )"

cat $DIR/filelist.txt | while read file; do
	original="$file"
	# we support only files
	[ ! -f "$SRC_DIR/$original" ] && continue

	# normalize the filename (remote dot)
	[ "${file:0:1}" == "." ] && file="${file:1}"

	# create parent directories if any
	mkdir -p "$( dirname "$DIR/$file" )" 2>/dev/null

	# copy file
	cp -a "$SRC_DIR/$original" "$DIR/$file"

	# add to git
	git add "$DIR/$file"

	echo "Copied $original"
done

