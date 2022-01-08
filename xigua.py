# coding=utf8

import re
import requests
import random
from zlib import crc32
from base64 import b64decode
import io
import sys

def get_video_url_api(video_id):
    """获取视频地址所在包的url"""
    r = str(random.random())[2:]
    url_part = "/video/urls/v/1/toutiao/mp4/{}?r={}".format(video_id, r)
    s = crc32(url_part.encode())
    url = "https://ib.365yg.com{}&s={}".format(url_part, s)
    return url


def get_video_url(url):
    """获取视频地址"""
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36",
    }
    resp = requests.get(url, headers=headers)
    j_resp = resp.json()
    video_url = j_resp['data']['video_list']['video_1']['main_url']
    video_url = b64decode(video_url.encode()).decode()
    return video_url


def get_video_id(url):
    """获取视频id"""
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36",
    }
    resp = requests.get(url, headers=headers)
    # 获取video_id
    return re.search("videoId: '([^\']+)'", resp.text).group(1)

def get_ablums_list(url):
    return
def get_video_list(url):
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36",
        "authority":    "www.ixigua.com",
        "referer":    "https://www.ixigua.com/6800237213872292366?id=6800244048448717319&logTag=95fdfc3923436e65e417",
        "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "cookie": "cookie: MONITOR_WEB_ID=95d34d25-5e02-4fb7-a16c-d9b4be7e36d8; support_webp=true; support_avif=true; ixigua-a-s=1; ttcid=0532a6d92a73483e8199994b5771cc4025; _tea_utm_cache_1300=undefined; __ac_nonce=061d5a9010077d172dc66; __ac_signature=_02B4Z6wo00f01LiP4sAAAIDCgy19TDTdPmC4r-ZAAE.7d0; ttwid=1%7CR4IzOLOWyvUvF6gEi-s6lFUkf0gXVqjPxNYOgiGs7bo%7C1641393431%7Cacc5739647be220f6c913d91458115b218f2a8c140b4527bfa692083abed3ac5"
    } 
    resp = requests.get(url, headers=headers)
    resp.encoding="utf-8"
    title=re.findall(r"<title[^>]+>([^<]+)", resp.text)[0].split("-")[0].split()[0]
    albumId = ""
    groupId = ""
    episodeId=""
    albumIdInfo=re.search("data-album-id=\"([^\"]*)", resp.text)
    seriesInfo=re.search("data-p-series-id=\"([^\"]*)", resp.text)
    if seriesInfo != None:
        group =re.search("seriesInfo\":{\"title\":\"([^\"]+)",resp.text).group(1)
        groupId=re.search("data-group-id=\"([^\"]*)", resp.text).group(1)
        seriesId=seriesInfo.group(1)
        i = 0
        detailUrl = "https://www.ixigua.com/api/videov2/pseries_more_v2?pSeriesId=%s&rank=%s&tailCount=30" %(albumId, i)
        resp = requests.get(detailUrl, headers=headers)
        resp.encoding="utf-8"
        j_resp = resp.json()
        playlist = j_resp["data"]
        print(albumId)
        while len(playlist) != 0:
            for playItem in playlist:
                print("%s,%s,http://192.168.50.223:8880/vip2?url=https://www.ixigua.com/%s?id=%s"%(group,playItem["title"],albumId,playItem["group_id"]))
            i = i+30
            detailUrl = "https://www.ixigua.com/api/videov2/pseries_more_v2?pSeriesId=%s&rank=%s&tailCount=30" %(albumId, i)
            resp = requests.get(detailUrl, headers=headers)
            resp.encoding="utf-8"
            j_resp = resp.json()
            playlist = j_resp["data"]           
    elif albumIdInfo != None:
        albumId = albumIdInfo.group(1)
        episodeId=re.search("data-episode-id=\"([^\"]*)", resp.text).group(1)
        detailUrl = "https://www.ixigua.com/api/albumv2/details?albumId=%s&episodeId=%s&block=1" %(albumId, episodeId)
        resp = requests.get(detailUrl, headers=headers)
        resp.encoding="utf-8"
        j_resp = resp.json()
        playlist = j_resp["data"]["playlist"]
        if len(playlist) > 1:
            for playItem in playlist:
                print("%s,%s,http://192.168.50.223:8880/vip2?url=https://www.ixigua.com/%s?id=%s"%(title,playItem["bottomLabel"]+" " + playItem["name"],albumId,playItem["episodeId"]))
        else:
            print("电影,%s,http://192.168.50.223:8880/vip2?url=https://www.ixigua.com/%s?id=%s"%(playlist[0]["title"],albumId,playlist[0]["episodeId"]))
    else:
        print("电影,%s,http://192.168.50.223:8880/vip2?url=%s"%(title,url))

    
def main():
    # url = 'https://www.ixigua.com/a6695286370652389896/'
    url = 'https://www.ixigua.com/6800237213872292366?logTag=349ee6d126831a3a0438'
    #
    get_video_list(sys.argv[1])


if __name__ == '__main__':
    main()