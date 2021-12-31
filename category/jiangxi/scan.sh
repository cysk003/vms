for host in `seq 67 67`;
do
for i in `seq 25000 25999`;
do
  tvid=`printf %05d $i`
  addr=39.134.66.$host
  originUrl=http://$addr/PLTV/88888888/224/32212$tvid/index.m3u8
  result=$(curl  $originUrl  2>/dev/null|wc -l)

 # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
  echo $host, $tvid,$result
  if [ $result -gt 0 ]; then
       echo $host,$originUrl >> scan_jx.txt
   fi
done
done

