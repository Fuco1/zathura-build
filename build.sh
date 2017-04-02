#!/bin/bash

VERSION=$(cat VERSION)
(cd zathura && git checkout $VERSION)

docker build -f Dockerfile.build -t "fuco1/zathura-build:$VERSION" .

docker run --rm \
       -v "$(pwd)/girara":/girara \
       -v "$(pwd)/zathura":/zathura \
       -v "$(pwd)/zathura-cb":/zathura-cb \
       -v "$(pwd)/zathura-djvu":/zathura-djvu \
       -v "$(pwd)/zathura-pdf-poppler":/zathura-pdf-poppler \
       -v "$(pwd)/zathura-ps":/zathura-ps \
       "fuco1/zathura-build:$VERSION"

docker build -f Dockerfile -t "fuco1/zathura:$VERSION" .
