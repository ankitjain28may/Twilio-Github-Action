#!/bin/sh

set -eu

/usr/bin/curl -X POST https://api.twilio.com/2010-04-01/Accounts/$SID/Messages.json \
    --data-urlencode "From=$INPUT_FROM" \
    --data-urlencode "Body=$INPUT_BODY" \
    --data-urlencode "To=$INPUT_TO" \
    -u $INPUT_SID:$AUTH_TOKEN > result.json

echo ::set-output name=status::`cat result.json | /usr/bin/jq '.status'`