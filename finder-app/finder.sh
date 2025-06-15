#!/bin/sh


if [ $# -lt 2 ]
then
    echo "there should be two arguments"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]
then
    echo "$filesdir is not a directory"
    exit 1
fi

matchFile=0
matchLine=0

for file in $(find "$filesdir" -type f)
do
    matches=$(grep -c "$searchstr" "$file")

    if [ $matches -gt 0 ]
    then
        matchFile=$((matchFile + 1))
        matchLine=$((matchLine + matches))
    fi
done

echo "The number of files are $matchFile and the number of matching lines are $matchLine"