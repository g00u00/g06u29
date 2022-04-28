#!/usr/bin/env python3
#http://g06u29.nn2000.info/cgi-bin/form_action_db.py
import os,sys
import cgi, cgitb
import pymysql
import form_action_functions_db


cgitb.enable()
sys.stderr = sys.stdout
form = cgi.FieldStorage()

def form_action_db(form, db, cur):
    print ("\n<pre>") 
    #form_action_functions_db.form_dictionary(form) #Анализируем строку запроса
    form_action_functions_db.print_form_db(form) #Создаем форму и отправляем данные на сервер
    form_action_functions_db.db_list(form, db, cur) #Записываем в базу и оцениваем содержание
    print ("\n</pre>") 


if __name__=='__main__':
    print('''\
Content-type:text/html\r\n
<html>
<head>\n<title>Отладка, в файл, из файла, обработка</title>\n</head>
<body><h3>Отладка, в файл, из файла, обработка</h3><pre>
    ''')
    #соединяемся с базой данных
    db  =  pymysql.connect(host = "127.0.0.1", user = "g06u29", passwd = "mysql16", db = "g06u29", charset = "utf8",use_unicode = True) # Open database connection
    cur  =  db.cursor() # prepare a cur object using cursor() method
    cur.execute('SET NAMES utf8') # execute SQL query using execute() method
    form_action_db(form, db, cur)

