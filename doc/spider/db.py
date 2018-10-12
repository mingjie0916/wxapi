#-*- coding: utf-8 -*-

"""
数据库管理类
"""

import MySQLdb
from DBUtils.PooledDB import PooledDB
from singleton import Singleton

conf = {'DB_HOST': '192.168.1.111', 'DB_USER':'root', 'DB_PASS':'root', 'DB_NAME':'tradeonline_online'}


class DbManager(Singleton):

    def __init__(self):
        connKwargs = {'host':conf['DB_HOST'], 'user':conf['DB_USER'], 'passwd':conf['DB_PASS'], 'db':conf['DB_NAME'], 'charset':"utf8"}
        self._pool = PooledDB(MySQLdb, mincached=0, maxcached=10, maxshared=10, maxusage=10000, **connKwargs)

    def getConn(self):
        return self._pool.connection()

_dbManager = DbManager()

def getConn():
    """ 获取数据库连接 """
    return _dbManager.getConn()

def executeAndGetId(sql, param=None):
    """ 执行插入语句并获取自增id """
    conn = getConn()
    cursor = conn.cursor()
    if param == None:
        cursor.execute(sql)
    else:
        cursor.execute(sql, param)
    id = cursor.lastrowid
    cursor.close()
    conn.close()

    return id

def execute(sql, param=None):
    """ 执行sql语句 """
    conn = getConn()
    cursor = conn.cursor()
    if param == None:
        rowcount = cursor.execute(sql)
    else:
        rowcount = cursor.execute(sql, param)
    cursor.close()
    conn.close()

    return rowcount

def queryOne(sql):
    """ 获取一条信息 """
    conn = getConn()
    cursor = conn.cursor(cursorclass=MySQLdb.cursors.DictCursor)
    rowcount = cursor.execute(sql)
    if rowcount > 0:
        res = cursor.fetchone()
    else:
        res = None
    cursor.close()
    conn.close()

    return res

def queryAll(sql):
    """ 获取所有信息 """
    conn = getConn()
    cursor = conn.cursor(cursorclass=MySQLdb.cursors.DictCursor)
    rowcount = cursor.execute(sql)
    if rowcount > 0:
        res = cursor.fetchall()
    else:
        res = None
    cursor.close()
    conn.close()

    return res

if __name__ == "__main__":
    res = execute('select count(*) from companys')
    print str(res)

