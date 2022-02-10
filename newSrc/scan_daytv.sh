

http://58.244.52.205:808/hls/65/index.m3u8
for i in `seq 1000 1999`;
do
  url="http://y3y4.f3322.net:808/hls/$i/index.m3u8"
  result=`curl  $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $i,$url  >> category/guangdong/maoming.txt
  fi
done


http://112.102.234.185:807/hls/215/index.m3u8


140.238.51.187
http://58.244.55.121:808/hls/20/index.m3u8
http://58.245.3.72:808/hls/20/index.m3u8
http://42.176.185.28:9901/tsfile/live/0001_1.m3u8
124.238.99.44

110.72.68.1
http://110.72.59.10:808/hls/3/index.m3u8
http://110.72.58.13:808/hls/3/index.m3u8
http://110.72.58.57:808/hls/3/index.m3u8
http://110.72.62.14:808/hls/3/index.m3u8
http://110.72.52.28:808/hls/3/index.m3u8
http://110.72.52.66:808/hls/3/index.m3u8
http://110.72.61.28:808/hls/3/index.m3u8
http://110.72.61.72:808/hls/3/index.m3u8
http://110.72.53.40:808/hls/3/index.m3u8
http://110.72.63.62:808/hls/3/index.m3u8
http://110.72.53.78:808/hls/3/index.m3u8
http://110.72.69.83:808/hls/3/index.m3u8
http://110.72.56.84:808/hls/3/index.m3u8
http://110.72.56.92:808/hls/3/index.m3u8
http://110.72.53.99:808/hls/1/index.m3u8
http://110.72.35.93:808/hls/77/index.m3u8
http://110.72.54.90:808/hls/1/index.m3u8
http://110.72.34.84:808/hls/3/index.m3u8  404
http://110.72.35.82:808/hls/73/index.m3u8 404
http://110.72.22.79:808/hls/110/index.m3u8 404
http://110.72.30.66:808/hls/11/index.m3u8 404

http://110.72.3.129:808/hls/3/index.m3u8

http://110.72.28.61:808/hls/1/index.m3u8
http://110.72.53.67:808/hls/1/index.m3u8
http://110.72.62.55:808/hls/3/index.m3u8
http://110.72.45.41:808/hls/3/index.m3u8
http://110.72.20.39:808/hls/3/index.m3u8
http://110.72.16.36:808/hls/3/index.m3u8
http://110.72.67.29:808/hls/3/index.m3u8
http://110.72.58.28:808/hls/3/index.m3u8
http://110.72.59.25:808/hls/3/index.m3u8
http://110.72.60.25:808/hls/3/index.m3u8
http://110.72.71.16:808/hls/3/index.m3u8
http://110.72.61.15:808/hls/3/index.m3u8
http://110.72.38.113:808/hls/3/index.m3u8
http://110.72.61.109:808/hls/3/index.m3u8
http://110.72.4.107:808/hls/3/index.m3u8
http://110.72.2.114:808/hls/3/index.m3u8
http://110.72.53.132:808/hls/3/index.m3u8
http://110.72.56.125:808/hls/3/index.m3u8
http://110.72.59.124:808/hls/3/index.m3u8
http://110.72.57.127:808/hls/3/index.m3u8

http://110.72.60.94:808/hls/3/index.m3u8
http://110.72.59.95:808/hls/3/index.m3u8
http://110.72.63.98:808/hls/3/index.m3u8
http://110.72.52.112:808/hls/3/index.m3u8
http://110.72.52.111:808/hls/3/index.m3u8
http://110.72.58.123:808/hls/3/index.m3u8
http://110.72.65.122:808/hls/3/index.m3u8
http://110.72.59.130:808/hls/3/index.m3u8 == 200
http://110.72.55.159:808/hls/3/index.m3u8
http://110.72.61.150:808/hls/3/index.m3u8
http://110.72.76.96:808/hls/3/index.m3u8
http://110.72.74.98:808/hls/3/index.m3u8
http://110.72.78.204:808/hls/3/index.m3u8
for i in `seq 1 1000`;
do
  url="http://121.24.99.29:808/hls/$i/index.m3u8"
  result=`curl --connect-timeout 5 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $i,$url >> category/hebei/xingtai_2.txt
  fi
done

http://110.72.35.82:808/tsfile/live/0001_1.m3u8

for i in `seq 1 1000`;
do
  url="http://27.47.68.82:808/hls/$i/index.m3u8"
  result=`curl --connect-timeout 1 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $i,$url >> category/guangdong/jieyang.txt
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

for i in `seq 25500 28999`;
do
  tvid=`printf %5d $i`
  url="http://39.135.189.210/TVOD/3/224/32212$tvid/index.m3u8"
  result=`curl $url 2>/dev/null| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $i,$url >> newSrc/shanxi.txt
  fi
