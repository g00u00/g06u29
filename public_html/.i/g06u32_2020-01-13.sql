-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 13 2020 г., 21:21
-- Версия сервера: 5.5.53-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `g06u32`
--

-- --------------------------------------------------------

--
-- Структура таблицы `py_page_visits`
--

CREATE TABLE IF NOT EXISTS `py_page_visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_ip` varchar(255) NOT NULL,
  `page_date` date NOT NULL,
  `page_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `py_page_visits`
--

INSERT INTO `py_page_visits` (`id`, `page_id`, `page_title`, `page_ip`, `page_date`, `page_time`) VALUES
(1, 20, 'Первая страница', '95.79.90.29', '2020-01-13', '21:09:29'),
(2, 5, 'Диграммы', '95.79.90.29', '2020-01-13', '21:09:33'),
(3, 1, 'Форма(из базы)', '95.79.90.29', '2020-01-13', '21:09:50'),
(4, 2, 'Форма (обработка и анализ)', '95.79.90.29', '2020-01-13', '21:10:03'),
(5, 3, 'Лабораторная работа', '95.79.90.29', '2020-01-13', '21:10:07'),
(6, 3, 'Лабораторная работа', '95.79.90.29', '2020-01-13', '21:10:18'),
(7, 4, 'CGI', '95.79.90.29', '2020-01-13', '21:10:22'),
(8, 6, 'Магазин', '95.79.90.29', '2020-01-13', '21:10:28'),
(9, 7, 'МагазинОбработка ', '95.79.90.29', '2020-01-13', '21:10:39'),
(10, 5, 'Диграммы', '95.79.90.29', '2020-01-13', '21:10:56');

-- --------------------------------------------------------

--
-- Структура таблицы `qs_shop`
--

CREATE TABLE IF NOT EXISTS `qs_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qs_shop_name` varchar(255) NOT NULL,
  `qs_shop_price` decimal(10,0) NOT NULL,
  `qs_shop_amount` int(10) unsigned NOT NULL,
  `qs_shop_type` varchar(255) NOT NULL,
  `qs_shop_date` date NOT NULL,
  `qs_shop_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_lev_1` varchar(256) DEFAULT NULL,
  `shop_lev_2` varchar(256) DEFAULT NULL,
  `shop_name` varchar(256) DEFAULT NULL,
  `shop_artikul` varchar(256) DEFAULT NULL,
  `shop_img` varchar(64) DEFAULT NULL,
  `shop_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `shop`
--

INSERT INTO `shop` (`shop_id`, `shop_lev_1`, `shop_lev_2`, `shop_name`, `shop_artikul`, `shop_img`, `shop_price`) VALUES
(13, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 01', '10001', '1_1.png', 60.00),
(14, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 02', '10002', '1_2.png', 80.00),
(15, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 03', '10003', '1_3.png', 100.00),
(16, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 03', '10004', '1_4.png', 160.00),
(17, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 05', '10005', '1_5.png', 180.00),
(18, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 06', '10006', '1_6.png', 170.00),
(19, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 07', '10007', '1_7.png', 160.00),
(20, 'Щитовое оборудование', 'Щиты распределительные', 'Щит распределительный навесной ЩРн-П-4 IP30 пластиковый белый 08', '10008', '1_8.png', 120.00),
(21, 'Щитовое оборудование', 'Аппараты защиты', 'Выключатель дифференциального тока  001', '200001', 'uso_002.jpg', 1260.00),
(22, 'Щитовое оборудование', 'Аппараты защиты', 'Выключатель дифференциального тока  002', '200001', 'uso_003.jpg', 1360.00),
(23, 'Щитовое оборудование', 'Аппараты защиты', 'Выключатель дифференциального тока  003', '200001', 'uso_004.jpg', 1760.00),
(24, 'Щитовое оборудование', 'Аппараты защиты', 'Выключатель дифференциального тока  004', '200001', 'uso_005.jpg', 1160.00);

-- --------------------------------------------------------

--
-- Структура таблицы `sql_pages`
--

CREATE TABLE IF NOT EXISTS `sql_pages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_prior_navig` int(10) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_keywords` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `sql_pages`
--

INSERT INTO `sql_pages` (`page_id`, `page_prior_navig`, `page_title`, `page_keywords`, `page_content`) VALUES
(1, 750, 'Форма(из базы)', 'Ключевые слова страницы с формой', '<form  action="./py_sql_pages.py"   target=''_self'' method=''get''>\n<input type="Hidden" name="function" value="page">\n<input type="Hidden" name="page_id" value="2">\n<input type="Hidden" name="file_name" value="qs_file.txt" >\n<p>\nНазвание: <input type="Text" name="qs_name" value=""   size=20 >\nЦена: <input type="Text"  name="qs_price" value="0"    size=6 >\nКоличество: <input type="Text"  name="qs_amount" value="0"    size=6 >\nТип:<select name="qs_type">\n    <OPTION value="Доходы">Доходы</OPTION> \n    <OPTION value="Расходы">Расходы</OPTION>\n    <OPTION value="drop">Удалить таблицу и файлы</OPTION>\n    </select>\n</p>\n<p>\n<input type="reset"  name="reset" value="Обновить">\n<input type="submit" name="submit" value="Отправить">\n</p>\n</form>\n'),
(2, 749, 'Форма (обработка и анализ)', 'Ключевые слова обработки формы', ''),
(3, 650, 'Лабораторная работа', 'Ключевые слова лабораторной работы', ''),
(4, 600, 'CGI', 'cgi-тестирование', ''),
(5, 500, 'Диграммы', 'Ключевые слова диаграмм', ''),
(6, 550, 'Магазин', 'Ключевые слова магазина', ''),
(7, 540, 'МагазинОбработка ', 'Формирование заказа', 'Содержание формирования заказа'),
(20, 800, 'Первая страница', 'Ключевые слова первой страницы', 'Содержание первой страницы');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
