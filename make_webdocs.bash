#!/bin/bash

set -ex

cd "$(dirname ${BASH_SOURCE[0]})"

[ -n "$1" ] || cat << EOF

  Usage: $(basename $0) DOX_DIR

EOF

echo "PWD=$PWD"

# We may be putting most of these same files back in the next
# command:
git rm -rf html/

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

