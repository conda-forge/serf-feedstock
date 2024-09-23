#!/usr/bin/env bash
set -ex

if [[ -n "${MACOSX_DEPLOYMENT_TARGET}" ]] ; then
    export CFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} ${CFLAGS}"
    export CXXFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} ${CXXFLAGS}"
    export LDFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} ${LDFLAGS}"
fi

scons APR="${PREFIX}" APU="${PREFIX}" \
    OPENSSL="$PREFIX" ZLIB="$PREFIX" \
    PREFIX="$PREFIX" CC="$CC" \
    CFLAGS="$CFLAGS" \
    CPPFLAGS="$CPPFLAGS" LINKFLAGS="$LDFLAGS"

scons install
