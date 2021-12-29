
url=$1
for port in `seq 0 254`;
do
  result2=`curl -m1 --connect-time 1 $url.$port 2>/dev/null |grep player-live|wc -l`
  echo $url.$port, $result2
  [ "$result2" -gt 0 ] && echo  $url.$port >> category/taiwan/ip.txt ;
done

url=$1
for port in `seq 0 254`;
do
  result2=`curl -m1 --connect-time 1 $url.$port 2>/dev/null |grep player-live|wc -l`
  echo $url.$port, $result2
  [ "$result2" -gt 0 ] && echo  $url.$port >> category/taiwan/ip.txt ;
done
