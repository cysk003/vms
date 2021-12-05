from .threads import ThreadPool

class FileSource(Source):
    def __init__ (self, file, threadNum=40):
        Source.__init__(self)
        self.file = file
        self.threadNum = threadNum
    def getSource (self):
        with open(self.file, 'r') as f:
            lines = f.readlines()
            total = len(lines)
            threads = ThreadPool(self.threadNum)
            for i in range(0, total):
                line = lines[i].strip('\n')
                if line.find( ",") < 0:
                    continue

                item = line.split(',', 1)

                threads.add_task(self.detectData, title = item[0], url = item[1])
                # thread = threading.Thread(target = self.detectData, args = (item[0], item[1], ), daemon = True)
                # thread.start()
                # threads.append(thread)
            threads.wait_completion()