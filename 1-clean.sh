#!/bin/sh -e

while read file ; do
	echo "# $file"
	perl -p -i -n -e 's/\Q<?php $mralieaqhv\E.*?;\s+\?>//' $file
done
