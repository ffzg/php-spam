#!/bin/sh -e

path=$1

if [ ! -f "$path/wp-config.php" ] ; then
	echo "Usage: $0 /path/to/wordpress/"
	exit 1
fi

db=`grep DB_NAME $path/wp-config.php  | cut -d, -f2 | tr -d " ');"`

cat wp_wfLogins.sql | mysql $db | less -S
