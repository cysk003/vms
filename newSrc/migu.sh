
id=$1
title=$2
outputFile=$3
curl "https://webapi.miguvideo.com/gateway/playurl/v3/play/playurl?contId=$id&rateType=3&startPlay=true" 2>/dev/null | grep -oE "subcollectionList\":\[[^]]*\]" |gsed 's#"},{"#\n#g;s/"}]//g;s#subcollectionList"\:\[{"##g;s/index"\://g;s/"subSetId"\:"//g' |awk  -F"," -v title="$title" '{print title","title"第"$1"集,http://112.74.200.9:88/tv000000/m3u8.php?/migu/"$2;}'