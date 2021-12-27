from urllib import parse
from .tools import *
import json
import time
import hashlib
import requests

class Youku(object):
    def __init__(self):
        self.T = Tools()
        pass
    def getUrl(self, id):
        try:
            tt = str(int(time.time()*1000))
            param ={"liveId" : id,"app":"Pc"}
            data = json.dumps(param, separators=(',',':'))

            url = "https://acs.youku.com/h5/mtop.youku.live.com.livefullinfo/1.0/?appKey=24679788"
            s = requests.Session()
            cookies = s.get(url).cookies


            token = requests.utils.dict_from_cookiejar(cookies).get('_m_h5_tk')[0:32]
            sign = hashlib.md5((token + '&' + tt + '&' + '24679788' + '&' + data).encode('utf-8')).hexdigest()
            params = {
                't':tt,
                'sign': sign,
                'data': data
            }
            response = s.get(url, params=params).json()
            name = response.get('data').get('data').get('name')
            print(response)
            streamName = response.get('data').get('data').get('stream')[0].get('streamName')
            print(streamName)
            real_url = 'http://lvo-live.youku.com/vod2live/{}_mp4hd2v3.m3u8?&expire=21600&psid=1&ups_ts={}&vkye='.format(streamName, int(time.time()))
        except AttributeError as e:
            print(e)
            name =real_url = '错误'
        return name, real_url
