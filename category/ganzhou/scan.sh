for host in `seq 165 165`;
do
for i in `seq 26560 26999`;
do
  tvid=`printf %05d $i`
  addr=39.135.140.$host:6610
  originUrl=http://$addr/PLTV/88888910/224/32212$tvid/index.m3u8
  realUrl=$(curl -I $originUrl  2>/dev/null|grep "Location"|awk -F" "   '{print $2}')
  result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
  echo $host, $tvid,$result
  if [ $result -eq 0 ]; then
       echo $host,$originUrl >> scan_ganzhouo.txt
   fi
done
done


#117.148.129.3-14, 66-105
#112.17.40.216-223 240-242 244-247
#117.148.179.
#39.135.140.34-60

