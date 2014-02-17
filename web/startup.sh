#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR

sudo systemctl restart httpd
#ipython notebook &

if [ -d ../../OG-Platform ] ; then
pushd ../../OG-Platform/examples/examples-simulated/
mvn install >> $SCRIPT_DIR/og.log
mvn opengamma:server-start -Dconfig=fullstack >> $SCRIPT_DIR/web/og.log &
popd
fi

if [ -d ../../ethercalc ] ; then
pushd ../../ethercalc
make >> $SCRIPT_DIR/ethercalc.log &
popd
fi

if [ -d ../../etherpad-lite ] ; then
pushd ../../etherpad-lite
bin/run.sh >> $SCRIPT_DIR/etherpad.log &
popd
fi



