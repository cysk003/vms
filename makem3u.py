::#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
from utils.tools import *
from utils.iptv import *


class Main (object):
    def __init__ (self) :
        pass

    def run (self):
        args=get_args()
        if args.name == None:
            print("参数错误")
            return
        else:
            iptv =Iptv(file=args.name)
            iptv.output()

def get_args():
    parser = argparse.ArgumentParser(
                usage="python main.py url",
                description="根据专辑或者艺术家地址下载专辑."
    )
    parser.add_argument('name', type=str, help="文件名")

    parse_result = parser.parse_args()
    return parse_result
if __name__ == '__main__':
    App = Main()
    App.run()