#!/usr/bin/env bash
set -ex

scons APR="${PREFIX}" APU="${PREFIX}" \
    OPENSSL="$PREFIX" ZLIB="$PREFIX" \
    PREFIX="$PREFIX" CC="$CC" \
    CFLAGS="$CFLAGS" \
    CPPFLAGS="$CPPFLAGS" LINKFLAGS="$LDFLAGS"

# The checks seem to be broken upstream.
# Fixing this would be nice because some issues in the openssl3
# transition have surfaced that might have been caught, but given
# the situation and treatment in other packaging efforts, this
# doesn't seem worthwhile at the moment.
# See, for example, the patches debian uses:
# https://sources.debian.org/patches/serf/1.3.9-10/
# scons check

scons install
