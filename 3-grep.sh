#!/bin/sh -xe

sudo find /srv/www/ -size +12k -name '*.php' -exec grep --with-filename 'if(!isset($GLOBALS\["' {} \; | \
grep -v google-sitemap-generator/sitemap- | \
tee $0-infected

cat $0-infected | cut -d: -f1

