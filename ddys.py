from Crypto.Cipher import AES
from binascii import b2a_hex, b2a_hex
from Crypto import Random
import base64
import time
import datetime
from urllib import parse
from utils.tools import *
import json
import sys

#		function oneTime(){
# 				let srvdate = new Date($.ajax({async: false}).getResponseHeader("Date"));
 #				let eTimes = srvdate.getTime() + 600000;
 #				let uTxt = CryptoJS.enc.Utf8.parse("{\"path\":\"" + vtracksrc0 + "\",\"expire\":" + eTimes.toString() + "}");
 #				let uKey = CryptoJS.enc.Utf8.parse("zevS%th@*8YWUm%K");
 #				let waiv = CryptoJS.enc.Utf8.parse("5080305495198718");
 #				var ttestvtrack = CryptoJS.AES.encrypt(uTxt,uKey,{
 #					iv: waiv,
 #					mode: CryptoJS.mode.CBC
 #				});
 #				vtracksrc = encodeURIComponent(ttestvtrack.ciphertext.toString(CryptoJS.enc.Base64));
 #			}

key=b'zevS%th@*8YWUm%K'
BS = 16
pad = lambda s: s + (BS - len(s) % BS) * chr(BS - len(s) % BS)

T=Tools()

def aesEncrypt(path):
    BLOCK_SIZE=16
    systime = int(time.mktime(datetime.datetime.now().timetuple()) * 1000)
    etimes = systime + 600000
    uTxt = "{\"path\":\"" + path + "\",\"expire\":" + str(etimes) + "}"
    cipher = AES.new(key, AES.MODE_CBC, b'5080305495198718')
    uTxt = pad(uTxt)
    result = cipher.encrypt(uTxt.encode("utf-8"))
    return parse.quote(base64.b64encode(result),safe='~()*!.\'')
if __name__ == '__main__':
    header, body = T.getPage2(sys.argv[1])

    titleList = re.findall(r"class=\"post-title\">([^<]*)",body)
    if len(titleList) > 0:
        title = titleList[0]
    list = re.findall(r"\"src0\":\"([^\"]*)\"", body)
    if len(list) > 0:
        group="电影"
        if len(list) > 1:
            group=title
        for item in list:
            url = item.replace("\\","")
            idx = url.rindex("/")
            title = url[idx + 1:]
            idx2 = title.rindex(".")
            title = title[0:idx2].replace("_"," ")
            result =aesEncrypt(url)
            page = T.getPage("https://v.ddys.tv:19543/video?type=mix&id=" + result)
            bodyJson = json.loads(page["body"])
            print(group + "," +title + "," + bodyJson["url"])

