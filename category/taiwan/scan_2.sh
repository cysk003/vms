for i in `seq 0 500`;
do
  url=http://fuck.ke22.aihost69.top/play/$i.m3u8
  echo "curl --connect-time 1 $url 2>/dev/null |grep http |grep -v ggiptv"
  result=`curl --connect-time 1 $url 2>/dev/null |grep http |grep -v ggiptv`
  echo $url, $result
  [ -n "$result" ] && echo $i,$url,$result >> category/taiwan/ke22.txt
done