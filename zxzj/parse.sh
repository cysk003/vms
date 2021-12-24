
list=1
outputFile=$2
group=$3

for i in `seq 1 103`
do
list=https://www.zxzj.fun/list/1-$i.html
curl $list 2>/dev/null|grep -oE "<a [^>]*>"|grep data-original|sed 's/.*href=\"//g;s/">//g;s/" data-original="/,/;s/" title="/,/g'|while read line;
do
  detailPath=`echo $line|awk -F"," '{print $1}'`
  title=`echo $line|awk -F"," '{print $2}'`
  image=`echo $line|awk -F"," '{print $3}'`
  detailId=`echo $detailPath|sed 's#/detail/##g;s/.html//g'`

  detailUrl="https://www.zxzj.fun$detailPath"
  curl $detailUrl 2>/dev/null|grep -oE "<a[^>]*>"|grep $detailId"-1-"|sed 's/.*="//g;s/">//g'|uniq -c|awk '{print $2}'|while read subLine;
  do
    echo $subLine
    videoPath=$subLine
    videoUrl=https://www.zxzj.fun$videoPath
    url=`curl $videoUrl  2>/dev/null|grep -oE "player_data={[^}]+}"|sed 's#.*"url":"##g;s/".*//g;s#\\\##g'`
    echo  "#EXTINF:-1 tvg-logo=\"$image\" group-title=\"$group\",$title" >> $outputFile
    echo  $url >> $outputFile

  done
done
done
