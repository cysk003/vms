
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
T=Tools()
if __name__ == '__main__':
    header, body = T.getPage2(sys.argv[1])
    title = re.findall(r"videolist:title\">([^<]+)", body)[0]
    coverInfos = re.findall(r"COVER_INFO = ({.*)", body)
    if len(coverInfos) > 0:
        covermap = json.loads(coverInfos[0])
        i = 1
        for vid in covermap["nomal_ids"]:
            print("%s,%s第%s集,http://192.168.50.223:8880/vipx?url=https://v.qq.com/x/cover/%s/%s.html" % (title, title,i,covermap["id"], vid["V"]))
            i = i + 1


