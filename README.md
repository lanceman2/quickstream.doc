# faststream.doc
documentation and other files for the faststream software project

## Usage
This repo contains generated files, and so as such, should not be used as a
regular source repository.  We are just using this repo to work around the
deficiency in the github.com system which does not let use use files in
web pages that are not in repositories.

## Files
To generate a new ``fastStream_states.svg`` that is linked in
``fastStream/README.md`` running something like:

```dot faststream/fastStream_states.dot -Tsvg > faststream.doc/fastStream_states.svg```
```dot faststream/fastStream_states.dot -Tpng > faststream.doc/fastStream_states.png```
