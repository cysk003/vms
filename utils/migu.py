from urllib import parse
from .tools import *
import json
class Migu(object):
    def __init__(self):
        self.T = Tools()
        pass
    def getUrl(self, id):
        requestHeader={
           ""
        }
        page =  self.T.getPage("https://webapi.miguvideo.com/gateway/playurl/v3/play/playurl?contId=%s&rateType=3&startPlay=true" %(id))
        if page["code"] == 200:
            bodyJson = json.loads(page["body"])
            url = bodyJson['body']["urlInfos"][0]["url"]
            return ddCalcu(url)
        return ""
def ddCalcu(url):
    new_url = parse.urlparse(url)
    para = dict(parse.parse_qsl(new_url.query))
    userid = para.get("userid","")
    timestamp = para.get("timestamp","")
    ProgramID = para.get("ProgramID","")
    Channel_ID = para.get("Channel_ID","")
    puData = para.get("puData","")
    t = userid if userid else "eeeeeeeee"
    r = timestamp if timestamp else "tttttttttttttt"
    n = ProgramID if ProgramID else "ccccccccc"
    a = Channel_ID if Channel_ID else "nnnnnnnnnnnnnnnn"
    o = puData if puData else ""
    if not o:
        return url
    s = list("2624")
    u = list(t)[int(s[0])] or "e"
    l = list(r)[int(s[1])] or "t"
    c = list(n)[int(s[2])] or "c"
    f = list(a)[len(a)-int(s[3])] or "n"
    d = list(o)
    h = []
    p = 0
    while p*2 < len(d):
        h.append(d[len(d)-p-1])
        if p < len(d) - p -1:
            h.append(o[p])
        if p == 1:
            h.append(u)
        if p == 2:
            h.append(l)
        if p == 3:
            h.append(c)
        if p == 4:
            h.append(f)
        p += 1
    v = "".join(h)
    return url + "&ddCalcu=" + v



if __name__ == '__main__':
    migu=Migu()
    realUrl=migu.getUrl("608807416")
    print(realUrl)
    url = "http://h5live.gslb.cmvideo.cn/migu/kailu/20200324/cctv4meihd/50/index.m3u8?msisdn=20210731022935c8b943821c7c432faed138160dd0b77f&mdspid=&spid=699004&netType=0&sid=2200179344&pid=2028597139&timestamp=20210731022935&Channel_ID=0116_25000000-99000-100300010010001&ProgramID=608807416&ParentNodeID=-99&assertID=2200179344&client_ip=60.17.111.77&SecurityKey=20210731022935&mvid=2200179344&mcid=500020&mpid=&playurlVersion=SJ-A1-4.7.1&userid=&jmhm=&videocodec=h264&bean=mgsph5&puData=4484cda45d696504453b9dc809dd5599"
    new_url = ddCalcu(url)
    print(new_url)