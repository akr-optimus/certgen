#!/usr/bin/env bash

# Determine the OS platform

certmeta='certmeta'

OPENSSL=`which openssl`
if [[ -z "$OPENSSL" ]]; then
    echo "openssl not found"
    exit 1;
else
    COMMON_NAME=`cat ${certmeta} | grep "CN" | cut -d= -f2 | tr -d [:space:]`
    SERVER_KEY=`$OPENSSL req  -nodes -new -x509  -keyout ${COMMON_NAME}.key -out ${COMMON_NAME}.crt -days 365 -config ${certmeta}`
    echo $SERVER_KEY
fi