#!/usr/bin/env python3.4
import os,sys
import cgi, cgitb
import time, datetime
import pymysql
cgitb.enable()

def pymysql_ip_date_time(cur):
    datetime_now = str(datetime.datetime.now()).split(' ')
    str_time_now_sec = datetime_now[1].split(":")
    time_now_sec = float(str_time_now_sec[2])+60.*float(str_time_now_sec[1])+3600.*float(str_time_now_sec[0])
    print("\n<!--текущие дата и время\n",datetime_now, str_time_now_sec, time_now_sec, "\n-->\n")

    cur.execute("""CREATE TABLE IF NOT EXISTS `ip_date_time` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `page_ip` varchar(255) NOT NULL,
      `page_date` date NOT NULL,
      `page_time` time NOT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;""")
    db.commit()#транзакция (дожидаемся завершения операции модификации таблицы)

    cur.execute("""INSERT INTO `ip_date_time` (`id`, `page_ip`, `page_date`, `page_time`) VALUES ('%s', '%s', '%s', '%s')""" % ('NULL' , os.environ[ "REMOTE_ADDR" ], time.strftime('%Y-%m-%d'), time.strftime('%H:%M:%S')))
    db.commit()
    #cur.execute("""SELECT `id`, `page_title`, `page_ip`, `page_date`, `page_time` FROM `ip_date_time` ORDER BY `id` DESC LIMIT 0 , 1""")
    cur.execute("""SELECT * FROM `ip_date_time` ORDER BY `id` DESC LIMIT 0 , 1""")
    result_one  =  cur.fetchone()
    print("\n<!--Контрольное считывание из базы последней записи\nresult_one:\n", type(result_one), result_one)
    print("\n<br>Значения полей: ",end="")
    for value in result_one:
        print (value, end=";")
    print("-->\n")
    cur.execute("""SELECT `page_ip`, COUNT( `page_ip` ) FROM `ip_date_time` GROUP BY `page_ip` ORDER BY `page_ip`""")
    result_all  =  cur.fetchall()
    print("\n<!--Получение частот page_ip из базы\nresult_all:\n", type(result_all), result_all)
    for result_one in result_all:
        print("\n",end="")
        for value in result_one:
            print (value, end=";")            
    print("\n</p>-->\n")


if __name__=='__main__':
    print('''\
Content-type:text/html\r\n
<html>
<head>\n<title>В базу, из базы, обработка</title>\n</head>
<body><h3>В базу, из базы, обработка</h3><pre>
    ''')
    #соединяемся с базой данных
    db  =  pymysql.connect(host = "127.0.0.1", user = "g06u29", passwd = "mysql16", db = "g06u29", charset = "utf8",use_unicode = True) # Open database connection
    cur  =  db.cursor() # prepare a cur object using cursor() method
    cur.execute('SET NAMES utf8') # execute SQL query using execute() method
    pymysql_ip_date_time(cur)
    cur.close()
    db.close()            