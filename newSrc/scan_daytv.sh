
for i in `seq 101 500`;
do
  url="http://play01.everydaytv.top/etv/iptv/3/$i/0.flv?token=2022"
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> newSrc/everydaytv.txt
  fi
done

for i in `seq 1 999`;
do
  url="http://60.26.15.147:9901/tsfile/live/`printf %04d $i`_1.m3u8"
  result=`curl -I  $url 2>/dev/null | grep "404"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> category/baodi.txt
  fi
done


http://60.26.15.147:9901/tsfile/live/0136_1.m3u8

for i in `seq 25310 29999`;
do
  tvid=`printf %5d $i`
  url="http://39.134.67.226/PLTV/88888888/224/32212$tvid/index.m3u8"
  result=`https --headers $url 2>/dev/null |grep "HTTP/1.1"|awk  '{print $2}' `
  echo $url, $result
  if [ "$result" = "200" -o "$result" = "302" ]; then
      echo $i,$url >> newSrc/harebing.txt
  fi
done

for i in `seq 25400 25999`;
do
  tvid=`printf %5d $i`
  url="http://39.134.65.230/PLTV/88888888/224/32212$tvid/index.m3u8"
  result=`curl $url 2>/dev/null| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $i,$url >> newSrc/harebing.txt
  fi
done

cat newSrc/harebing.txt| while read -r line
do
  url=$(echo $line |awk -F"," '{print $2}')
  result=`curl $url 2>/dev/null|wc -l`
  if [ "$result" -gt 0 ]; then
     echo "$line" >> newSrc/harebing2.txt
  else
    echo "$line"
  fi
done < newSrc/harebing.txt


http://58.244.50.82:808/hls/51/index.m3u8
for i in `seq 1 9999`;
do
  tvid=`printf %04d $i`
  url="http://live.aishang.ctlcdn.com/0000011024${tvid}_1/encoder/0/playlist.m3u8?CONTENTID=0000011024${tvid}_1&AUTHINFO=FABqh274XDn8fkurD5614t%2B1RvYajgx%2Ba3PxUJe1SMO4OjrtFitM6ZQbSJEFffaD35hOAhZdTXOrK0W8QvBRom%2BXaXZYzB%2FQfYjeYzGgKhP%2Fdo%2BXpr4quVxlkA%2BubKvbU1XwJFRgrbX%2BnTs60JauQUrav8kLj%2FPH8LxkDFpzvkq75UfeY%2FVNDZygRZLw4j%2BXtwhj%2FIuXf1hJAU0X%2BheT7g%3D%3D&USERTOKEN=eHKuwve%2F35NVIR5qsO5XsuB0O2BhR0KR"
  result=`curl -I  $url 2>/dev/null | grep "200 OK"|wc -l`
  echo $url, $result
  url="http://live.aishang.ctlcdn.com/0000011024${tvid}_1/playlist.m3u8?CONTENTID=0000011024${tvid}_1&AUTHINFO=FABqh274XDn8fkurD5614t%2B1RvYajgx%2Ba3PxUJe1SMO4OjrtFitM6ZQbSJEFffaD35hOAhZdTXOrK0W8QvBRom%2BXaXZYzB%2FQfYjeYzGgKhP%2Fdo%2BXpr4quVxlkA%2BubKvbU1XwJFRgrbX%2BnTs60JauQUrav8kLj%2FPH8LxkDFpzvkq75UfeY%2FVNDZygRZLw4j%2BXtwhj%2FIuXf1hJAU0X%2BheT7g%3D%3D&USERTOKEN=eHKuwve%2F35NVIR5qsO5XsuB0O2BhR0KR"
  if [ $result -gt 1 ]; then
      echo $i,$url >> category/aishang/id.txt
  fi
done

http://58.244.50.82:808/hls/51/index.m3u8
for i in `seq 700 900`;
do
  id=`printf %03d $i`
  url="http://stream.slave.jxtvnet.tv:14311/playurl?accesstoken=R609DF27DU30963004K77360366I5D0110ACPBM356F868V0Z57EA5W167ED2234F88A5EE&playtype=live&protocol=http&playtoken=ABCDEFGH&auth=no&programid=4200000$id"
  result=` https --headers  $url 2>/dev/null | grep "200 OK"|wc -l`
  echo $url, $result
  if [ $result -eq 1 ]; then
      echo $i,$url >> newSrc/jiangxi.txt
  fi
done

for id in `seq 1000 1050`;
do
  url=http://60.26.13.217:9901/tsfile/live/${id}_1.m3u8
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $id,$url >> category/shandong/jinan.txt
  fi
