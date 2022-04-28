import os,sys

def form_dictionary(form):
    print ("Анализируем строку запроса")
    print ("ключи(form.keys):",form.keys())
    form_keys_list=list()
    form_values_list=list() 
    form_values_dict=dict() 
    print  ("Названия ключей  и их значения (как есть)")
    i=0
    for form_key in form.keys():
        print  (i,  ": ", form_key," = ", form.getvalue(form_key))
        form_keys_list.append(form_key)
        form_values_list.append(form.getvalue(form_key))
        form_values_dict.update({form_key: form.getvalue(form_key)})
        i+=1
    print('\nВ виде словаря (form_values_dict):\n', form_values_dict)
    # сортируем список ключей (что-бы поля не сбоили при выводе в файл)
    print  ("\n","Ключи  и их значения после сортировки ")
    form_keys_list.sort()
    i=0
    for form_key in form_keys_list:
        print  (i,  ": ", form_key," = ", form.getvalue(form_key))
        i+=1
    print("form_keys_list: ", form_keys_list)
    
    if "experience" in form:
        print('\n\n Пример списка из строки запроса (experience): ', form.getvalue('experience'))
        strExperiences = form.getvalue('experience')
        print("strExperiences: ", strExperiences)
        intExperiences = list()
        for item in strExperiences: intExperiences.append(int(item))
        print("intExperiences: ", intExperiences, "   sum(intExperiences): ", sum(intExperiences), "\n")  



def print_form_db(form):
    print("\nСоздаем форму и отправляем данные на сервер")
    print('<form  action="./form_action_db.py" target="_self" method="get">')
    #print('<form  action="./py_sql_pages.py" target="_self" method="get">')
    print('''\
Первая переменная:<input type="Техт" name="variable_1" value="1" >
Вторая переменная:<input type="Техт" name="variable_2" value="2" >
Третья переменная:<input type="Техт" name="variable_3" value="3" >
<!--Нижерасположенное удалять нельзя, редактировать можно-->
Название файла: <input type="Техт" name="000_file_name" value="g06u32.txt" >
Тип записи в файл:<select name="010_mode">
<OPTION value="a">a - дозаписать в файл(таблицу базы)</OPTION> 
    <OPTION value="w">w - очистить файл(таблицу базы) и записать</OPTION> 
    </select>
<input type="hidden" name="function" value="page">
<input type="hidden" name="page_id" value="9">
<input type="submit" name="submit" value="Отправить">
</form>
    ''')


def db_list(form, db, cur):
    #https://dev.mysql.com/doc/refman/8.0/en/tutorial.html
    #https://dev.mysql.com/doc/refman/8.0/en/examples.html
    #https://dev.mysql.com/doc/refman/8.0/en/example-maximum-column.html
    #https://dev.mysql.com/doc/refman/8.0/en/functions.html
    if form.keys().__contains__("variable_1") and form.keys().__contains__("variable_2") and form.keys().__contains__("variable_3"):
        print("\nПишем в базу и считываем из базы")
        if (form.getvalue('010_mode') ==  "w"):
            cur.execute("""DROP TABLE IF EXISTS `db_list`""")
            db.commit()
        cur.execute("""\
        CREATE TABLE IF NOT EXISTS `db_list` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `db_variable_1` varchar(255) NOT NULL,
        `db_variable_2` decimal(10,0)  NOT NULL,
        `db_variable_3` decimal(10,0)  NOT NULL,
        PRIMARY KEY (`id`))
        ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
        """)
        db.commit()

        cur.execute("""INSERT INTO `db_list` (`db_variable_1`, `db_variable_2`, `db_variable_3`) 
        VALUES ('%s', '%s', '%s')""" % ( form["variable_1"].value, form["variable_2"].value , form["variable_3"].value))
        db.commit()

        cur.execute("""SELECT * FROM `db_list`;""")
        result_all  =  cur.fetchall()
        print("\n<p>Содержание всей таблицы (список в списке) (cur.fetchall()): ")
        print(result_all)

        print("\n<br>Представление содержание таблицы по полям и записям  ")
        for result_one in result_all:
            for value in result_one:
                print (value, end=";")
            print("")

        cur.execute("""SELECT COUNT(`db_variable_1`) FROM `db_list`;""")
        result = cur.fetchone()
        print("cur.fetchone():", result)    
        print("cur.fetchone()[0]:", result[0])  
        all_answers  =  result[0]        
            
        cur.execute("""SELECT COUNT( `db_variable_1` ) FROM `db_list` WHERE `db_variable_1` + `db_variable_2` = `db_variable_3` ;""")
        correct_ansvers  =  cur.fetchone()[0]

        print("\nКоличество вопросов: ",  all_answers )
        print("Количество правильных ответов: ",   correct_ansvers)
        print("Доля правильных ответов: ",  correct_ansvers/all_answers )
    else: print("\nНеобходимо заполнить форму")
