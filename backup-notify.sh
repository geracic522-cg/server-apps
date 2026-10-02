#!/bin/bash
set -a
. /home/cgeraci/apps/.env
set +a

RESULT="${DUPLICATI__PARSED_RESULT:-Unknown}"
OPERATION="${DUPLICATI__OPERATIONNAME:-Unknown}"
TO="geracic522@gmail.com"
FROM="geracic522@gmail.com"
PASSWORD="${PL_SMTP_PASSWORD}"

SUBJECT="$RESULT: Duplicati $OPERATION report"
BODY="Duplicati $OPERATION finished with result: $RESULT"

curl -s --url "smtps://smtp.gmail.com:465" \
  --ssl-reqd \
  --mail-from "$FROM" \
  --mail-rcpt "$TO" \
  --user "$FROM:$PASSWORD" \
  --upload-file - << EOF
From: $FROM
To: $TO
Subject: $SUBJECT

$BODY
EOF
