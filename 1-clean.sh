#!/bin/sh -e

cat 1-infected | while read line ; do
	file=`echo $line | cut -d: -f1`
	echo "# $file"
	perl -p -i -n -e 's/\Q<?php $mralieaqhv\E.*?;\s+\?>//' "$file"
done
