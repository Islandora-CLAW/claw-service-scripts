#!/bin/bash

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

login() {
  local host=$(cat $DIR/configs/host.txt)
  curl -s -o /dev/null \
       -c $DIR/configs/cookie.txt "$host" \
       -H 'Content-Type: application/json' \
       -X POST \
       --data @$DIR/configs/credentials.json \
       --verbose \
       "$host/islandora/user/login" 2>>$DIR/logs/login.log
}

get_token() {
  local response=$1
  echo $response | perl -pe 's/.*token: ([^ ]*) .*/\1/'
}

main() {
  local response=$(login)
  local token=$(get_token "$response")
  echo "$token" > $DIR/configs/token.txt
}
main