done

http://60.26.13.217:9901/tsfile/live/1001_1.m3u8


for i in `seq 27000 27999`;
do
  tvid=`printf %5d $i`
  url="http://211.94.219.169:18080/PLTV/68/224/32212$tvid/index.m3u8"
  result=`curl $url 2>/dev/null| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $i,$url >> category/tianjin/tianjin_liantong.txt
  fi
done


for i in `seq 25800 26999`;
do
  tvid=`printf %5d $i`
  url="http://211.94.219.169:18080/PLTV/68/224/32212$tvid/index.m3u8"
  result=`curl $url 2>/dev/null|grep "hls.ts"| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $i,"http://211.94.219.169:18080/PLTV/68/224/32212$tvid/index.m3u8" >> category/tianjin/tianjin_liantong.txt
  fi
done

for i in `seq 25000 29000`;
do
  tvid=`printf %5d $i`
  url="http://39.135.46.246:6610/PLTV/77777777/224/32212$tvid/index.m3u8?IASHttpSessionId=OTT10201320220107075958000779"
  result=`curl $url 2>/dev/null| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $i,"$url" >> category/guangxi/guilin.txt
  fi
done

http://39.135.46.246:6610/PLTV/77777777/224/3221225923/index.m3u8?

for id in `seq 3000 3500`;
do
  url="http://180.97.123.180/1301-txt.otvstream.otvcloud.com/otv/skcc/live/channel$id/index.m3u8"
  result=`curl -I $url 2>/dev/null| grep HTTP |awk '{print $2}'`
  echo $url, $result
  if [ "$result" = "200" ]; then
      echo $id,"$url" >> newSrc/otvcloud2.txt
  fi
done

#48 67,68,70
for id in `seq 1 999`;
do
  url="http://223.241.17.48:808/hls/$id/index.m3u8"
  result=`curl -I $url 2>/dev/null| grep HTTP |awk '{print $2}'`
  echo $url, $result
  if [ "$result" = "200" ]; then
      echo $id,"$url" >> category/anhui/bozhou.txt
  fi


http://123.147.77.225:9901/tsfile/live/0001_1.m3u8

for id in `seq 1 999`;
do
  url="http://219.150.217.47:6610/PLTV1/$id/index.m3u8?icpid=dxrm1&servicetype=1&IASHttpSessionId=OTT"
  result=`curl --connect-timeout 1 $url 2>/dev/null | wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/henan/xinxiang.txt
  fi
done



curl http://180.97.123.180/1301-txt.otvstream.otvcloud.com/otv/skcc/live/channel15/index.m3u8 -I
http://123.147.77.225:9901/tsfile/live/0001_1.m3u8

for host in `seq 100 255`;
do
for id in `seq 1 255`;
do
  url="http://27.39.$host.$id:9901/tsfile/live/1001_1.m3u8"
  result=`curl --connect-timeout 1 -I $url 2>/dev/null|grep -E "404|200|302"|wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/guangdong/meizhou.txt
  fi
done
http://iptv.eatuo.com:9901/tsfile/live/1035_1.m3u8
done
http://iptv.eatuo.com:9901/tsfile/live/1035_1.m3u8
for id in `seq 105 255`;
do
  url="http://27.39.1.$id:9901/tsfile/live/1001_1.m3u8"
  result=`curl --connect-timeout 1 $url 2>/dev/null|grep "\.ts" |wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/guangdong/meizhou.txt
  fi
done

for id in `seq 1 200`;
do
  url="http://113.64.147.7:808/hls/$id/index.m3u8"
  result=`curl --connect-timeout 2 $url 2>/dev/null|grep "\.ts" |wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/guangdong/206.txt
  fi
done

http://60.26.15.147:9901/tsfile/live/0143_1.m3u8


http://27.47.68.3:808/hls/62/index.m3u8


http://122.140.20.203:9901/tsfile/live/5003_1.m3u8

for id in `seq 1000 1299`;
do
  url=http://iptv.eatuo.com:9901/tsfile/live/`printf %04d $id`_1.m3u8
  result=`curl  $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/guangdong/meizhou.txt
  fi
done


for id in `seq 10000 13999`;
do
  tvid=`printf %05d $id`
  url="http://[2409:8087:5e01:34::21]:6610/ZTE_CMS/089844000000000600000000000$tvid/index.m3u8?IAS=&IASHttpSessionId=OTT2821120220115111210006281"
  result=`curl  $url 2>/dev/null|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/hainan/iptv6.txt
  fi
done