#!/bin/bash

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set_node() {
  local host=$(cat $DIR/configs/host.txt)
  local token=$(cat $DIR/configs/token.txt)
  local uuid=$1
  curl -s -o /dev/null \
       -b $DIR/configs/cookie.txt "$host" \
       -H 'Accept: application/json' \
       -H 'CamelHttpMethod: PUT' \
       -H "X-CSRF-Token: $token" \
       -H 'Ignore-Hooks: true' \
       -H 'Content-Type: application/json' \
       -X PUT \
       --data @$DIR/data/node-${uuid}.json \
       --verbose \
       "$host/islandora/node/${uuid}" 2>>$DIR/logs/set-node.log
}

main() {
  local uuid=$1
  local response=$(set_node "$uuid")
  echo $response |  python -mjson.tool
}
main "$@"
