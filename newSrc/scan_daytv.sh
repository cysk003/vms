
for i in `seq 1 1000`;
do
  url="http://183.0.186.193:8088/hls/$i/index.m3u8"
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  #echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url
  fi
done

140.238.51.187

for i in `seq 1 1000`;
do
  url="http://140.238.51.187:8080/hls/`printf %02d $i`/index.m3u8"
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  #echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url
  fi
done


183.0.186.193:8088

http://183.11.239.32:808/hls/1051/index.m3u8

http://171.38.148.173:9901/tsfile/live/1002_1.m3u8
for i in `seq 1 200`;
do
  url="http://171.38.148.173:9901/tsfile/live/`printf %04d $i`_1.m3u8"
  result=`curl -I  $url 2>/dev/null | grep "404"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> category/guangxi/qinzhou.txt
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
  url="http://110.72.64.57:808/hls/$id/index.m3u8"
  result=`curl -I $url 2>/dev/null| grep HTTP |awk '{print $2}'`
  echo $url, $result
  if [ "$result" = "200" ]; then
      echo $id,"$url" >> category/guangxi/pingnan.txt
  fi
done
http://110.72.64.57:808/hls/26/index.m3u8

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


for host in `seq 134 188`;
do
for id in `seq 1 255`;
do
  url="http://202.109.$host.$id:808/hls/1/index.m3u8"
  result=`curl --connect-timeout 1  $url 2>/dev/null|grep "\.ts" |wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/jiangxi/ip.txt
  fi
done
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

for id in `seq 200 300`;
do
  url="http://220.176.60.234:808/hls/$id/index.m3u8"
  result=`curl --connect-timeout 2 $url 2>/dev/null|grep "\.ts" |wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/jiangxi/yudu.txt
  url="http://183.0.186.207:8088/hls/$id/index.m3u8"
  result=`curl --connect-timeout 2 $url 2>/dev/null|grep "\.ts" |wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/guangdong/nanming.txt
  fi
done

http://60.26.15.147:9901/tsfile/live/0143_1.m3u8


http://27.47.68.3:808/hls/62/index.m3u8


http://122.140.20.203:9901/tsfile/live/5003_1.m3u8

for id in `seq 900 999`;
do
  url=http://114.228.15.158:9901/tsfile/live/`printf %04d $id`_1.m3u8
  result=`curl  $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/jiangsu/changzhou.txt
http://113.57.109.37:9901/tsfile/live/1018_1.m3u8
for id in `seq 1000 1299`;
do
  url=http://113.59.10.216:9901/tsfile/live/`printf %04d $id`_1.m3u8
  result=`curl  $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/hainan/danzhou.txt
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

for id in `seq 25192 29999`;
do
  tvid=`printf %05d $id`
  url="http://[2409:8087:4401:20:1:f01:1:11]/iptv.cdn.ha.chinamobile.com/PLTV/88888888/224/32212$tvid/index.m3u8"
  result=`curl  $url 2>/dev/null|grep "\.m3u8"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/henan/cdn.txt
  fi
done

for id in `seq 1 999`;
do
  tvid=`printf %03d $id`
  url="http://39.134.3.73:6610/000000001666/100000000100111$tvid/1.m3u8?IASHttpSessionId=OTT"
  result=`curl  $url 2>/dev/null|grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/chongqing/yishiteng.txt
  fi
done

吉州HD,http://218.204.153.158/10.m3u8

for id in `seq 8500 8799`;
do
  url=http://60.250.92.249:$id/.m3u8
  result=`curl  $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/taiwan/121.txt
  fi
done



for id in `seq 0 245`;
do
for host in `seq 1 255`;
do
  url=http://119.36.$id.$host:9901/tsfile/live/1009_1.m3u8
  result=`curl --connect-timeout 1 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id.$host,$url >> category/wuhan/ip.txt
  fi
done
done


for id in `seq 15 19`;
do
for host in `seq 1 255`;
do
  url=http://114.228.$id.$host:9901/tsfile/live/1009_1.m3u8
  result=`curl --connect-timeout 1 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id.$host,$url >> category/jiangsu/ip.txt
  fi
done
done

for i in `seq 1 1000`;
do
  url=http://39.134.32.102:6610/270000001111/111000`printf %04d $i`/index.m3u8?IASHttpSessionId=OTT
  result=`curl $url 2>/dev/null | grep -E "\.ts|m3u8"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id.$host,$url >> category/gansu/lanzhou_6610.txt
  fi
done


