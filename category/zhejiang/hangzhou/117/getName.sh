
fileName=$1
outputFile=${2:-default.txt}

CWD=$(cd `dirname $0`;pwd)


while read line
do
    id=`echo ${line}|awk -F"/" '{print $7;}'`
    name=`grep "$id" $CWD/name_mapper.txt|head -1|awk -F"," '{print$1}'`
    record=`echo $line|awk -F"," '{print $2}'`
    if [ ! -z "$name" ]; then
       echo $name,$record >> $outputFile

    else
      echo  $id,${line}
    fi
done < $fileName