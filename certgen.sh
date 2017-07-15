#!/usr/bin/env bash

certmeta=`pwd`/certmeta

OPENSSL=`which openssl`
if [[ -z "$OPENSSL" ]]; then
    echo "openssl not found"
    exit 1;
else
    COMMON_NAME=`cat ${certmeta} | grep "CN" | cut -d= -f2 | tr -d [:space:]`
    if [[ ! -z $1 && $1 == '--read' ]]; then
        if [[ -f $COMMON_NAME.crt ]]; then
            $OPENSSL x509 -in $COMMON_NAME.crt -text -noout
            exit 0
        else
            echo "$COMMON_NAME.crt not found"
            exit 1
        fi
    fi
    CERT_GEN=`$OPENSSL req  -nodes -new -x509  -keyout ${COMMON_NAME}.key -out ${COMMON_NAME}.crt -days 365 -config ${certmeta}`
    echo $CERT_GEN
fi