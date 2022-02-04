#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
from utils.tools import *
from utils.file_source import *
from utils.db_source import *
from utils.huya import *

class Main (object):
    def __init__ (self) :
        pass

    def run (self):
        args=get_args()
        if args.sync:
            source = DatabaseSource(args.file)
            source.getSource()
            return
        if args.onlineurl != None and args.onlineurl != "":
            if args.onlineurl.startswith("https://www.huya.com/g"):
                huya = Huya()
                prefixLength=len("https://www.huya.com/g/")
                id = args.onlineurl[prefixLength:]
                list = huya.getRoomList(id)
                for item in list:
                    roomId = item["profileRoom"]
                    name = item["roomName"]
                    if roomId != None:
                        url=huya.getRealUrl(roomId)
                        if url != None and url.startswith("https"):
                            print("直播,%s,%s" %(name.strip(),url))
                return
            elif args.onlineurl.startswith("https://www.huya.com"):
                huya = Huya()
                prefixLength=len("https://www.huya.com/")
                id = args.onlineurl[prefixLength:]
                url=huya.getRealUrl(str(id))
                print(url)
                return
        if args.url != None and args.url != "":
            result =  Tools().chkPlayable(args.url)
            print( str(result))
        else:
            DB = DataBase()
            DB.chkTable()
            source = FileSource(args.file)
            source.getSource()

def get_args():
    parser = argparse.ArgumentParser(
                usage="python main.py url",
                description="根据专辑或者艺术家地址下载专辑."
    )
    parser.add_argument('-u', '--url', type=str, default='', help="待检测的m3u，m3u8的地址")
    parser.add_argument('-f', '--file', type=str, dest='file', default='', help="文件")
    parser.add_argument('-s', '--sync', dest='sync', default=False, help="更细", action="store_true")
    parser.add_argument('-o', "--online", dest='onlineurl', default="", help="直播地址")

    parse_result = parser.parse_args()
    return parse_result
if __name__ == '__main__':
    App = Main()
    App.run()