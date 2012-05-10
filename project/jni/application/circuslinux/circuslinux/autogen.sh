#!/bin/bash
#
# autogen.sh for circuslinux
#
# Requires: automake, autoconf, dpkg-dev
set -e

# Refresh GNU autotools toolchain.
aclocal
automake --foreign

# The automake package already links config.sub/guess to /usr/share/misc/
for i in config.guess config.sub missing install-sh mkinstalldirs ; do
        test -r /usr/share/automake/${i} && cp -f /usr/share/automake/${i} .
        chmod 755 ${i}
done

autoconf

#./configure $*

exit 0
