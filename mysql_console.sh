#!/bin/bash
S0="${BASH_SOURCE[0]}"
DIRNAME="$( dirname "$S0")"
DIR="$( cd "$DIRNAME" && pwd)"

cd $DIR

mysql --user=root --password="030405hjcduemn398ch7823rc" --host="127.0.0.1" -D platform

