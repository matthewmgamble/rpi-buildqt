#!/bin/bash

set -e

SCRIPTDIR=$(dirname "$0")
source $SCRIPTDIR/env.sh

SOURCE_DIR=${RPIDEV_SRC}/qtwebsockets
cd $SOURCE_DIR

# echo
# echo "== Cleaning previous build =="
# echo
# rm -rf QT_INSTALL_DIR
# rm -rf QT_INSTALL_DIR_HOST

echo
echo "== Configuring qtwebsockets =="
echo
${QT_INSTALL_DIR_HOST}/bin/qmake

echo
echo "== Building qtwebsockets =="
echo
make -j${RPIDEV_JOBS}

echo
echo "== Installing qtwebsockets =="
echo
make install
