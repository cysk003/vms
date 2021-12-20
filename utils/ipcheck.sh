#!/bin/bash
url=$1
type=$2

tmp=${url##*//}
host=${tmp%%/*}
urlPath=${tmp:${#host}}
protocol=${url%%/*}
lastTmp=${host##*.}

netRange=${host:0:$((${#host} - ${#lastTmp}))}

for i in `seq 1 254`
do
  echo $i
  if [ "$type" = "2" ]; then
    curl -I --connect-timeout 1 ${protocol}//${netRange}${i}${urlPath}
  else
    curl --connect-timeout 1 ${protocol}//${netRange}${i}${urlPath}
  fi
done