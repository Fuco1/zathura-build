#!/bin/bash

VERSION=$(cat VERSION)
file=$(readlink -f "$1")
dir=$(dirname "$file")
basename=$(basename "$file")
config=$(readlink -f "$HOME/.config/zathura/zathurarc")

xhost local:docker

docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v "$config:/root/.config/zathura/zathurarc:ro" \
       -v "$dir":/tmp/localdir:ro \
       "fuco1/zathura:$VERSION" "/tmp/localdir/$basename"
