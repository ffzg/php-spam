#!/bin/sh -xe

sudo find /srv/www/ -size +90k -name "*.php" -exec grep --with-filename '$_F=__FILE__;$_X=' {} \; | tee 2-infected

wc -l 2-infected
cat 2-infected | cut -d: -f1
