from .db import *
from .tools import Tools
from .epg import *
class Source:
    def __init__ (self):
        self.T = Tools()
        self.now = int(time.time() * 1000)
        self.epg = EPG()
    def getSource (self):
        raise Exception("Not Support Method")
    def detectData (self, title, url) :
        info = self.T.fmtTitle(title)

        netstat = self.T.chkPlayable(url)
        epg = self.epg.query(title)
        if netstat > 0 :
            cros = 1 if self.T.chkCros(url) else 0

            data = {
                'title'  : str(info['id']) if info['id'] != '' else str(info['title']),
                'url'    : str(url),
                'quality': str(info['quality']),
                'delay'  : netstat,
                'level'  : str(info['level']),
                'cros'   : cros,
                'online' : 1,
                'udTime' : self.now,
                'logo': epg.logo,
                'group_name': epg.group,
                'tvg_id': epg.tvgId,
                'tvg_name': epg.tvgName,
            }

            self.addData(data)
            self.T.logger('正在分析[ %s ]: %s' % (str(info['id']) + str(info['title']), url))
        else :
            pass # MAYBE later :P
    def addData (self, data) :
        DB = DataBase()
        sql = "SELECT * FROM %s WHERE url = '%s'" % (DB.table, data['url'])
        result = DB.query(sql)

        if len(result) == 0 :
            data['enable'] = 1
            DB.insert(data)
            print("success=" + sql)
        else :
            id = result[0][0]
            DB.edit(id, data)
            print("failed=" + sql)

