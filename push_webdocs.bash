#!/bin/bash

set -e

cd "$(dirname ${BASH_SOURCE[0]})"

if [ -n "$1" ] ; then
    cat << EOF

  Usage: $(basename $0)

  Push web pages to the wed on github.com.
  Read this script, it ain't much.

EOF
    exit 1
fi


echo "PWD=$PWD"

# We may be putting most of these same files back in the next
# command:

set -x
echo "This is a doxygen generated directory" > html/search/README
git add html/search html *
if ! git commit -a -m "Adding web pages" ; then
    set +x
    echo "The local commit failed, but it may be that no files changed"
    echo "and so: \"nothing to commit, working tree clean\" is printed above."
    exit
fi
set +x
echo
set -x
git push origin gh-pages

