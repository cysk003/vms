#!/usr/bin/env python
# -*- coding: utf-8 -*-
import urllib.request
import urllib.parse
import urllib.error
import re
import ssl
import io
import gzip
import random
import socket
import time
from .area import *
import os
import cv2
import pycurl
try:
    from io import BytesIO
except ImportError:
    from io import StringIO as BytesIO
import random

socket.setdefaulttimeout(5.0)



def get_header_function(header_line, headers = {}):
    def header_function(header_line):
        #python3上需要解码
        header_line = header_line.decode('iso-8859-1')
        if ':' not in header_line:
            return
        name, value = header_line.split(':', 1)
        name = name.strip()
        value = value.strip()
        name = name.lower()
        headers[name] = value
    return header_function

class Tools(object):
    def __init__(self):
        pass

    def getPage2 (self, url, requestHeader = []) :
        buffer = BytesIO()
        fakeIp = self.fakeIp()
        requestHeader.append('CLIENT-IP:' + fakeIp)
        requestHeader.append('X-FORWARDED-FOR:' + fakeIp)

        try:
            curl = pycurl.Curl()
            header={}
            curl.setopt(pycurl.URL, url.strip())
            curl.setopt(pycurl.ENCODING, 'gzip,deflate')
            curl.setopt(pycurl.HEADER, 1)
            curl.setopt(pycurl.TIMEOUT, 120)
            curl.setopt(pycurl.SSL_VERIFYPEER, 0)
            curl.setopt(pycurl.SSL_VERIFYHOST, 0)
            curl.setopt(pycurl.HEADERFUNCTION, get_header_function(header))
            curl.setopt(pycurl.WRITEFUNCTION, buffer.write)

            curl.perform()

            headerSize = curl.getinfo(pycurl.HEADER_SIZE)
            body = buffer.getvalue().decode('utf-8')

        except Exception as e:
            print(e)
            print(url)
            header = ''
            body = ''

        return header, body
    def fakeIp (self) :
        fakeIpList = []

        for x in xrange(0, 4):
            fakeIpList.append(str(int(random.uniform(0, 255))))

        fakeIp = '.'.join(fakeIpList)

        return
    def xor (self, x, y, base = 32) :
        stat = True
        if x >= 0 :
            x = str(bin(int(str(x), 10)))[2:]
            for i in xrange(0, base - len(x)):
                x = '0' + x
        else :
            x = str(bin(int(str(x + 1), 10)))[3:]
            for i in xrange(0, base - len(x)):
                x = '0' + x
            t = ''
            for i in xrange(0,len(x)):
                if x[i] == '1' :
                    t = t + '0'
                else :
                    t = t + '1'
            x = t
        if y >= 0 :
            y = str(bin(int(str(y), 10)))[2:]
            for i in xrange(0, base - len(y)):
                y = '0' + y
        else :
            y = str(bin(int(str(y + 1), 10)))[3:]
            for i in xrange(0, base - len(y)):
                y = '0' + y
            t = ''
            for i in xrange(0,len(y)):
                if y[i] == '1' :
                    t = t + '0'
                else :
                    t = t + '1'
            y = t
        t = ''
        for i in xrange(0, base):
            if x[i] == y[i] :
                t = t + '0'
            else :
                t = t + '1'
        x = t
        if x[0] == '1' :
            stat = False
            t = ''
            for i in xrange(0,len(x)):
                if x[i] == '1' :
                    t = t + '0'
                else :
                    t = t + '1'
            x = t
        r = int(str(x), 2)
        if stat == False :
            r = 0 - r - 1

        return r

    def rotate (self, x, y, w, base = 32) :
        stat = True
        if x >= 0 :
            x = str(bin(int(str(x), 10)))[2:]
            for i in xrange(0, base - len(x)):
                x = '0' + x
        else :
            x = str(bin(int(str(x + 1), 10)))[3:]
            for i in xrange(0, base - len(x)):
                x = '0' + x
            t = ''
            for i in xrange(0,len(x)):
                if x[i] == '1' :
                    t = t + '0'
                else :
                    t = t + '1'
            x = t
        if y >= base :
            y = y % base
        for i in xrange (0, y) :
            if w != 'r+' :
                x = x[0] + x + '0'
            else :
                x = '0' + x + '0'
        if w == 'r' or w == 'r+' :
            x = x[0 : base]
        else :
            x = x[(len(x) - base) : ]
        if x[0] == '1' :
            stat = False
            t = ''
            for i in xrange(0,len(x)):
                if x[i] == '1' :
                    t = t + '0'
                else :
                    t = t + '1'
            x = t
        r = int(str(x), 2)
        if stat == False :
            r = 0 - r - 1

        return r
    def getPage (self, url, requestHeader = [], postData = {}) :
        fakeIp = self.fakeIp()
        requestHeader.append('CLIENT-IP:' + fakeIp)
        requestHeader.append('X-FORWARDED-FOR:' + fakeIp)

        if postData == {} :
            request = urllib.request.Request(url)
        elif isinstance(postData, str) :
            request = urllib.request.Request(url, postData)
        else :
            request = urllib.request.Request(url, urllib.parse.urlencode(postData).encode('utf-8'))

        for x in requestHeader :
            headerType = x.split(':')[0]
            headerCon = x.replace(headerType + ':', '')
            request.add_header(headerType, headerCon)

        try :
            ctx = ssl.create_default_context()
            ctx.check_hostname = False
            ctx.verify_mode = ssl.CERT_NONE
            response = urllib.request.urlopen(request, context = ctx)
            header = response.headers
            body = response.read().decode('utf-8')
            code = response.code
        except urllib.error.HTTPError as e:
            header = e.headers
            body = e.read().decode('utf-8')
            code = e.code
        except:
            header = ''
            body = ''
            code = 500

        result = {
            'code': code,
            'header': header,
            'body': body
        }

        return result

    def getRealUrl (self, url, requestHeader = []) :
        fakeIp = self.fakeIp()
        requestHeader.append('CLIENT-IP:' + fakeIp)
        requestHeader.append('X-FORWARDED-FOR:' + fakeIp)

        request = urllib.request.Request(url)

        for x in requestHeader :
            headerType = x.split(':')[0]
            headerCon = x.replace(headerType + ':', '')
            request.add_header(headerType, headerCon)
        try :
            response = urllib.request.urlopen(request)
            realUrl = response.geturl()
        except :
            realUrl = ""

        return realUrl

    def fakeIp (self) :
        fakeIpList = []

        for x in range(0, 4):
            fakeIpList.append(str(int(random.uniform(0, 255))))

        fakeIp = '.'.join(fakeIpList)

        return fakeIp

    def fmtCookie (self, string) :
        result = re.sub(r"path\=\/.", "", string)
        result = re.sub(r"(\S*?)\=deleted.", "", result)
        result = re.sub(r"expires\=(.*?)GMT;", "", result)
        result = re.sub(r"domain\=(.*?)tv.", "", result)
        result = re.sub(r"httponly", "", result)
        result = re.sub(r"\s", "", result)

        return result

    def urlencode(self, str) :
        reprStr = repr(str).replace(r'\x', '%')
        return reprStr[1:-1]

    def gzdecode(self, data) :
        try:
            compressedstream = io.StringIO(data)
            gziper = gzip.GzipFile(fileobj = compressedstream)
            html = gziper.read()
            return html
        except :
            return data
    def fmtTitle (self, string) :
        pattern = re.compile(r"(cctv[-|\s]*\d*)?(.*)", re.I)
        tmp = pattern.findall(string)
        channelId = tmp[0][0].strip('-').strip()
        channeTitle = tmp[0][1]

        channeTitle = channeTitle.replace('.m3u8', '')

        pattern = re.compile(r"<.*?>", re.I)
        channeTitle = re.sub(pattern, "", channeTitle)

        pattern = re.compile(r"(fhd|hd|sd)", re.I)
        tmp = pattern.findall(channeTitle)
        quality = ''
        if len(tmp) > 0 :
            quality = tmp[0]
            channeTitle = channeTitle.replace(tmp[0], '')

        try :
            channeTitle.index('高清')
            channeTitle = channeTitle.replace('高清', '')
            quality = 'hd'
        except :
            pass
        try :
            channeTitle.index('1080')
            channeTitle = channeTitle.replace('1080', '')
            quality = 'hd'
        except :
            pass

        try :
            channeTitle.index('超清')
            channeTitle = channeTitle.replace('超清', '')
            quality = 'fhd'
        except :
            pass
        try :
            channeTitle.index('4K')
            channeTitle = channeTitle.replace('4K', '')
            quality = 'fhd'
        except :
            pass

        result = {
            'id'     : channelId,
            'title'  : channeTitle.strip('-').strip(),
            'quality': quality.strip('-').strip(),
            'level'  : 4,
        }

        if result['id'] != '':
            pattern = re.compile(r"cctv[-|\s]*(\d*)", re.I)
            result['id'] = re.sub(pattern, "CCTV-\\1", result['id'])

            if '+' in result['title'] :
                result['id'] = result['id'] + str('+')

        pattern = re.compile(r"\[\d+\*\d+\]", re.I)
        result['title'] = re.sub(pattern, "", result['title'])

        area = Area()
        result['level'] = area.classify(str(result['id']) + str(result['title']))

        # Radio
        pattern = re.compile(r"(radio|fm)", re.I)
        tmp = pattern.findall(result['title'])
        if len(tmp) > 0 :
            result['level'] = 7

        return result
    def chkPlayable (self, url) :
        try:
            if url.strip().startswith("http://"):
                startTime = int(round(time.time() * 1000))
                code = urllib.request.urlopen(url).getcode()
                if code == 200 :
                    endTime = int(round(time.time() * 1000))
                    useTime = endTime - startTime
                    return int(useTime)
            elif url.strip().startswith("rtsp://"):
                startTime = int(round(time.time() * 1000))
                cap = cv2.VideoCapture(url)
                if cap.isOpened():
                    endTime = int(round(time.time() * 1000))
                    useTime = endTime - startTime
                    return int(useTime)
            else:
                print(str(code))
                return 0
        except:
            return 0
    def chkCros (self, url) :
        return 0
    def logger (self, txt, new = False) :
        filePath = os.path.join(os.path.dirname(os.path.abspath(__file__)).replace('python', 'http'), 'log.txt')
        if new :
            typ = 'w'
        else :
            typ = 'a'
        with open(filePath, typ) as f:
            f.write(time.strftime("%Y/%m/%d %H:%M:%S", time.localtime()) + ": " + txt + "\r\n")