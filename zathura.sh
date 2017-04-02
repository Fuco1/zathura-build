#!/bin/bash

VERSION=$(cat VERSION)
FILE=$(readlink -f "$1")
CONFIG=$(readlink -f "$HOME/.config/zathura/zathurarc")

xhost local:docker

docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v "$CONFIG:/root/.config/zathura/zathurarc:ro" \
       -v "$HOME/.local/share/zathura/:/root/.local/share/zathura/" \
       -v "$FILE:$FILE:ro" \
       "fuco1/zathura:$VERSION" "$FILE"
