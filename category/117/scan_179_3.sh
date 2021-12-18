#!/bin/bash
for host in `seq 161 161`;
do
  for i in `seq 28000 29999`;
  do
    tvid=`printf %05d $i`

    result=`curl --connect-timeout 1 http://117.148.179.$host/PLTV/88888888/224/322123$tvid/index.m3u8 2> /dev/null | wc -l`
    echo $host,$result,$tvid

    if [ $result -gt 0 ]; then
      echo $host,http://117.148.179.$host/PLTV/88888888/224/322123$tvid/index.m3u8 >> scan_5.txt
    else
        url=`curl -I --connect-timeout 1 http://117.148.179.$host/PLTV/88888888/224/322123$tvid/index.m3u8 2>/dev/null |grep "Location:"|awk '{print $2}'`
        if [ ! -z "$url" ]; then
           echo $url >> scan_4_302.txt
        fi
    fi
  done
done