#!/bin/bash

set -e

SCRIPTDIR=$(dirname "$0")
source $SCRIPTDIR/env.sh

SOURCE_DIR=${RPIDEV_SRC}/qtwebengine
cd $SOURCE_DIR

# echo
# echo "== Cleaning previous build =="
# echo
# rm -rf QT_INSTALL_DIR
# rm -rf QT_INSTALL_DIR_HOST

echo
echo "== Configuring qtwebengine =="
echo
${QT_INSTALL_DIR_HOST}/bin/qmake WEBENGINE_CONFIG+=use_proprietary_codecs
echo
echo "== Building qtwebengine =="
echo
make -j${RPIDEV_JOBS}

echo
echo "== Installing qtwebengine =="
echo
make install
