
url=60.250.91.85
for port in `seq 8500 8800`;
do
  result2=`curl -m1 --connect-timeout 2 $url:$port/.m3u8 2>/dev/null |grep EXTM3U| wc -l`;
  echo  $url:$port/.m3u8,$result2 ;
  [ "$result2" -gt 0 ] && echo  $url:$port/.m3u8 >> tw.txt ;
done

url=$1
for port in `seq 8500 8800`;
do
  result2=`curl -m1 --connect-timeout 2 $url:$port/.m3u8 2>/dev/null |grep EXTM3U| wc -l`;
  echo  $url:$port/.m3u8,$result2 ;
  [ "$result2" -gt 0 ] && echo  $url:$port/.m3u8 >> tw.txt ;
done




for i in `seq 1 999`;
do
  url=http://122.140.20.203:9901/tsfile/live/`printf %04d $i`_1.m3u8
  result2=`curl -m1 --connect-timeout 2 $url 2>/dev/null |grep EXTM3U| wc -l`;
  echo  $url,$result2 ;
  [ "$result2" -gt 0 ] && echo  $url >> category/taiwan/203.txt ;
done
