from .area import *
import os
class EPGInfo(object):
   def __init__ (self, tvgId=-1, tvgName="", logo="", group="", src="", time="", keywords=[]):
       self.tvgId = tvgId
       self.tvgName = tvgName
       self.logo = logo
       self.group = group
       self.src = src
       self.time = time
       self.keywords = keywords


class EPG(object):
   def __init__ (self, epgfiles=[]):
       self.dict = {}
       self.area = Area()
       self.otherKeywords = {}
       self.otherKeywords["少儿动漫"]=["少儿","卡通","动漫","动画"]
       self.otherKeywords["影视"]=["影","剧"]
       self.otherKeywords["科教"]=["科教","科学", "教育","网课","地理","求实","器官","探索","记录","国学","围棋"]
       self.otherKeywords["体育"]=["Sports","体育", "篮球","台球","武术","奥运"]
       self.otherKeywords["体育"]=["Sports","体育", "篮球","台球","武术","奥运"]
       self.otherKeywords["财经"]=["财经","体育", "篮球","台球","武术","奥运"]
       self.otherKeywords["娱乐"]=["综艺","游戏", "棋牌","竞技"]
       currentDir = os.path.dirname(os.path.abspath(__file__)).replace('python', 'database')
       self.epgfiles = epgfiles
       if len(self.epgfiles) == 0:
            self.epgfiles.append(currentDir + "/epg51zmt_logo.info")
            self.epgfiles.append(currentDir + "/custom_logo.info")
       for file in self.epgfiles:
            self.init(file)
   def init(self, fileName):
       with open(fileName, 'r') as f:
            lines = f.readlines()
            total = len(lines)
            for i in range(0, total):
                line = lines[i].strip('\n')
                line = line.strip()
                if line == "" or line.startswith("#"):
                    continue
                items = line.split('|')
                keywords=[items[2].upper(),items[3].upper()]
                for j in range(7, len(items)):
                    if items[j] != "":
                        keywords.append(items[j].upper())

                if len(items) <= 6:
                    continue
                self.dict[items[0]]=EPGInfo(tvgId=int(items[0]),logo=items[1],tvgName=items[3],group=items[4], src=items[5],time=items[6], keywords=keywords)
   def query(self, title):
        if title == None or title.strip() == "":
            return None
        searchKey = title.upper()
        searchKey = searchKey.replace("高清","")
        searchKey = searchKey.replace("超清","")
        searchKey = searchKey.replace("普清","")
        searchKey = searchKey.replace("1080","")
        searchKey = searchKey.replace("FHD","")
        searchKey = searchKey.replace("HD","")

        fields = searchKey.split(" ")
        flen = len(fields)
        if flen > 1:
            if flen > 2:
                for epgInfo in self.dict.values():
                    for x in epgInfo.keywords:
                        if x == (fields[0] + " " + fields[1]):
                            return epgInfo
            for epgInfo in self.dict.values():
                for x in epgInfo.keywords:
                    if x == searchKey:
                        return epgInfo
            for epgInfo in self.dict.values():
                for x in epgInfo.keywords:
                    if x == fields[0]:
                        return epgInfo
        else:
            for epgInfo in self.dict.values():
                for x in epgInfo.keywords:
                    if x == searchKey:
                        return epgInfo
        for epgInfo in self.dict.values():
            for x in epgInfo.keywords:
                if x in searchKey:
                    return epgInfo

        group = "其他"
        result = self.area.classify(title)
        if result == 1:
            group = "央视"
        elif result == 2:
            group = "卫视"
        elif result == 3:
            group = "地方"
        else:
            for key,keywords in self.otherKeywords.items():
                for keyword in keywords:
                     if keyword in title:
                        group = key
                        break

        return EPGInfo(tvgId=-1, group=group)

if __name__ == '__main__':
    EPG = EPG()
    EPG.init("./epg51zmt_logo.info")
    EPG.init("./custom_logo.info")
    epgInfo = EPG.query("CCTV 05")
    print(epgInfo.logo)