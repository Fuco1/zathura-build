#!/bin/bash

VERSION=$(cat VERSION)

docker login
docker push "fuco1/zathura:$VERSION"
docker tag "fuco1/zathura:$VERSION" fuco1/zathura:latest
docker push fuco1/zathura:latest
