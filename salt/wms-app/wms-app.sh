#!/bin/bash
export APP_PID=$1

pushd `dirname $0` > /dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null
export JAVA_OPTS="-server -Xms256m -Xmx1024m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"

if [ -z $WORKING_DIR ]; then
   pushd $SCRIPT_DIR
else
   pushd $WORKING_DIR
fi

if [ -z $APP_PID ]; then
java $JAVA_OPTS -jar ${SCRIPT_DIR}/wms-app.jar --spring.config.location=${SCRIPT_DIR}/wms-app.yml
else
java $JAVA_OPTS -jar ${SCRIPT_DIR}/wms-app.jar --spring.config.location=${SCRIPT_DIR}/wms-app.yml&
sleep 1
echo $! >$APP_PID
fi

popd > /dev/null

exit 0
