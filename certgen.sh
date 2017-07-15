#!/usr/bin/env bash

# Determine the OS platform

UNAME=$(uname | tr "[:upper:]" "[:lower:]")

declare -A MYMAP

echo $UNAME

MYMAP[C]='US'
MYMAP[ST]='IL'
MYMAP[L]='Chicago'
MYMAP[O]='MYORG'

if [[ -z $1 ]]; then
    MYMAP[CN]="$UNAME"
else
    MYMAP[CN]="$1"
fi

certmeta='certmeta'

if [[ "$UNAME" == "linux" ]]; then
    OPENSSL=`which openssl`
    if [[ -z "$OPENSSL" ]]; then
        echo "openssl not found"
        exit 1;
    else
        if [[ -f ${certmeta} ]]; then
            echo "certmeta file found"
            while IFS=: read -r col1 col2; do
                echo "Col1: $col1 and Col2: $col2"
                MYMAP[${col1}]=${col2}
            done < "$certmeta"
        fi
        SERVER_KEY=`$OPENSSL req  -nodes -new -x509  -keyout server.key -out server.crt -days 365 -subj /C="${MYMAP[C]}"/ST="${MYMAP[ST]}"/L="${MYMAP[L]}"/O="${MYMAP[O]}"/CN="${MYMAP[CN]}"`
        declare -p MYMAP
        echo $SERVER_KEY
    fi
else
    echo "Runs only in a Linux environment"
    exit 1;
fi