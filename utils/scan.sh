#!/bin/bash

src=$1
outputFile=$2
CWD=$(cd `dirname $0`;pwd)

source $src/config

idfmt=${idfmt:-%05d}


[ "$port" ] && port=":"$port
if [ "$scanType" == 1 ]; then
  for hostRange in $hostRanges;
  do
    start=${hostRange%%-*}
    end=${hostRange##*-}
    for host in `seq $start $end`
    do
      for i in `seq $portStart $portEnd`;
      do
        tvid=`printf $idfmt $i`
        addr=$prefix.$host$port
        if [ ! "${urlPath:0:1}" = "/" ]; then
         urlPath=$urlPath"/"
        fi
        originUrl=http://$addr${urlPath//##tvid##/$tvid}
        if [ $checkType == 1 ]; then
          result=$(curl  $originUrl  2>/dev/null|wc -l)
          # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
          echo $host, $tvid,$result
          if [ $result -gt 0 ]; then
            echo $host,$originUrl >> $outputFile
            if [ "$successBreak" == "true" ]; then
               break
            fi
          fi
        else
          result=$(curl  $originUrl  2>/dev/null|grep "404 Not Found"|wc -l)
          # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
          echo $host, $tvid,$result
          if [ $result == 0 ]; then
            echo $host,$originUrl >> $outputFile
            if [ "$successBreak" == "true" ]; then
               break
            fi
          fi
        fi
      done
    done
  done
else
  for i in `seq $portStart $portEnd`;
  do
      for hostRange in $hostRanges;
      do
      start=${hostRange%%-*}
      end=${hostRange##*-}
      for host in `seq $start $end`;
      do
        tvid=`printf $idfmt $i`
        addr=$prefix.$host$port
        if [ ! "${urlPath:0:1}" = "/" ]; then
          echo $urlPath
          urlPath=$urlPath"/"
        fi
        originUrl=http://$addr${urlPath//##tvid##/$tvid}
        if [ $checkType == 1 ]; then
          result=$(curl  $originUrl  2>/dev/null|wc -l)
          # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
          echo $host, $tvid,$result
          if [ $result -gt 0 ]; then
            echo $host,$originUrl >> $outputFile
            if [ "$successBreak" == "true" ]; then
               break
            fi
          fi
        else
          result=$(curl  $originUrl  2>/dev/null|grep "404 Not Found"|wc -l)
          # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
          echo $host, $tvid,$result
          if [ $result == 0 ]; then
            echo $host,$originUrl >> $outputFile
            if [ "$successBreak" == "true" ]; then
              break
            fi
          fi
        fi
      done
    done
  done
fi