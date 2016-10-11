#!/bin/sh -xe

sudo find /srv/www/ -size +7k -name '*.php' -exec grep --with-filename mralieaqhv {} \; | tee 1-infected

cat 1-infected | cut -d: -f1

