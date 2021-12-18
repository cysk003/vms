#!/bin/bash
for host in `seq 221 221`;
do
  for i in `seq 30000 32599`;
  do
    tvid=`printf %05d $i`

    result=`curl --connect-timeout 1 http://112.17.40.$host/PLTV/88888888/224/322123$tvid/index.m3u8 2> /dev/null | wc -l`
    echo $host,$result,$tvid

    if [ $result -gt 0 ]; then
      echo $host,http://112.17.40.$host/PLTV/88888888/224/322123$tvid/index.m3u8 >> scan_7.txt
    else
        url=`curl -I --connect-timeout 1 http://112.17.40.$host/PLTV/88888888/224/322123$tvid/index.m3u8 2>/dev/null |grep "Location:"|awk '{print $2}'`
        if [ ! -z "$url" ]; then
           echo $url >> scan_7_302.txt
        fi
    fi
  done
done