done

http://39.135.189.210/PLTV/88888888/224/3221226911/index.m3u8

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
3221225717
for id in `seq 25000 29999`;
do
  tvid=`printf %05d $id`
  url="http://111.12.101.23:6610/PLTV/77777777/224/32212$tvid/index.m3u8?"
  testurl="http://111.12.101.23:6610/PLTV/77777777/224/32212$tvid/index.m3u8?IASHttpSessionId=OTT2912420220129161644001282"
  result=`curl  $testurl 2>/dev/null|grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/guangdong/zhujiang.txt
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
  url=http://113.57.109.37:9901/tsfile/live/1009_1.m3u8
  result=`curl --connect-timeout 1 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id.$host,$url >> category/jiangsu/ip.txt
  fi
done
done
http://115.52.173.172:9901/tsfile/live/0001_1.m3u8
http://115.48.163.208:9901/tsfile/live/0001_1.m3u8

http://115.56.40.73:9901/tsfile/live/0001_1.m3u8
http://115.56.56.214:9901/tsfile/live/0001_1.m3u8
http://115.61.134.170:9901/tsfile/live/0001_1.m3u8
http://115.61.211.211:9901/tsfile/live/0001_1.m3u8
http://58.20.64.205:9901/tsfile/live/0001_1.m3u8
http://123.10.17.242:9901/tsfile/live/0001_1.m3u8
http://123.10.23.159:9901/tsfile/live/0001_1.m3u8
http://123.10.34.34:9901/tsfile/live/0001_1.m3u8
http://123.11.38.179:9901/tsfile/live/0001_1.m3u8
http://58.20.64.205:9901/tsfile/live/0001_1.m3u8
http://58.20.156.136:9901/tsfile/live/0001_1.m3u8
http://58.20.161.33:9901/tsfile/live/0001_1.m3u8
http://106.35.22.83:9901/tsfile/live/0001_1.m3u8 //内蒙古赤峰
http://171.116.157.79:9901/tsfile/live/0001_1.m3u8
http://171.116.159.84:9901/tsfile/live/0001_1.m3u8
http://171.117.68.223:9901/tsfile/live/0001_1.m3u8
http://171.117.203.61:9901/tsfile/live/0001_1.m3u8
http://58.18.134.142:9901/tsfile/live/0001_1.m3u8
http://58.244.35.245:9901/tsfile/live/0001_1.m3u8
http://171.124.56.217:9901/tsfile/live/0001_1.m3u8
http://171.127.229.140:9901/tsfile/live/0001_1.m3u8
http://171.127.229.150:9901/tsfile/live/0001_1.m3u8
http://171.127.229.157:9901/tsfile/live/0001_1.m3u8
http://171.127.229.162:9901/tsfile/live/0001_1.m3u8
http://171.127.229.167:9901/tsfile/live/0001_1.m3u8
http://60.2.194.238:9901/tsfile/live/0001_1.m3u8
http://60.4.9.89:9901/tsfile/live/0001_1.m3u8
http://60.4.9.103:9901/tsfile/live/0001_1.m3u8
http://171.117.71.107:9901/tsfile/live/0001_1.m3u8
http://60.223.94.145:9901/tsfile/live/0001_1.m3u8
http://122.139.172.158:9901/tsfile/live/0001_1.m3u8
http://122.140.21.10:9901/tsfile/live/0001_1.m3u8
http://122.140.21.51:9901/tsfile/live/0001_1.m3u8
http://122.140.22.142:9901/tsfile/live/0001_1.m3u8
http://122.140.20.136:9901/tsfile/live/0001_1.m3u8
http://42.176.185.28:9901/tsfile/live/0001_1.m3u8
http://125.107.58.146:9901/tsfile/live/0007_1.m3u8
http://125.107.94.200:9901/tsfile/live/1001_1.m3u8
http://125.107.22.229:9901/tsfile/live/1001_1.m3u8
http://125.107.91.76:9901/tsfile/live/1001_1.m3u8
for id in `seq 1 200` `seq 1000 1299` ;
do
  url="http://106.115.24.29:9901/tsfile/live/`printf %04d $id`_1.m3u8"
  result=`curl --connect-timeout 1 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/hebei/handan_weixian.txt
  fi
done      
http://119.39.192.8:9901/tsfile/live/0001_1.m3u8
http://119.39.192.28:9901/tsfile/live/0001_1.m3u8
http://119.39.192.42:9901/tsfile/live/0001_1.m3u8
http://119.39.192.49:9901/tsfile/live/0001_1.m3u8
http://119.39.192.52:9901/tsfile/live/0001_1.m3u8
http://119.39.192.54:9901/tsfile/live/0001_1.m3u8
http://119.39.192.59:9901/tsfile/live/0001_1.m3u8
http://119.39.192.61:9901/tsfile/live/0001_1.m3u8
http://119.39.192.76:9901/tsfile/live/0001_1.m3u8
http://119.39.192.84:9901/tsfile/live/0001_1.m3u8
http://119.39.192.97:9901/tsfile/live/0001_1.m3u8
http://119.39.192.98:9901/tsfile/live/0001_1.m3u8
http://119.39.192.120:9901/tsfile/live/0001_1.m3u8
http://119.39.192.131:9901/tsfile/live/0001_1.m3u8
http://119.39.192.135:9901/tsfile/live/0001_1.m3u8
http://119.39.192.141:9901/tsfile/live/0001_1.m3u8
http://119.39.192.149:9901/tsfile/live/0001_1.m3u8
http://119.39.192.153:9901/tsfile/live/0001_1.m3u8
http://119.39.192.166:9901/tsfile/live/0001_1.m3u8
http://119.39.192.180:9901/tsfile/live/0001_1.m3u8
http://119.39.192.204:9901/tsfile/live/0001_1.m3u8
http://119.39.192.217:9901/tsfile/live/0001_1.m3u8
http://119.39.192.233:9901/tsfile/live/0001_1.m3u8
http://119.39.192.247:9901/tsfile/live/0001_1.m3u8
http://119.39.192.252:9901/tsfile/live/0001_1.m3u8
http://119.39.192.254:9901/tsfile/live/0001_1.m3u8
http://119.39.198.36:9901/tsfile/live/0001_1.m3u8 //益阳市赫山区
http://119.39.198.59:9901/tsfile/live/0001_1.m3u8
http://119.39.198.75:9901/tsfile/live/0001_1.m3u8
http://119.39.198.242:9901/tsfile/live/0001_1.m3u8
http://119.39.198.114:9901/tsfile/live/0001_1.m3u8
http://119.39.198.139:9901/tsfile/live/0001_1.m3u8
http://119.39.199.191:9901/tsfile/live/0001_1.m3u8
http://119.39.199.110:9901/tsfile/live/0001_1.m3u8 //湖南省益阳市 联通
http://119.39.199.235:9901/tsfile/live/0001_1.m3u8
http://122.230.104.15:9901/tsfile/live/1000_1.m3u8
for host in 42 49 52 54 59 61 76 84 97 98 120 131 135 141 149 153 166 180 204 217 233 247 252 254;
do
for id in `seq 1 500` `seq 1000 1299` ;
do
  url=http://119.39.192.84:9901/tsfile/live/`printf %04d $id`_1.m3u8
  result=`curl --connect-timeout 1 $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/hunan/loudi_xinhua.txt
  fi
