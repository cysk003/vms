import hashlib
from Crypto.Cipher import AES
from utils.tools import *
import base64
import requests
import json

#var sign = function(a) {
#		var b = CryptoJS.MD5(a);
#		var c = CryptoJS.enc.Utf8.parse(b);
#		var d = CryptoJS.enc.Utf8.parse('ren163com5201314');
#		var e = CryptoJS.AES.encrypt(a, c, {
#			iv: d,
#			mode: CryptoJS.mode.CBC,
#			padding: CryptoJS.pad.ZeroPadding
#		});
#		return e.toString()
#	}

#curl 'https://nbjx.vip/xmflv-1.SVG' \
#  -H 'authority: nbjx.vip' \
#  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"' \
#  -H 'accept: application/json, text/javascript, */*; q=0.01' \
#  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
#  -H 'x-requested-with: XMLHttpRequest' \
#  -H 'sec-ch-ua-mobile: ?0' \
#  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36' \
#  -H 'sec-ch-ua-platform: "macOS"' \
#  -H 'origin: https://nbjx.vip' \
#  -H 'sec-fetch-site: same-origin' \
#  -H 'sec-fetch-mode: cors' \
#  -H 'sec-fetch-dest: empty' \
 # -H 'accept-language: zh-CN,zh;q=0.9' \
#  --data-raw 'time=1641164739&url=https%3A%2F%2Fv.qq.com%2Fx%2Fcover%2Fmzc00200c6aodyr%2Ft0036kis46j.html&wap=1&vkey=mdnXoqVsY1%2BrYKOqlMfSpWevZpuk25ulldPexZKWapFhyJmToZatomSmYmmZms6hq2ttomPNqqDS&fvkey=%2B%2FcfggdNhMXOBLAZR2arrVUIX63g3X4A0YJaXXuJp3o%3D' \
 # --compressed

BS = 16
pad = lambda s: s + (BS - len(s) % BS) * chr(BS - len(s) % BS)

#curl 'https://www.jpysvip.net/vodplay/132766-1-1.html' \
#  -H 'authority: www.jpysvip.net' \
#  -H 'cache-control: max-age=0' \
#  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"' \
#  -H 'sec-ch-ua-mobile: ?0' \
#  -H 'sec-ch-ua-platform: "macOS"' \
#  -H 'upgrade-insecure-requests: 1' \
#  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36' \
#  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#  -H 'sec-fetch-site: none' \
#  -H 'sec-fetch-mode: navigate' \
#  -H 'sec-fetch-user: ?1' \
#  -H 'sec-fetch-dest: document' \
#  -H 'accept-language: zh-CN,zh;q=0.9' \
#  -H 'cookie: erdangjiade=erdangjiade; _ga=GA1.1.374223113.1641163523; https://vod8.wenshibaowenbei.com/20211213/DmQpR0nM/index.m3u8=334.776288; history=%5B%7B%22name%22%3A%22%E8%BF%A6%E5%B8%8C%E5%A5%B3%E7%8E%8B%E4%B8%8D%E4%BC%9A%E6%94%BE%E5%BC%83%22%2C%22pic%22%3A%22https%3A%2F%2Fimg.52swat.cn%2Fupload%2Fvod%2F20210803-1%2F90c345afe0f5a520d7fcb662614a3bed.jpg%22%2C%22link%22%3A%22%2Fvodplay%2F132766-1-1.html%22%2C%22part%22%3A%22%E7%AC%AC01%E9%9B%86%22%7D%2C%7B%22name%22%3A%22%E6%97%A0%E6%B3%95%E6%8A%97%E6%8B%92%E7%9A%84%E7%88%B1%22%2C%22pic%22%3A%22%2Fimg.php%3Furl%3Dhttps%3A%2F%2Fimg9.doubanio.com%2Fview%2Fphoto%2Fs_ratio_poster%2Fpublic%2Fp2689621726.jpg%22%2C%22link%22%3A%22%2Fvodplay%2F140273-1-1.html%22%2C%22part%22%3A%22%E7%AC%AC01%E9%9B%86%22%7D%2C%7B%22name%22%3A%22%E8%B4%AB%E5%98%B4%E5%BC%A0%E5%A4%A7%E6%B0%91%E7%9A%84%E5%B9%B8%E7%A6%8F%E7%94%9F%E6%B4%BB%22%2C%22pic%22%3A%22http%3A%2F%2Ftu.166376.com%3A988%2Fimg%2Fupload%2Fvod%2F2020-11-17%2F202011171605598483.jpg%22%2C%22link%22%3A%22%2Fvodplay%2F119748-1-4.html%22%2C%22part%22%3A%22%E7%AC%AC04%E9%9B%86%22%7D%2C%7B%22name%22%3A%22%E7%BA%A6%E7%BF%B0%C2%B7%E5%A8%81%E5%B0%94%E9%80%8A%E7%9A%84%E5%8D%81%E4%B8%87%E4%B8%AA%22%2C%22pic%22%3A%22https%3A%2F%2Fimg.52swat.cn%2Fupload%2Fvod%2F20211213-1%2F04ef548fbbbe42c06012fe841b593257.jpg%22%2C%22link%22%3A%22%2Fvodplay%2F143648-1-1.html%22%2C%22part%22%3A%22%E7%AC%AC01%E9%9B%86%22%7D%2C%7B%22name%22%3A%22%E9%95%BF%E6%AD%8C%E8%A1%8C%22%2C%22pic%22%3A%22https%3A%2F%2Fimg14.360buyimg.com%2Fddimg%2Fjfs%2Ft1%2F158369%2F13%2F18940%2F31112%2F60744d6cE30b1e77a%2Fe881c690f66aca99.jpg%22%2C%22link%22%3A%22%2Fvodplay%2F126159-1-1.html%22%2C%22part%22%3A%22%E7%AC%AC1%E9%9B%86%22%7D%5D; _ga_B4HSYMT62B=GS1.1.1641169744.2.1.1641170796.0; https://vod7.wenshibaowenbei.com/20210803/ZjlzBkeG/index.m3u8=5.429671' \
#  -H 'if-modified-since: Sun, 02 Jan 2022 22:59:45 GMT' \
#  --compressed

