#!/bin/bash

cd "$(dirname "$0")";
CWD="$(pwd)"
echo $CWD
/root/.nvm/versions/node/v18.17.0/bin/node test.js