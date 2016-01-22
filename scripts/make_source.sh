#!/bin/bash

THISDIR=$(readlink -f $(dirname $0))

cd $THISDIR/..

BUILDDIR=$(mktemp -d)
VERSION=$(cat VERSION)

cp -a $THISDIR/.. $BUILDDIR/treesum-$VERSION

cd $BUILDDIR

tar cfz treesum-$VERSION.tar.gz treesum-$VERSION

[ $? -ne 0 ] && echo ' error: failed to create tarball' && exit 1

echo ${BUILDDIR}/treesum-${VERSION}.tar.gz
