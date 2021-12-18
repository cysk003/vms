
fileName=$1

CWD=$(cd `dirname $0`;pwd)


while read line
do
    url=`echo $line|sed 's/?.*//g'`
    result=`curl -I --connect-timeout 1 $url 2>/dev/null|grep "404 Not Found"|wc -l`
     echo $url
      curl -I --connect-timeout 1 $url 2>/dev/null
    if [ "0" = "$result" ]; then
      echo `echo $line|sed 's/?.*//g'` "存在"
      echo `echo $line|sed 's/?.*//g'` > new_scan.txt
   # else
    #  echo `echo $line|sed 's/?.*//g'` "不存在"
    fi
done < $fileName