#!/bin/bash
REPO="https://github.com/netbirdio/netbird/"
# this command will fetch the latest release e.g. v0.8.7
LATEST_TAG=$(basename $(curl -fs -o/dev/null -w %{redirect_url} ${REPO}releases/latest))
echo $LATEST_TAG

# this command will clone the latest tag
git submodule add --depth 1 -b $REPO -- $REPO netbird
git submodule add --depth 1 $REPO netbird
cd ./netbird
git fetch --tags
git checkout $LATEST_TAG


cp ./infrastructure_files/setup.env.example ./netbird/infrastructure_files/setup.env

