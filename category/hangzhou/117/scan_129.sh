for host in `seq 4 11`;
do
for i in `seq 28000 32799`;
do
  tvid=`printf %05d $i`
  result=`curl  --connect-timeout 1 http://117.148.129.$host/PLTV/88888888/224/32212$tvid/index.m3u8 2>/dev/null|wc -l`
   echo $host,$result,$i ;
  if [ $result -gt 0 ]; then
       echo $host,http://117.148.129.$host/PLTV/88888888/224/32212$tvid/index.m3u8 >> scan_129.txt
   fi
done
done

#117.148.129.3-14, 66-105
#112.17.40.216-223 240-242 244-247
#117.148.179.