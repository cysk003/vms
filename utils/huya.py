import requests
import re
import base64
import urllib.parse
import hashlib
import time
from .tools import *
import json

class Huya(object):
    def __init__(self):
        self.T = Tools()
        pass
    def live(self,e):
        i, b = e.split('?')
        r = i.split('/')
        s = re.sub(r'.(flv|m3u8)', '', r[-1])
        c = b.split('&', 3)
        c = [i for i in c if i != '']
        n = {i.split('=')[0]: i.split('=')[1] for i in c}
        fm = urllib.parse.unquote(n['fm'])
        u = base64.b64decode(fm).decode('utf-8')
        p = u.split('_')[0]
        f = str(int(time.time() * 1e7))
        l = n['wsTime']
        t = '0'
        h = '_'.join([p, t, s, f, l])
        m = hashlib.md5(h.encode('utf-8')).hexdigest()
        y = c[-1]
        url = "{}?wsSecret={}&wsTime={}&u={}&seqid={}&{}".format(i, m, l, t, f, y)
        return url

    def getRoomList(self, groupId, page=0):

        totalPage = -1
        i = 1
        list = []
        while totalPage == -1 or i <= totalPage:
            page =  self.T.getPage("https://www.huya.com/cache.php?m=LiveList&do=getLiveListByPage&gameId=%s&tagAll=0&page=%s" %(groupId,i))
            if page["code"] == 200:
                bodyJson = json.loads(page["body"])
                data = bodyJson["data"]
                if totalPage == -1:
                    totalPage = data["totalPage"]
                for item in data["datas"]:
                    list.append(item)
                break
            i = i + 1
        return list
    def getRealUrl(self, room_id):
        try:
            room_url = 'https://m.huya.com/' + str(room_id)
            header = {
            'Content-Type': 'application/x-www-form-urlencoded',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) '
                          'Chrome/75.0.3770.100 Mobile Safari/537.36 '
            }
            response = requests.get(url=room_url, headers=header).text
            liveLineUrl = re.findall(r'"liveLineUrl":"([\s\S]*?)",', response)[0]
            liveline = base64.b64decode(liveLineUrl).decode('utf-8')
            if liveline:
                if 'replay' in liveline:
                    return '直播录像：' + liveline
                else:
                    liveline = self.live(liveline)
                    real_url = ("https:" + liveline) #.replace("hls", "flv").replace("m3u8", "flv")
                    return real_url
            else:
                real_url = '未开播或直播间不存在'
                return real_url
        except:
            real_url = '未开播或直播间不存在'
            return real_url