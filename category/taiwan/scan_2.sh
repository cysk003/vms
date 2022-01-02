for i in `seq 0 500`;
do
  url=http://fuck.ke22.aihost69.top/play/$i.m3u8
  echo "curl --connect-time 1 $url 2>/dev/null |grep http |grep -v ggiptv"
  result=`curl --connect-time 1 $url 2>/dev/null |grep http |grep -v ggiptv`
  echo $url, $result
  [ -n "$result" ] && echo $i,$url,$result >> category/taiwan/ke22.txt
done


for i in `seq 0 500`;
do
  id=`printf %03d $i`
  url="http://116.199.5.51:8114/hls/Fsv_chan_hls_se_idx=${id}&FvSeid=1&Fsv_ctype=LIVES&Fsv_otype=1&Provider_id=0&Pcontent_id=8114.m3u8"
  result=`curl -I --connect-time 1 $url 2>/dev/null |grep "404 Not Found" | wc -l`
  echo $url, $result
  [  "$result" -eq 0 ] && echo $i,$url,$result >> category/taiwan/gd.txt
done


