
fileName=$1
outputFile=${2:-default.txt}

CWD=$(cd `dirname $0`;pwd)

oldId=""
oldLine=""
while read line
do
    id=`echo ${line}|awk -F"/" '{print $7;}'`
    if [ ! "$id" = "$oldId" ]; then
       oldId=$id
       oldLine=$line
       echo $line # >> $outputFile
    fi
done < $fileName

echo $line #>> $outputFile
