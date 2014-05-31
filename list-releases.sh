#!/bin/bash

set -eu

owner=vmi
repository=sandbox

access_token=$(cat access_token.txt)
url="https://api.github.com/repos/$owner/$repository/releases?access_token=$access_token"

set -x

curl "$url"
echo "Status: $?"
