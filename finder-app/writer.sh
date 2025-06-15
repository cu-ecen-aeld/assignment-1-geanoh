#!/bin/sh

if [ $# -lt 2 ]
then
    echo "there should be two arguments"
    exit 1
fi

writefile=$1
writestr=$2

mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]
then 
    echo "create $writefile file failed."
    exit 1
fi