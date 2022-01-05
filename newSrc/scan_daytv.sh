
for i in `seq 101 500`;
do
  url="http://play01.everydaytv.top/etv/iptv/3/$i/0.flv?token=2022"
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> newSrc/everydaytv.txt
  fi
done

for i in `seq 1 500`;
do
  url="http://116.23.97.203:808/hls/$i/index.m3u8"
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> newSrc/guangdong.txt
  fi
done

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
for i in `seq 1 500`;
do
  url="http://58.244.50.82:808/hls/$i/index.m3u8"
  result=`curl -I  $url 2>/dev/null | grep "404 Not"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> newSrc/changchun.txt
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

for i in `seq 27000 27500`;
do
  tvid=`printf %5d $i`
  url="http://39.135.129.166/PLTV/88888888/224/32212$tvid/index.m3u8"
  result=`curl $url 2>/dev/null| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $i,"$url" >> category/liaoning/chaoyang.txt
  fi
done



