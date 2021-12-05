from .source import *
import threading
import string
from .threads import ThreadPool

class FileSource(Source):
    def __init__ (self, file, threadNum=40):
        Source.__init__(self)
        self.file = file
        self.threadNum = threadNum
    def getSource (self):
        with open(self.file, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            total = len(lines)
            threads = ThreadPool(self.threadNum)
            for i in range(0, total):
                line = lines[i].strip('\n')
                if line.find( ",") < 0:
                    continue

                item = line.split(',', 1)
                
                urls = item[1].split('#')
                for j in range(0, len(urls)):
                    threads.add_task(self.detectData, title = item[0], url = urls[j])
                # thread = threading.Thread(target = self.detectData, args = (item[0], item[1], ), daemon = True)
                # thread.start()
                # threads.append(thread)
            threads.wait_completion()