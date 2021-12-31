
url=$1
for port in `seq 0 254`;
do
  result2=`curl -m1 --connect-time 1 $url.$port 2>/dev/null |grep player-live|wc -l`
  echo $url.$port, $result2
  [ "$result2" -gt 0 ] && echo  $url.$port >> category/taiwan/ip.txt ;
done


for id in `seq 900 2000`;
do
  url=http://42.176.185.28:9901/tsfile/live/${id}_1.m3u8
  result2=`curl -m1 --connect-time 1 $url 2>/dev/null |grep EXTM3U|wc -l`
  echo $url, $result2
  [ "$result2" -gt 0 ] && echo  $url >> category/taiwan/28.txt ;
done
