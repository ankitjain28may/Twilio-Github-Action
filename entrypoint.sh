#!/bin/sh

set -eu

/usr/bin/curl -X POST https://api.twilio.com/2010-04-01/Accounts/$INPUT_SID/Messages.json \
    --data-urlencode "From=$INPUT_FROM" \
    --data-urlencode "Body=$INPUT_BODY" \
    --data-urlencode "To=$INPUT_TO" \
    -u $INPUT_SID:$INPUT_AUTHTOKEN
