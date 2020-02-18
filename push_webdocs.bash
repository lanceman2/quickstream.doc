#!/bin/bash

set -ex

cd "$(dirname ${BASH_SOURCE[0]})"

if [ -z "$1" ] || [ ! -d "$1" ] ; then
    cat << EOF

  Usage: $(basename $0) DOX_DIR

EOF
    exit 1
fi

echo "PWD=$PWD"

# We may be putting most of these same files back in the next
# command:

if [ -d html ] ; then
    set +e
    git rm -rf html/
    set -e
    rm -rf html/
fi

cp -a "$1"/html ./

echo "This is a doxygen generated directory" > html/search/README

git add html/search html *

if ! git commit -a -m "Adding web pages" ; then
    set +x
    echo "The local commit failed, but it may be that no files changed"
    echo "and so: \"nothing to commit, working tree clean\" is printed above."
    exit
fi
git push origin gh-pages

