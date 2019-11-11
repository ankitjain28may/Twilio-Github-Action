FROM alpine:3.10

LABEL "com.github.actions.name"="Twilio Send SMS"
LABEL "com.github.actions.description"="Send an SMS using Twilio"

RUN apk add --no-cache curl jq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]