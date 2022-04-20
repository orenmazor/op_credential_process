#!/usr/bin/env bash
ACCOUNT="$1"
ITEM="$2"

eval "$(op signin --account "$ACCOUNT")"

AWS_ACCESS_KEY_ID="$(op item get "$ITEM" --format json --fields AWS_ACCESS_KEY_ID | jq -r .value)"
AWS_SECRET_ACCESS_KEY="$(op item get "$ITEM" --format json --fields AWS_SECRET_ACCESS_KEY | jq -r .value)"
DURATION=${3-43200}

AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
    AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
    aws sts get-session-token \
    --duration-seconds "$DURATION" \
    | jq .Credentials | jq '. + {"Version": 1}'
