#!/bin/bash

set -e

SRC=$(pwd);
rpm -qa | grep glusterfs | xargs --no-run-if-empty rpm -e
./autogen.sh;
P=/build;
rm -rf $P/scratch;
mkdir -p $P/scratch;
cd $P/scratch;
rm -rf $P/install;
$SRC/configure --prefix=/ --localstatedir=/var --enable-bd-xlator=yes --enable-debug --silent
CFLAGS="-g -O0 -Wall -Werror" DESTDIR="$P/install" make install -j 4 >/dev/null
cd $SRC;
