for host in `seq 170 170`;
do
for i in `seq 2000 2100`;
do
  tvid=`printf %04d $i`
  addr=106.115.24.$host:9901
  originUrl=http://$addr/tsfile/live/${tvid}_1.m3u8
  result=$(curl  $originUrl  2>/dev/null -I |grep "HTTP/1.1 404"|wc -l)

 # result=`https --headers  $realUrl|grep "404 Not Found"|wc -l`
  echo $host, $tvid,$result
  if [ $result = 1 ]; then
       echo $host,$originUrl >> scan_hebei.txt
   fi
done
done
