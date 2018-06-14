#!/bin/sh -e

path=$1

if [ ! -f "$path/wp-config.php" ] ; then
	echo "Usage: $0 /path/to/wordpress/"
	exit 1
fi

db=`grep DB_NAME $path/wp-config.php  | cut -d, -f2 | tr -d " ');"`

echo "# DB_NAME = $db"

cat wp_wfLogins.sql | mysql -t $db | tee /dev/shm/wp-logins.$db | less -S
