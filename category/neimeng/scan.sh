for host in `seq 201 201`;
do
for i in `seq 25000 26599`;
do
  tvid=`printf %05d $i`
  addr=117.136.154.$host
  originUrl=http://$addr/PLTV/88888888/224/32212$tvid/index.m3u8
  result=$(curl  $originUrl  2>/dev/null -I |grep "HTTP/1.1")

 # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
  echo $host, $tvid,$result
  if [ "$result" = 0 ]; then
       echo $host,$originUrl
   fi
done
done
