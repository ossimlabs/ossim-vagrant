#!/bin/bash
pushd `dirname $0` >/dev/null
export SCRIPT_DIR=`pwd -P`
. $SCRIPT_DIR/build-env.sh
popd >/dev/null


echo "************Building OpenSceneGraph Version 3.2****************"
if [ ! -d $SCRIPT_DIR/OpenSceneGraph-3.2/build ] ; then
  mkdir $SCRIPT_DIR/OpenSceneGraph-3.2/build
fi

pushd $SCRIPT_DIR/OpenSceneGraph-3.2/build
cmake -DCMAKE_INSTALL_PREFIX=$OSSIM_DEPENDENCIES ..
make -j4 install
popd >/dev/null


echo "****************Building ffmpeg version 3.0****************"
pushd $SCRIPT_DIR/ffmpeg-3.0
./configure --prefix=$OSSIM_DEPENDENCIES --disable-stripping --disable-debug --enable-gpl --enable-postproc --enable-x11grab --enable-avresample --enable-avfilter --disable-static --enable-pthreads --enable-shared --disable-mmx
make -j2;make install
popd >/dev/null


