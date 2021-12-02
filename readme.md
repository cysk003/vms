# 影音资源
 cat cmvideo.php|grep -E "url|tvg-name"|awk '{tmp=$0;getline;tmp=tmp$0;print tmp;}'|awk -F'"' '{print $8","$4}'  > cmvideo.txt
# 从txt生成代码
# 生成logo id 信息表
curl "http://epg.51zmt.top:8000/" |awk -f parseTvInfo.awk > epg51zmt.txt
# 源文件配置
参考src， name, 源地址
# 生成m3u8
awk -f m3umaker.awk src.txt
# 过滤一些杂的字符
 cat newtv.txt|grep -v "#__#"|grep -v "^$"|awk -f m3umaker.awk

 # 排序
 cat newtv.txt|grep -v "#__#"|grep -v "#genre#"|sort -t "," -k1 > newtv.txt.bak
# 获取channel_id 映射关系
## 中国新闻与电视
1. [老生常谈云媒体，党和人民在一起](https://laosheng.top/fly/)
2. [国内地方台2021-10.txt](https://github.com/wmenjoy-music/vms/files/7512001/2021-10.txt)
3. [logo](https://www.lyngsat-logo.com/tvcountry/China.html)
