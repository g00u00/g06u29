cd ~/
tar -cpf *.tar
http:// ...public_html/db/mysql_store/index.html

==================
~/.htaccess
AddDefaultCharset utf-8
Options +Indexes
DirectoryIndex index.htm
==================
Создать базу
или таблицы в базе notroot - префиксом таблиц - личный логин
Наполнить содеражанием для тестирования
--------------------
DROP TABLE IF EXISTS `shop_store`;
CREATE TABLE IF NOT EXISTS `shop_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l1` varchar(256) DEFAULT NULL,
  `l2` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `artikul` varchar(256) DEFAULT NULL,
  `price_opt` decimal(10,2) DEFAULT NULL,
  `price_rosn` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `shop_store` (`l1`, `l2`, `name`, `artikul`, `price_opt`, `price_rosn`) VALUES
('открытки', 'флора', 'береза', '10001', 30.00, 60.00),
('открытки', 'фауна', 'медведь', '10002', 40.00, 80.00),
('открытки', 'пейзажи', 'горы', '10003', 20.00, 40.00),
('открытки', 'пейзажи', 'реки', '10004', 30.00, 60.00);

SELECT * FROM `store`;


================================

*.pl - откорректировать (база, пользователь, пароль)

================================
Оприходовать несколько изделий
================================
Все протестировать
================================
Создать свой интерфейс (навигацию лучше отдельным файлом, затем считывать)
=========================
Наполнить своим содержанием
=========================
Расчитать:
-ежемесячные выручку, затрату и прибыль
-годовую прибыль
=========================

DROP TABLE IF EXISTS income;
CREATE  TABLE income
SELECT shipping.id, shipping.name, shipping.amount, shipping.amount * ( shipping.price - receiving.price ) AS income
FROM shipping
LEFT JOIN `receiving` ON `receiving`.`name` = `shipping`.`name`
GROUP BY shipping.id;
SELECT * FROM `income`;
SELECT COUNT(income), SUM(income) FROM `income`;

--------------------

http://notroot.nn2000.info/cgi-bin/mysql_store.pl?control=for_visitor&cond_1=%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BA%D0%B8&cond_2=%D1%84%D0%BB%D0%BE%D1%80%D0%B0

 