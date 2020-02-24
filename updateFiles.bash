#!/bin/bash

set -ex

imagesDir=../quickstream/share/doc/quickstream/images

cd "$(dirname ${BASH_SOURCE[0]})"

if [ ! -d "${imagesDir}" ] ; then
    echo "imagesDir=${imagesDir} was not found"
    exit 1
fi

cwd="$PWD"

cd "${imagesDir}"

files=(*.png *.svg)

cp ${files[@]} $cwd

