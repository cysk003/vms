
for firstRange in `seq 248 249`;
do
  for iprange in `seq 100 255`;
  do
    for host in `seq 0 255`;
    do

      url=http://60.$firstRange.$iprange.$host;
      result=`curl -m1 --connect-time 1 $url 2>/dev/null |grep player-live|wc -l`
      echo "scan $url, $result"
      if [ "$result" -gt 0 ]; then
        for port in `seq 8500 8800`;
        do
          result2=`curl -m1 --connect-timeout 2 $url:$port/.m3u8 2>/dev/null |grep EXTM3U| wc -l`;
          echo  $url:$port/.m3u8,$result2 ;
          [ "$result2" -gt 0 ] && echo  $url:$port/.m3u8 >> tw2.txt ;
        done
      fi
    done
  done
done