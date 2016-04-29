#!/bin/bash
export APP_PID=$1

pushd `dirname $0` > /dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

#MARKER_START salt managed do not remove
JAVA_OPTS=
APP_NAME=
#MARKER_END salt managed do not remove

if [ -z $WORKING_DIR ]; then
   pushd $SCRIPT_DIR
else
   pushd $WORKING_DIR
fi

if [ -z $APP_PID ]; then
java $JAVA_OPTS -jar ${SCRIPT_DIR}/${APP_NAME}.jar --spring.config.location=${SCRIPT_DIR}/${APP_NAME}.yml
else
java $JAVA_OPTS -jar ${SCRIPT_DIR}/${APP_NAME}.jar --spring.config.location=${SCRIPT_DIR}/${APP_NAME}.yml&
sleep 1
echo $! >$APP_PID
fi

popd > /dev/null

exit 0
