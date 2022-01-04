for i in `seq 9000 9199`;
do
  tvid=`printf %04d $i`
  result=`curl --connet-timeout 1 http://117.148.129.5:80/PLTV/88888910/224/322122$tvid/index.m3u8 2>/dev/null |grep "404 Not Found"|wc -l`;
  echo $result $tvid
  if [ $result == 0 ]; then
    echo http://39.135.138.60:18890/PLTV/88888910/224/322122$tvid/index.m3u8 >> scan2.txt
  fi
done
