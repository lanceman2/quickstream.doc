#!/bin/bash

set -ex

cd "$(dirname ${BASH_SOURCE[0]})"

[ -n "$1" ] || cat << EOF

  Usage: $(basename $0) DOX_DIR

EOF

echo "PWD=$PWD"

git rm -rf html/
mkdir html/
cp -a "$1"/html ./
echo "This is a doxygen generated directory" > html/search/README
git add html/search html *
git commit -a -m "Adding web pages"
git push origin gh-pages

