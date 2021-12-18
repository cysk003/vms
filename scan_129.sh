for i in `seq 30000 32999`;
do
  tvid=`printf %05d $i`
  result=`curl http://117.148.129.91:80/PLTV/88888888/224/32212$tvid/index.m3u8 -I 2>/dev/null |grep "404 Not Found"|wc -l`;
  echo $result $tvid
  if [ $result == 0 ]; then
    echo http://117.148.129.91:80/PLTV/88888888/224/32212$tvid/index.m3u8 >> scan_129.txt
  fi
done
