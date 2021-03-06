#!/bin/sh
# Copyright (C) 2009 GraphicsMagick Group
#
# This program is covered by multiple licenses, which are described in
# Copyright.txt. You should have received a copy of Copyright.txt with this
# package; otherwise see http://www.graphicsmagick.org/www/Copyright.html.

echo '=== Environment ==='
echo "LD_LIBRARY_PATH='${LD_LIBRARY_PATH}'"
echo "MAGICK_CODER_MODULE_PATH='${MAGICK_CODER_MODULE_PATH}'"
echo "MAGICK_CONFIGURE_PATH='${MAGICK_CONFIGURE_PATH}'"
echo "MAGICK_FILTER_MODULE_PATH='${MAGICK_FILTER_MODULE_PATH}'"
echo "MAKE='${MAKE}'"
echo "MAKEFLAGS='${MAKEFLAGS}'"
echo "MEMCHECK='${MEMCHECK}'"
echo "PATH='${PATH}'"
echo "SRCDIR='${SRCDIR}'"
echo "srcdir='${srcdir}'"
echo '==================='
echo ''

set -x

SRCDIR=`dirname $0`
SRCDIR=`cd $SRCDIR && pwd`
TOPSRCDIR=`cd $srcdir && pwd`

cd PerlMagick || exit 1

if test -z "${MAKE}" ; then
  MAKE=make
fi

if test -x PerlMagick -a -f Makefile.aperl ; then
  # Static build test incantation
  ${MAKE} -f Makefile.aperl CC='gcc -std=gnu99' test
elif test -f Makefile -a -f Magick.o ; then
  # Shared build test incantation
  ${MAKE} CC='gcc -std=gnu99' test
else
  echo 'PerlMagick has not been built!'
  exit 1
fi


