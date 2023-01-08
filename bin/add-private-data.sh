#!/bin/bash

set -eo pipefail # exit if any command or pipe fail
set -u # exit on undefined variable


echo 'Production flow: Inserting private data into resume'

# TODAY=$(date +"%Y-%m-%d")
source bin/private.sh

jq --arg a "$PHONENUMBER" --arg b "$EMAIL" '.basics.phone = $a | .basics.email = $b' resume.json > resume-prod.json 

echo 'My job here is done'