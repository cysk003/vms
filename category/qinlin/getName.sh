
fileName=$1
outputFile=${2:-default.txt}

CWD=$(cd `dirname $0`;pwd)


while read line
do
    id=`echo ${line}|awk -F"/" '{print $8;}'`
    name=`grep "$id" $CWD/src.txt|head -1|awk -F"," '{print$1}'`
    record=`echo $line|awk -F"," '{print $2}'`
    if [  -z "$name" ]; then
       ##echo $name,$record >> $outputFile

    #else
      echo  $name,${line}
   # else
    #  echo $name,$record
    fi
done < $fileName