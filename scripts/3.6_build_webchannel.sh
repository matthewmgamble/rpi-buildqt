#!/bin/bash

set -e

SCRIPTDIR=$(dirname "$0")
source $SCRIPTDIR/env.sh

SOURCE_DIR=${RPIDEV_SRC}/qtwebchannel
cd $SOURCE_DIR

# echo
# echo "== Cleaning previous build =="
# echo
# rm -rf QT_INSTALL_DIR
# rm -rf QT_INSTALL_DIR_HOST

echo
echo "== Configuring qtwebchannel =="
echo
${QT_INSTALL_DIR_HOST}/bin/qmake

echo
echo "== Building qtwebchannel =="
echo
make -j${RPIDEV_JOBS}

echo
echo "== Installing qtwebchannel =="
echo
make install
