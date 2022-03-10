http://59.125.98.75:80
http://59.125.98.83:80
http://59.125.101.187:80
http://59.125.101.188:80
http://59.125.122.90:80
http://59.125.120.183:80
http://59.125.123.124:80
url=60.251.33.252
for port in `seq 8500 8800`;
do
  result2=`curl -m1 --connect-timeout 2 $url:$port/http/116.50.42.19:8081/hls/71/813/ch43http/live.m3u8 2>/dev/null |grep EXTM3U| wc -l`;
  echo  $url:$port/.m3u8,$result2 ;
  [ "$result2" -gt 0 ] && echo  $url:$port/.m3u8 >> tw.txt ;
done
url=60.251.59.179
for port in `seq 8500 8800`;
do
  result2=`curl -m1 --connect-timeout 2 $url:$port/http/116.50.42.19:8081/hls/71/813/ch43http/live.m3u8 2>/dev/null |grep '/'| wc -l`;
  echo  $url:$port/.m3u8,$result2 ;
  [ "$result2" -gt 0 ] && echo  $url:$port/.m3u8 >> tw.txt ;
done

http://211.23.114.106:8558

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
