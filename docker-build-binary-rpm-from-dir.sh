#!/bin/bash
set -ex
IMAGETAG=$1
[ -n $1 ] || { echo "Missing IMAGETAG param" ; exit 1 ;}
shift 1
SRCDIR=$1
[ -n $1 ] || { echo "Missing SRCDIR" ; exit 1 ;}
shift 1

docker run $*  -v `pwd`:/docker-files -v ${SRCDIR}:/src -w /docker-files $IMAGETAG ./rpmbuild-in-docker.sh
