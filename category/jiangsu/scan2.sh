
for i in `seq 8901 9000`;
do
  tvid=`printf %04d $i`
  addr=ott.js.chinamobile.com
  originUrl="http://$addr/PLTV/3/224/322122$tvid/index.m3u8"
  realUrl=$(curl -I  $originUrl  2>/dev/null|grep "Location"|awk -F" "   '{print $2}')
  resultContent=`https --headers  $realUrl`
  result=`echo $resultContent|grep "404 Not Found"|wc -l`
  if [ $result -eq 0 ]; then
      result2=`echo $resultContent|grep "HTTP/1.1 400 Bad Request"|wc -l`
       echo $tvid,$result,$result2
      if [ $result2 -eq 0 ]; then
        echo 322122$tvid,$originUrl >> jiangsu_2.txt
      fi
  else
    echo $tvid,$result
  fi
done
