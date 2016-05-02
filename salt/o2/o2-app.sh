#!/bin/bash
export PROGRAM_PID=$1

pushd `dirname $0` > /dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

JAVA_OPTS="{{ java_opts }}"
PROGRAM_NAME={{ program_name }}

if [ -z $WORKING_DIR ]; then
   pushd $SCRIPT_DIR
else
   pushd $WORKING_DIR
fi

if [ -z $PROGRAM_PID ]; then
java $JAVA_OPTS -jar ${SCRIPT_DIR}/${PROGRAM_NAME}.jar --spring.config.location=${SCRIPT_DIR}/${PROGRAM_NAME}.yml
else
java $JAVA_OPTS -jar ${SCRIPT_DIR}/${PROGRAM_NAME}.jar --spring.config.location=${SCRIPT_DIR}/${PROGRAM_NAME}.yml&
sleep 1
echo $! >$PROGRAM_PID
fi

popd > /dev/null

exit 0
