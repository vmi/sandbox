#!/bin/bash

set -eu

owner=vmi
repository=sandbox
branch=master
version=0.0.1
message="$(perl -pe 's/\n/\\n/gs' <<EOF
* item1
* item2
* item3
EOF
)"
data="{
  \"tag_name\": \"$repository-$version\",
  \"target_commitish\": \"$branch\",
  \"name\": \"$repository-$version\",
  \"body\": \"$message\",
  \"draft\": false,
  \"prelease\": false
}"

access_token=$(cat access_token.txt)
url="https://api.github.com/repos/$owner/$repository/releases?access_token=$access_token"

echo "$data"
curl --data "$data" "$url"
echo ""
echo "Status: $?"
