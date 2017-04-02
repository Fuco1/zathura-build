#!/bin/bash

VERSION=$(cat VERSION)

docker login
docker push "fuco1/zathura:$VERSION"
