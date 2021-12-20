
for i in `seq 5000 6999`;
do
  tvid=`printf %04d $i`
  addr=129.226.106.4/zycfcdn.gdwlcloud.com
  originUrl="http://$addr/PLTV/88888888/224/322122$tvid/index.m3u8"
  result=$(curl $originUrl  2>/dev/null|wc -l)
  echo 322122$tvid,$result
  if [ "$result" -gt 0 ]; then
     echo 322122$tvid,$originUrl >> qinlin.txt
  fi
done
