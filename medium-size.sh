#!/bin/bash

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

generate_request() {
  local uuid=$1
  local image=$2
  $DIR/helpers/generate-medium-size-request.py $uuid $image $DIR/data/request-medium-size-${uuid}.json
}

medium_size() {
  local host=$(cat $DIR/configs/host.txt)
  local token=$(cat $DIR/configs/token.txt)
  local uuid=$1
  local request_data=$DIR/data/request-medium-size-${uuid}.json
  curl -s -o /dev/null \
       -b $DIR/configs/cookie.txt "$host" \
       -H 'Accept: application/json' \
       -H "X-CSRF-Token: $token" \
       -H 'Ignore-Hooks: true' \
       -H 'Content-Type: application/json' \
       -X POST \
       --data @$request_data \
       "$host/islandora/medium_size"
}

main() {
  local uuid=$1
  local image_file=$2
  if generate_request $uuid $image_file; then
      medium_size $uuid
  fi
}
main "$@"
