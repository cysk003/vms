#14-17
for host in `seq 15 15`;
do
for i in `seq 0 9999`;
do
  tvid=`printf %04d $i`
  addr=124.232.233.$host:6610
  originUrl="http://$addr/000000001001/20170003$tvid/index.m3u8?IASHttpSessionId=SLB2046220190906022827233263&m3u8_level=2"
  result=$(curl $originUrl  2>/dev/null |wc -l)

 # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
  echo $originUrl, $tvid,$result
  if [ "$result" -gt 0 ]; then
       echo $host,$originUrl >> hunan.txt
   fi
done
done
