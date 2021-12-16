#!/bin/bash

parseDetail(){
      url=$1
      title=$2
      listFile=$3
      group=$4

      page=$(curl $url 2>/dev/null|grep "\<a "|grep "DownSys"|sed 's/ /^|^/g')
      for detail in $page;
      do
        playUrl=$(echo "$detail"|awk -F '"' '{print $2}')
        playType=$(echo "$detail"|awk -F '>|<' '{print $3}')
        videoUrl=$(curl $playUrl 2>/dev/null|grep iframe|awk -F 'src="' '{print $2}'|awk -F'"' '{print $1}')
        if [ ! -z "$videoUrl" ]; then
          curl $videoUrl 2>/dev/null 1>/dev/null
          if [ "$?" == "0" ]; then
            realBaseUrl=${videoUrl%/share/*}
            m3u8File=$(curl $videoUrl 2>/dev/null|grep playlist |grep url|awk -F '"' '{print $4}')
            if [ ! -z "$m3u8File" ]; then
               echo $group,$title $playType,$realBaseUrl$m3u8File"?skip=1"|sed 's/ //g' >> $listFile
            else
               echo "$videoUrl 没找到m3u8"
            fi
          else
            echo "$videoUrl 访问不通"
          fi
        else
          m3u8File=$(curl $playUrl 2>/dev/null|grep video=|awk -F '->' '{print $1}'|awk -F"'" '{print $2}')
          if [ ! -z "$m3u8File" ]; then
            curl $m3u8File 2>/dev/null 1>/dev/null
            if [ "$?" == "0" ]; then
              echo $group,$title $playType,$m3u8File"?skip=1" >> $listFile
            else
              echo "$m3u8File 访问不通"
            fi
         fi
        fi
      done

}

outPageDetail(){
    baseUrl=$1
    listFile=$2
    extractFile=$3
    group=$4
    prefix=$baseUrl"/"
    postfix=".html"
    baseInfos=$(curl $baseUrl/$extractFile 2>/dev/null | grep "<a "|grep title|grep class=|grep "bookmark"|awk '{print $2"^|^"$5}')
    for baseInfo in $baseInfos
    do
      title=$(echo $baseInfo|awk -F'"' '{print $4}')
      [ -z "$title" ] && echo "title为空==>"$baseInfo
      url=$(echo $baseInfo |awk -F'"' '{print $2}')
      len=$(( ${#url}-${#postfix}-${#prefix} + 1 ))
      id=${url:$((${#prefix} - 1 )):$len}
      echo "开始-->$title:$url"
      parseDetail $url $title $listFile $group
    done
}

getPageList() {
  baseUrl=$1
  listFile=$2
  end=$3
  group=$4
  echo "抓取$baseUrl/index.html"
  outPageDetail $baseUrl $listFile "index.html" $group
  for i in `seq 2 $end`;
  do
      echo "抓取$baseUrl/index_$i.html"
      outPageDetail $baseUrl $listFile "index_$i.html"  $group
  done
}

#getPageList https://www.ai66.cc/kehuanpian/ ai66/kehuan.txt 38
#getPageList https://www.ai66.cc/xijupian/ ai66/xijupian.txt 92

getPageList https://www.ai66.cc/$1/ ai66/$1.txt $2 $3