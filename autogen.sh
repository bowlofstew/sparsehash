#!/bin/sh

# Before using, you should figure out all the .m4 macros that your
# configure.m4 script needs and make sure they exist in the m4/
# directory.
#
# These are the files that this script might edit:
#    aclocal.m4 configure Makefile.in src/config.h.in \
#    compile config.guess config.sub depcomp install-sh missing mkinstalldirs
#
# Here's a command you can run to see what files aclocal will import:
#  aclocal -I ../autoconf --output=- | sed -n 's/^m4_include..\([^]]*\).*/\1/p'

set -ex
rm -rf autom4te.cache

aclocal --force -I m4
autoconf -f -W all,no-obsolete
autoheader -f -W all
automake -a -c -f -W all

rm -rf autom4te.cache
exit 0