class JpySvip(object):
    def __init__(self):
        self.T = Tools()
        pass

    def sign(self, data):
        hl = hashlib.md5()
        hl.update(data.encode(encoding='utf-8'))
        a = hl.hexdigest()
        print()
        c = a.encode(encoding='utf-8')
        print("===")
        print(c)
        d = 'ren163com5201314'.encode(encoding='utf-8')
        cipher = AES.new(c, AES.MODE_CBC, d)
        #uTxt = pad(data)
        result = cipher.encrypt(data.encode("utf-8"))
        return base64.b64encode(result)

    def getUrl(self, url):
        header = [
            'authority:nbjx.vip',
            'sec-ch-ua:" Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"',
            'sec-ch-ua-mobile:?0',
            'sec-ch-ua-platform:"macOS"',
            'upgrade-insecure-requests:1',
            'user-agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
            'accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
            'sec-fetch-site:cross-site',
            'sec-fetch-mode:navigate',
            'sec-fetch-dest:iframe',
            'referer:https://www.jpysvip.net/',
            'accept-language:zh-CN,zh;q=0.9'
            ]
        requestUrl='https://nbjx.vip/?url=' + url
        page = self.T.getPage(requestUrl, requestHeader=header)
        if page['code'] == 200:
            time = re.findall(r"time\s*=\s*'([^']+)'",page["body"])[0]
            wap = re.findall(r"wap\s*=\s*'([^']+)'",page["body"])[0]
            url = re.findall(r"var\s+url\s*=\s*'([^']+)'",page["body"])[0]
            cip = re.findall(r"cip\s*=\s*'([^']+)'",page["body"])[0]
            vkey = re.findall(r"vkey\s*=\s*'([^']+)'",page["body"])[0]
            fvkey = re.findall(r"fvkey\s*=\s*'([^']+)'",page["body"])[0]
            postHeader = {
            'authority':'nbjx.vip',
            'sec-ch-ua':'" Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"',
            'sec-ch-ua-mobile':'?0',
            'sec-ch-ua-platform':'"macOS"',
            'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'x-requested-with': 'XMLHttpRequest',
            'origin':'https://nbjx.vip',
            'upgrade-insecure-requests':'1',
            'user-agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
            'accept':'application/json, text/javascript, */*; q=0.01',
            'sec-fetch-site':'same-origin',
            'sec-fetch-mode':'cors',
            'sec-fetch-dest':'empty',
            'referer':'https://www.jpysvip.net/',
            'accept-language':'zh-CN,zh;q=0.9'
            }
            data = {
                "time": time,
                "url": url,
                "wap": wap,
                "vkey": vkey,
                "fvkey": self.sign(fvkey)
            }
            r = requests.post("https://nbjx.vip/xmflv-1.SVG",headers=postHeader, data=data)
            result = r.text
            bodyJson = json.loads(r.text)
            return bodyJson["url"]

if __name__ == '__main__':
    vip = JpySvip()
    #print(vip.sign("99445e00ead9dc5e5868eb273b2bde26"))
    print(vip.getUrl('https://v.qq.com/x/cover/im60meg91bo9dbr.html'))