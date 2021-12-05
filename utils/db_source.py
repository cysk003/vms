from .threads import ThreadPool
from .source import *
import threading

class DatabaseSource(Source):
    def __init__ (self, file, threadNum=40):
        Source.__init__(self)
        self.file = file
        self.threadNum = threadNum
        self.DB = DataBase()
    def getSource (self):
        self.T.logger("正在更新耗时")
        sql = """SELECT * FROM %s
            """ % (self.DB.table)
        threads = ThreadPool(self.threadNum)
        result = self.DB.query(sql)
        for item in result:
            threads.add_task(self.detectData, title = item[1], url = item[3])
        threads.wait_completion()