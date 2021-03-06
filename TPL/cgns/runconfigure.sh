#! /usr/bin/env bash
EXTRA_ARGS=$@

#MPI="${MPI:-ON}"
MPI="${MPI:-OFF}"

echo "MPI set to ${MPI}"

### The following assumes you are building in a subdirectory of ACCESS Root
if [ "X$ACCESS" == "X" ] ; then
  ACCESS=$(cd ../../../..; pwd)
  echo "ACCESS set to ${ACCESS}"
fi

if [ "$MPI" == "ON" ]
then
  export CC=mpicc
else
  export CC=gcc
fi

CFLAGS="-I${ACCESS}/include"; export CFLAGS
CPPFLAGS="-DNDEBUG"; export CPPFLAGS
OS=`uname -s`

rm -f CMakeCache.txt

if [ "$OS" == "Darwin" ] ; then

cmake \
-D CMAKE_MACOSX_RPATH:BOOL=ON \
-D CMAKE_INSTALL_RPATH:PATH=${INSTALL_PATH}/lib \
-D CGNS_BUILD_SHARED:BOOL=ON \
-D CGNS_ENABLE_HDF5:BOOL=ON \
-D HDF5_LIBRARY:PATH=${ACCESS}/lib/libhdf5.dylib \
-D HDF5_LIBRARIES:PATH=${ACCESS}/lib/libhdf5.dylib \
-D HDF5_INCLUDE_DIRS:PATH=${ACCESS}/include \
-D HDF5_NEED_ZLIB:BOOL=ON \
-D CGNS_ENABLE_SCOPING:BOOL=ON \
-D CGNS_ENABLE_FORTRAN:BOOL=OFF \
-D CGNS_ENABLE_PARALLEL:BOOL=${MPI} \
-D CMAKE_INSTALL_PREFIX:PATH=${ACCESS} \
-D HDF5_NEED_MPI:BOOL=${MPI} \
-D HDF5_IS_PARALLEL:BOOL=${MPI} \
$EXTRA_ARGS \
..

else

cmake \
-D CGNS_BUILD_SHARED:BOOL=ON \
-D CGNS_ENABLE_HDF5:BOOL=ON \
-D HDF5_LIBRARY:PATH=${ACCESS}/lib \
-D HDF5_INCLUDE_DIRS:PATH=${ACCESS}/include \
-D HDF5_NEED_ZLIB:BOOL=ON \
-D CGNS_ENABLE_SCOPING:BOOL=ON \
-D CGNS_ENABLE_FORTRAN:BOOL=OFF \
-D CGNS_ENABLE_PARALLEL:BOOL=${MPI} \
-D CMAKE_INSTALL_PREFIX:PATH=${ACCESS} \
-D HDF5_NEED_MPI:BOOL=${MPI} \
-D HDF5_IS_PARALLEL:BOOL=${MPI} \
$EXTRA_ARGS \
..

fi

echo ""
echo "     MPI: ${MPI}"
echo "COMPILER: ${CC}"
echo "  ACCESS: ${ACCESS}"
echo ""
