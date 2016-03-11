#!/bin/bash

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

get_node() {
  local host=$(cat $DIR/configs/host.txt)
  local token=$(cat $DIR/configs/token.txt)
  local uuid=$1
  curl -s -o /dev/null \
       -b $DIR/configs/cookie.txt "$host" \
       -H 'Accept: application/json' \
       -H 'CamelHttpMethod: GET' \
       -H "X-CSRF-Token: $token" \
       -H 'Ignore-Hooks: true' \
       -H 'Content-Type: application/json' \
       -X GET \
       --verbose \
       "$host/islandora/node/${uuid}" 2>>$DIR/logs/get-node.log
}

main() {
  local uuid=$1
  local response=$(get_node "$uuid")
  echo $response |  python -mjson.tool > $DIR/data/node-${uuid}.json
}
main "$@"