done
done

http://115.58.243.59:9901/tsfile/live/0001_1.m3u8


for i in `seq 1 1000`;
do
  url=http://39.134.32.102:6610/270000001111/111000`printf %04d $i`/index.m3u8?IASHttpSessionId=OTT
  result=`curl $url 2>/dev/null | grep -E "\.ts|m3u8"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id.$host,$url >> category/gansu/lanzhou_6610.txt
  fi
done


for id in `seq 8500 8900`;
do
  url=http://211.23.114.106:$id/.m3u8
  result=`curl  $url 2>/dev/null | grep "\.ts"|wc -l`
  echo $url, $result
  if [ $result -gt 0 ]; then
      echo $id,$url >> category/taiwan/211.txt
  fi
done


for id in `seq 8400 8499`;
do
  url="http://59.125.101.187:$id/.m3u8"
  result=`curl $url 2>/dev/null|grep -E "\.ts"|wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/taiwan/59.125.txt
  fi
done

for id in `seq 1 500`;
do
  url="http://dllb.jxin122.top/jj.php?id=$id&p=0&c=3&key=ced06b227baa54c961d63cc2c09dbc52"
  result=`curl --connect-timeout 1 -m 5 -I $url 2>/dev/null|grep -E "location: http"| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/taiwan/jxin.txt
  fi
done

http://211.23.114.106:%s/.m3u8

WLDY|8555||20|超高清||
HMC|8554||20|超高清||



for id in `seq 326 999`;
do
  tvid=`printf %03d $id`
  url="http://58.99.33.16:1935/liveedge17/live_${tvid}_3.stream/chunklist.m3u8"
  result=`curl --connect-timeout 1 -m 5  $url 2>/dev/null|grep  "\.ts"| wc -l`
  echo $url, $result
  if [ "$result" -gt 0 ]; then
      echo $id,"$url" >> category/taiwan/liveedge.txt
  fi
done

