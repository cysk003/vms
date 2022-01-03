
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

for i in `seq 25000 29999`;
do
  tvid=`printf %5d $i`
  url="http://111.12.101.13:6610/PLTV/77777777/224/32212$tvid/index.m3u8?"
  realUrl=`curl -I  $url 2>/dev/null |grep Location|awk  '{print $2}' `

  result=`https --headers $realUrl |grep "404 Not Found"|wc -l`
  echo $url, $result
  if [ $result -eq 0 ]; then
      echo $i,$url >> newSrc/guangdong.txt
  fi
done


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