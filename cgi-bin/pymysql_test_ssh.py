import pymysql
dir(pymysql)
pymysql.
db  =  pymysql.connect(host = "127.0.0.1", user = "g00u00", passwd = "mysql16", db = "g00u00", charset = "utf8",use_unicode = True)
cur = db.cursor()
cur.execute('''DESC g00u00.g00u00_pet;''')
cur.fetchone()
cur.fetchall()
cur.fetchmany(1)
rows = cur._rows
for item in rows:
    print(item[0])
 sql = 'SELECT * FROM g06u29.g06u29_pet;'
 cur.execute(sql)

cur.close()
db.close()



CREATE TABLE IF NOT EXISTS `pymysql_test` (
`id` int(20) unsigned NOT NULL AUTO_INCREMENT,
`varchar_1` varchar(250) NOT NULL DEFAULT '',
`bigint_1` BIGINT NOT NULL DEFAULT 0,
`double_1` DOUBLE NULL DEFAULT 0.,
PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;


varchar_1_val = 'строка1строка2'
bigint_1_val = 123456789123456789
double_1_val = 0.123456789123456789e50



cur.execute("""INSERT INTO `pymysql_test` (`varchar_1`, `bigint_1`, `double_1` )VALUES ('%s', '%s', '%s')""" % (
    varchar_1_val, bigint_1_val, double_1_val))
db.commit()

result_all = cur.fetchall()
print(result_all)
print(type(result_all))

