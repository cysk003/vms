
list=$1
end=$2
outputFile=$3
group=$4

for i in `seq 1 $2`
do
listurl=https://www.zxzj.fun/list/$list-$i.html
curl $listurl 2>/dev/null|grep -oE "<a [^>]*>"|grep data-original|sed 's/.*href=\"//g;s/">//g;s/" data-original="/,/;s/" title="/,/g'|while read line;
do
  detailPath=`echo $line|awk -F"," '{print $1}'`
  title=`echo $line|awk -F"," '{print $2}'`
  image=`echo $line|awk -F"," '{print $3}'`
  detailId=`echo $detailPath|sed 's#/detail/##g;s/.html//g'`

  detailUrl="https://www.zxzj.fun$detailPath"
  #curl $detailUrl 2>/dev/null|grep -oE "<a[^>]*>"|grep $detailId"-1-"|sed 's/.*="//g;s/">//g'|uniq -c|awk '{print $2}'|while read subLine;

  curl $detailUrl 2>/dev/null|grep -oE "<a[^>]*>[^<]*"|grep $detailId"-1-"|grep -v "立即播放"|sed 's/.*="//g;s/">/,/g'|while read subLine;

  do
    echo $subLine
    videoPath=`echo $subLine|awk -F"," '{print $1}'`
    subTitle=`echo $subLine|awk -F"," '{print $2}'`
    if [[ "${subTitle:-1:1}" =~ "集" ]]; then
      group="$title"
    fi
    videoUrl=https://www.zxzj.fun$videoPath
    url=`curl $videoUrl  2>/dev/null|grep -oE "player_data={[^}]+}"|sed 's#.*"url":"##g;s/".*//g;s#\\\##g'`
    echo  "#EXTINF:-1 tvg-logo=\"$image\" group-title=\"$group\",$title $subTitle" >> $outputFile
    echo  $url >> $outputFile

  done
done
done
