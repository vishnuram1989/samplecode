#!/bin/bash

set -x

echo "$GOOGLE_CREDENTIAL_FILE_CONTENT" > /tmp/account.json
export GOOGLE_APPLICATION_CREDENTIALS='/tmp/account.json'
terraform init
terraform plan