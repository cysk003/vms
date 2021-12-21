#!/bin/bash
url=$1
type=$2

tmp=${url##*//}
host=${tmp%%/*}
urlPath=${tmp:${#host}}
protocol=${url%%/*}
lastTmp=${host##*.}

port=`echo $url|awk -F"/" '{print $3}'|awk -F ":" '{print $2}'`
[ "$port" ] && port=":"$port
netRange=`echo $url|awk -F"/" '{print $3}'|awk -F ":" '{print $1}'|awk -F"." '{print $1"."$2"."$3".";}'`

for i in `seq 1 254`
do
  echo $i
  if [ "$type" = "2" ]; then

    curl -I --connect-timeout 1 ${protocol}//${netRange}${i}$port${urlPath}
  else
    curl --connect-timeout 1 ${protocol}//${netRange}${i}$port${urlPath}
  fi
done