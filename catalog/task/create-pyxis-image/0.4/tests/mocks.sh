#!/usr/bin/env sh
set -eux

# mocks to be injected into task step scripts

function create_container_image() {
  echo Mock create_container_image called with: $* >> $(workspaces.data.path)/mock_create_container_image.txt
  echo The image id is 0000

  if [[ "$*" != "--pyxis-url https://pyxis.preprod.api.redhat.com/ --certified false --tag testtag --is-latest false --verbose --skopeo-result /tmp/skopeo-inspect.json" ]]
  then
    echo Error: Unexpected call
    exit 1
  fi
}

function skopeo() {
  echo Mock skopeo called with: $*
  if [[ "$*" != "inspect --no-tags docker://"* ]]
  then
    echo Error: Unexpected call
    exit 1
  fi
}