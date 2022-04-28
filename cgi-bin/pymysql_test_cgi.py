#!/usr/bin/env python3.4
import os, sys
import cgi, cgitb
import pymysql
cgitb.enable()


def solution():
    global varchar_1_val, bigint_1_val, double_1_val
    varchar_1_val = 'Формулировка'
    bigint_1_val = 12345
    double_1_val = 0.6789e5

    form = cgi.FieldStorage()
    print("\nform: ", form)
    #?varchar_1_val=1&bigint_1_val=2&double_1_val=3
    if (form.keys().__contains__("varchar_1_val") and form.keys().__contains__("bigint_1_val") and form.keys().__contains__("double_1_val")):
        varchar_1_val = form.getvalue('varchar_1_val')
        bigint_1_val = form.getvalue('bigint_1_val')
        double_1_val = form.getvalue('double_1_val')
        print((varchar_1_val, bigint_1_val, double_1_val))

    return("Задача и решение возвращаем через глобальную область видимости")



def pymysql_test(db, cur):
    #print("\nПишем в базу и считываем из базы")
    cur.execute("""DROP TABLE IF EXISTS `pymysql_test`""")
    db.commit()

    cur.execute("""\
    CREATE TABLE IF NOT EXISTS `pymysql_test` (
    `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
    `varchar_1` varchar(250) NOT NULL DEFAULT '',
    `bigint_1` BIGINT NOT NULL DEFAULT 0,
    `double_1` DOUBLE NULL DEFAULT 0.,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
    """)
    db.commit()

    #varchar_1_val = 'строка1строка2'
    #bigint_1_val = 123456789123456789
    #double_1_val = 0.123456789123456789e50
    
    print((varchar_1_val, bigint_1_val, double_1_val))
    cur.execute("""\
        INSERT INTO `pymysql_test` (`varchar_1`, `bigint_1`, `double_1` )
        VALUES ('%s', '%s', '%s')
        """
                % (varchar_1_val, bigint_1_val, double_1_val))
    db.commit()

    print("\n<p>Содержание последней записи из таблицы (cur.fetchone()): ")
    cur.execute("""\
        SELECT * FROM `pymysql_test` ORDER BY  `id` DESC LIMIT 1 OFFSET 0;
        """)
    result_one = cur.fetchone()
    print(result_one)
    print(type(result_one))

    print("\n<p>Содержание всей таблицы (неизменяемый список в списке) (cur.fetchall()): ")
    cur.execute("""\
        SELECT * FROM `pymysql_test`;
        """)
    result_all = cur.fetchall()
    print(result_all)
    print(type(result_all))

    print("\n<br>Представление содержания списка в виде таблицы")
    for result_one in result_all:
        for value in result_one:
            print(value, end=";")
        print("")

    print('\n<br>Функция pymysql_test() отработала и возвращает содержание таблицы в виде неизменяемого списка')
    return(result_all)


if __name__ == '__main__':
    print('''\
Content-type:text/html\r\n
<html>
<head>\n<title>В базу, из базы, обработка</title>\n</head>
<body><h3>В базу, из базы, обработка</h3><pre>
    ''')

    #получаем ответы
    result = solution()
    print(result)

    # соединяемся с базой данных
    db = pymysql.connect(host="127.0.0.1", user="g06u29", passwd="mysql16",
        db="g06u29", charset="utf8", use_unicode=True)  # Open database connection
    cur = db.cursor()  # prepare a cur object using cursor() method
    cur.execute('SET NAMES utf8')  # execute SQL query using execute() method
    # вызываем функция для работы с таблице  базы
    result = pymysql_test(db, cur)
    print(result)
    print(type(result))
    cur.close()
    db.close()
