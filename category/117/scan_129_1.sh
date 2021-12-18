#!/bin/bash
for host in `seq 100 100`;
do
  for i in `seq 30000 32599`;
  do
    tvid=`printf %05d $i`

    result=`curl --connect-timeout 1 http://117.148.129.$host/PLTV/88888888/224/322123$tvid/index.m3u8 2> /dev/null | wc -l`
    echo $host,$result,$tvid

    if [ $result -gt 0 ]; then
      echo $host,http://117.148.129.$host/PLTV/88888888/224/322123$tvid/index.m3u8 >> scan_6.txt
    else
        url=`curl -I --connect-timeout 1 http://117.148.129.$host/PLTV/88888888/224/322123$tvid/index.m3u8 2>/dev/null |grep "Location:"|awk '{print $2}'`
        if [ ! -z "$url" ]; then
           echo $url >> scan_6_302.txt
        fi
    fi
  done
done