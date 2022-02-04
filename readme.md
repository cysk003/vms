
 for i in `seq 1 18`; echo "#EXTINF:-1 group-title=\"宝宝巴士启蒙音乐剧之汽车帮帮队\",宝宝巴士启蒙音乐剧之汽车帮帮队第$i集\nhttp://192.168.50.223:8880/vipx?url=https://www.jpysvip.net/vodplay/145341-1-$i.html"

# 影音资源
## 常规操作
### 提取url资源
```
 cat cmvideo.php|grep -E "url|tvg-name"|awk '{tmp=$0;getline;tmp=tmp$0;print tmp;}'|awk -F'"' '{print $8","$4}'  > cmvideo.txt
```
### 从txt生成代码 生成logo id 信息表
```
curl "http://epg.51zmt.top:8000/" |awk -f parseTvInfo.awk > epg51zmt.txt
```
### 源文件配置
参考src， name, 源地址
### 生成m3u8
```
awk -f m3umaker.awk src.txt
```
### 过滤一些杂的字符
```
 cat newtv.txt|grep -v "#__#"|grep -v "^$"|awk -f m3umaker.awk
```
### 排序
```
 cat newtv.txt|grep -v "#__#"|grep -v "#genre#"|sort -t "," -k1 > newtv.txt.bak
```
详情
https://www.zxzj.fun/video/3620-1-1.html
curl grep -oP "player_data={[^}]*}"|sed 's/^.*"url":"//g;s#\\/#/#g;s/",.*"}$//g'
剧集
grep -oP "<a[^>]*>[^<]*"|grep title|grep data-origina
页数
https://www.zxzj.fun/list/1-5.html

和zxzj一样
https://www.pianba.net/yun/187142-4-1.html
## 中国新闻与电视
1. [老生常谈云媒体，党和人民在一起](https://laosheng.top/fly/)
2. [国内地方台2021-10.txt](https://github.com/wmenjoy-music/vms/files/7512001/2021-10.txt)
3. [logo](https://www.lyngsat-logo.com/tvcountry/China.html)

##  获取虎牙的列表
 cat 1.json|sed 's/getLiveListJsonpCallback(//g;s/)//g'|jq|grep -E "channel|roomName"

## 测试网络
1. [网络连通性测试](https://m.17ce.com/site/http)
cat 1.txt|grep -oE "subcollectionList\":\[[^]]*\]"|gsed 's#"},{"#\n#g;s/"}]//g;s#subcollectionList"\:\[{"##g;s/index"\://g;s/"subSetId"\:"//g'|awk -F"," '{print "巴巴爸爸,巴巴爸爸第"$1"集,http://112.74.200.9:88/tv000000/m3u8.php?/migu/"$2}' >> dm.txt
