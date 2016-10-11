sudo find /srv/www/ -size +90k -name "*.php" -exec grep --with-filename '$_F=__FILE__;$_X=' {} \; | tee 2-infected
