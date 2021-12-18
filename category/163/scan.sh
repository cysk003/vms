for host in `seq 59 59`;
do
for i in `seq 24000 24999`;
do
  tvid=`printf %05d $i`
  addr=39.135.138.$host:18890
  result=`curl http://$addr/PLTV/88888910/224/32212$tvid/index.m3u8  2>/dev/null|grep "404 Not Found"|wc -l`
   echo $host,$result,$i ;
  if [ $result == 0 ]; then
       echo $host,http://$addr/PLTV/88888910/224/32212$tvid/index.m3u8 >> scan_163.txt
   fi
done
done


#117.148.129.3-14, 66-105
#112.17.40.216-223 240-242 244-247
#117.148.179.
#34-51 53-60