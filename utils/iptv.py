#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .tools import *
from .db import *
import time
import re
import json
import os
class Iptv (
object):

    def __init__ (self, file=os.path.join(os.path.dirname(os.path.abspath(__file__)).replace('python', 'http'), "tv.m3u8")) :
        self.T = Tools()
        self.DB = DataBase()
        self.file = file
    def run(self) :
        self.T.logger("开始抓取", True)

        self.DB.chkTable()

        Base = base.Source()
        Base.getSource()

        Dotpy = dotpy.Source()
        Dotpy.getSource()

        listB = listb.Source()
        listB.getSource()

        self.outPut()
        self.outJson()

        self.T.logger("抓取完成")

    def output (self) :
        self.T.logger("正在生成m3u8文件")

        sql = """SELECT * FROM
            (SELECT * FROM %s WHERE online = 1 ORDER BY delay DESC) AS delay
            GROUP BY LOWER(delay.title)
            HAVING delay.title != '' and delay.title != 'CCTV-' AND delay.delay < 500
            ORDER BY level ASC,tvg_id ASC, length(title) ASC, title ASC
            """ % (self.DB.table)
        result = self.DB.query(sql)

        with open(self.file, 'w') as f:
            f.write("#EXTM3U\n")
            for item in result :
                className = item[7]
                if item[4] == -1:
                    f.write("#EXTINF:-1, tvg_id =\"\" group-title=\"%s\", %s\n" % (className, item[1]))
                else:
                    f.write("#EXTINF:-1, tvg_id =\"%s\" tvg_name=\"%s\" tvg_logo=\"%s\" group-title=\"%s\", %s\n" % (item[4],item[5],item[6],className, item[1]))
                f.write("%s\n" % (item[3]))

    def outJson (self) :
        self.T.logger("正在生成Json文件")

        sql = """SELECT * FROM
            (SELECT * FROM %s WHERE online = 1 ORDER BY delay DESC) AS delay
            GROUP BY LOWER(delay.title)
            HAVING delay.title != '' and delay.title != 'CCTV-' AND delay.delay < 500
            ORDER BY level ASC, length(title) ASC, title ASC
            """ % (self.DB.table)
        result = self.DB.query(sql)

        fmtList = {
            'cctv': [],
            'local': [],
            'other': [],
            'radio': []
        }

        for item in result :
            tmp = {
                'title': item[1],
                'url': item[3]
            }
            if item[4] == 1 :
                fmtList['cctv'].append(tmp)
            elif item[4] == 2 :
                fmtList['local'].append(tmp)
            elif item[4] == 3 :
                fmtList['local'].append(tmp)
            elif item[4] == 7 :
                fmtList['radio'].append(tmp)
            else :
                fmtList['other'].append(tmp)

        jsonStr = json.dumps(fmtList)

        with open( os.path.join(os.path.dirname(os.path.abspath(__file__)).replace('python', 'http'), 'tv.json'), 'w') as f:
            f.write(jsonStr)

if __name__ == '__main__':
    obj = Iptv()
    obj.run()