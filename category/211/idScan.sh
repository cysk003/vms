#!/bin/bash

src=$1
outputFile=$2
CWD=$(cd `dirname $0`;pwd)

source $src/config

idfmt=${idfmt:-%05d}


[ "$port" ] && port=":"$port
for hostRange in $hostRanges;
  do
    start=${hostRange%%-*}
    end=${hostRange##*-}
    for host in `seq $start $end`
    do
      while read line;
      do
        if [ -z "$line" ]; then
           continue
        fi
        #tvid=`printf $idfmt $line`
        #addr=$prefix.$host$port
       # if [ ! "${urlPath:0:1}" = "/" ]; then
       #  urlPath=$urlPath"/"
      #  fi
      #  originUrl=http://$addr${urlPath//##tvid##/$tvid}
        originUrl=`echo $line|awk -F"," '{print $2;}'`
        if [ $checkType == 1 ]; then
          result=$(curl  $originUrl  2>/dev/null|grep "hls.ts"|wc -l)
          # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
          echo $host,$result,$originUrl
          if [ $result -gt 0 ]; then
            echo $host,$originUrl >> $outputFile
            if [ "$successBreak" == "true" ]; then
               break
            fi
          fi
        else
          result=$(curl  $originUrl  2>/dev/null|grep "404 Not Found"|wc -l)
          # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
          echo $host, $tvid,$result,$originUrl
          if [ $result == 0 ]; then
            echo $host,$originUrl >> $outputFile
            if [ "$successBreak" == "true" ]; then
               break
            fi
          fi
        fi
      done < $src/sorted.txt
    done
done