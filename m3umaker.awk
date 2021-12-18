BEGIN{
FS=",";
  map["CCTV"] = "央视"
  map["CGTN"] = "央视"
  map["少儿"] = "少儿动漫"
  map["卡通"] = "少儿动漫"
  map["动画"] = "少儿动漫"
  map["动漫"] = "少儿动漫"
  map["影"] = "影视"
  map["剧"] = "影视"
  map["科教"] = "教育科学"
  map["科学"] = "教育科学"
  map["教育"] = "教育科学"
  map["探索"] = "教育科学"
  map["地理"] = "教育科学"
  map["奇观"] = "教育科学"
  map["纪录片"] = "教育科学"
  map["国学"] = "教育科学"
  map["Sports"] = "体育"
  map["足球"] = "体育"
  map["篮球"] = "体育"
  map["台球"] = "体育"
  map["体育"] = "体育"
  map["财经"] = "财经"
  map["商务"] = "财经"
  map["游戏"] = "娱乐"
  map["棋牌"] = "娱乐"
  map["旅游"] = "娱乐"
  map["凤凰"] = "香港"
  map["香港"] = "香港"
  map["长春"] = "地方"
  map["深圳"] = "地方"
  map["北京"] = "地方"
  map["吉林"] = "地方"
  map["辽宁"] = "地方"
  map["河北"] = "地方"
  map["河南"] = "地方"
  map["沈阳"] = "地方"
  map["湖南"] = "地方"
  map["江苏"] = "地方"
  map["安徽"] = "地方"
  map["上海"] = "地方"
  map["卫视"] = "卫视"
}
!/^($|[:space:]*#)/{
    group=""
    name=$1
    urls=$2
    if (NF == 3){
        group=$1
        name=$2
        urls=$3
    }

    split(name, arr, " ");
    title = arr[1];
    gsub(" ","",title)
    gsub("|","",title)
    gsub("&","",title)

    cmd="cat ./customer_logo_info.txt ./epg51zmt.txt|grep "title"|head -1"
    result=""
    id=""
    logo=""
    tagName=""
    while ( ( cmd | getline result ) > 0 ) {
    }
    close(cmd);
    if (result != ""){
        split(result, array, " ")
        id = array[1]
        logo = array[2]
        tagName = array[3]
        if (group == ""){
          group = array[5]
        }
        split(urls, urlarray, "#")
        for( idx in urlarray) {
            url = urlarray[idx]
            gsub(" ","",url)
            if (id) {
                print "#EXTINF:-1 tvg-id=\""id"\" tvg-name=\""tagName"\" tvg-logo=\""logo"\"  group-title=\""group"\","name"\n"url;
            } else {
                print "#EXTINF:-1 group-title=\""group"\","name"\n"url;
            }
        }
    } else {
     if (group == ""){
       group = "其他";
       for (key in map) {
         if (index($1, key) > 0 ){
          group = map[key];
          break;
         }
       }
    }
    split(urls, urlarray, "#")
    for( idx in urlarray) {
       url = urlarray[idx]
       gsub(" ","",url)
     if (id) {
       print "#EXTINF:-1 tvg-id=\""id"\" tvg-name=\"""\" tvg-logo=\""logo"\"  group-title=\""group"\","name"\n"url;
     } else {
       print "#EXTINF:-1  group-title=\""group"\","name"\n"url;
     }
     }
    }
}

END{
}