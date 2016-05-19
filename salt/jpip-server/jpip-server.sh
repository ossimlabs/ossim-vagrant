#!/bin/bash
export PROGRAM_PID=$1
export JPIP_DATA_DIR={{jpip_data_dir}}
export JPIP_SOURCES={{jpip_sources}}
export JPIP_CLIENTS={{jpip_clients}}
export JPIP_PORT={{jpip_port}}
export JPIP_ADDRESS={{jpip_address}}
export JPIP_CONNECTION_THREADS={{jpip_connection_threads}}
export JPIP_MAX_RATE=40000000
pushd `dirname $0` > /dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

#Set working directory
pushd $JPIP_DATA_DIR
if [ -z $PROGRAM_PID ]; then
ossim-jpip-server -sources ${JPIP_SOURCES} -clients ${JPIP_CLIENTS} -port ${JPIP_PORT} -max_rate ${JPIP_MAX_RATE} -address ${JPIP_ADDRESS} -connection_threads ${JPIP_CONNECTION_THREADS}
else
ossim-jpip-server -sources ${JPIP_SOURCES} -clients ${JPIP_CLIENTS} -port ${JPIP_PORT} -max_rate ${JPIP_MAX_RATE} -address ${JPIP_ADDRESS} -connection_threads ${JPIP_CONNECTION_THREADS}&
sleep 1
echo $! >$PROGRAM_PID
fi
popd
