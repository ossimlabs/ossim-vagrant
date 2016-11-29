#!/bin/bash
pushd `dirname $0` >/dev/null
export SCRIPT_DIR=`pwd -P`
. $SCRIPT_DIR/build-env.sh
popd >/dev/null



if [ -d $SCRIPT_DIR/OpenSceneGraph-3.2 ] ; then
   echo "************Building OpenSceneGraph Version 3.2****************"

   if [ ! -d $SCRIPT_DIR/OpenSceneGraph-3.2/build ] ; then
     mkdir $SCRIPT_DIR/OpenSceneGraph-3.2/build
   fi
   pushd $SCRIPT_DIR/OpenSceneGraph-3.2/build
   cmake -DCMAKE_INSTALL_PREFIX=$OSSIM_DEPENDENCIES ..
   make -j4 install
   popd >/dev/null
fi

if [ -d $SCRIPT_DIR/ffmpeg-3.0 ] ; then

   echo "****************Building ffmpeg version 3.0****************"
   pushd $SCRIPT_DIR/ffmpeg-3.0
   ./configure --prefix=$OSSIM_DEPENDENCIES --disable-stripping --disable-debug --enable-gpl --enable-postproc --enable-x11grab --enable-avresample --enable-avfilter --disable-static --enable-pthreads --enable-shared --disable-mmx
   make -j2;make install
   popd >/dev/null
fi

if [ -d $SCRIPT_DIR/ossim-private/v7_5-01123C ] ; then
   echo "****************Building kakadu v7_5-01123C****************"
   if [ -z $JAVA_HOME ] ; then
      export JAVA_HOME=/usr/lib/jvm/java
   done
   pushd $SCRIPT_DIR/ossim-private/v7_5-01123C/coresys/make/
      make -f Makefile-Linux-x86-64-gcc
   popd >/dev/null
   pushd $SCRIPT_DIR/ossim-private/v7_5-01123C/make
      make -f Makefile-Linux-x86-64-gcc
   popd >/dev/null
   pushd $SCRIPT_DIR/ossim-private/v7_5-01123C/apps/make
      make -f Makefile-Linux-x86-64-gcc
   popd >/dev/null
   pushd $SCRIPT_DIR/ossim-private/v7_5-01123C/managed/make
      make -f Makefile-Linux-x86-64-gcc
   popd >/dev/null
fi
