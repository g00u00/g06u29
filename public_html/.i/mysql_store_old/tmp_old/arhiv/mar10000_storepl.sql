-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Авг 17 2012 г., 20:32
-- Версия сервера: 5.5.24
-- Версия PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;

--
-- База данных: `mar10000_storepl`
--

-- --------------------------------------------------------

--
-- Структура таблицы `moving`
--
-- Создание: Авг 17 2012 г., 16:26
-- Последнее обновление: Авг 17 2012 г., 16:26
--

CREATE TABLE IF NOT EXISTS `moving` (
  `id` int(11) NOT NULL,
  `action` varchar(64) NOT NULL,
  `id_store` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `artikul` varchar(256) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ip` varchar(64) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `moving`
--

INSERT INTO `moving` (`id`, `action`, `id_store`, `name`, `artikul`, `amount`, `price`, `ip`, `date`, `time`) VALUES
(1, 'receiving', 1, 'береза', '10001', 10, 30.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(2, 'receiving', 2, 'медведь', '10002', 20, 40.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(3, 'receiving', 3, 'горы', '10003', 30, 20.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(4, 'receiving', 4, 'реки', '10004', 40, 30.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(1, 'shipping', 1, 'береза', '10001', -1, 60.00, '213.87.130.25', '2012-08-17', '20:26:13'),
(2, 'shipping', 2, 'медведь', '10002', -2, 80.00, '213.87.130.25', '2012-08-17', '20:26:13'),
(3, 'shipping', 3, 'горы', '10003', -3, 40.00, '213.87.130.25', '2012-08-17', '20:26:13'),
(4, 'shipping', 4, 'реки', '10004', -4, 60.00, '213.87.130.25', '2012-08-17', '20:26:13');

-- --------------------------------------------------------

--
-- Структура таблицы `receiving`
--
-- Создание: Авг 17 2012 г., 16:24
-- Последнее обновление: Авг 17 2012 г., 16:25
--

CREATE TABLE IF NOT EXISTS `receiving` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL,
  `id_store` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `artikul` varchar(256) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ip` varchar(64) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `receiving`
--

INSERT INTO `receiving` (`id`, `action`, `id_store`, `name`, `artikul`, `amount`, `price`, `ip`, `date`, `time`) VALUES
(1, 'receiving', 1, 'береза', '10001', 10, 30.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(2, 'receiving', 2, 'медведь', '10002', 20, 40.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(3, 'receiving', 3, 'горы', '10003', 30, 20.00, '213.87.130.25', '2012-08-17', '20:25:17'),
(4, 'receiving', 4, 'реки', '10004', 40, 30.00, '213.87.130.25', '2012-08-17', '20:25:17');

-- --------------------------------------------------------

--
-- Структура таблицы `shipping`
--
-- Создание: Авг 17 2012 г., 16:24
-- Последнее обновление: Авг 17 2012 г., 16:26
--

CREATE TABLE IF NOT EXISTS `shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL,
  `id_store` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `artikul` varchar(256) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ip` varchar(64) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `shipping`
--

INSERT INTO `shipping` (`id`, `action`, `id_store`, `name`, `artikul`, `amount`, `price`, `ip`, `date`, `time`) VALUES
(1, 'shipping', 1, 'береза', '10001', 1, 60.00, '213.87.130.25', '2012-08-17', '20:26:13'),
(2, 'shipping', 2, 'медведь', '10002', 2, 80.00, '213.87.130.25', '2012-08-17', '20:26:13'),
(3, 'shipping', 3, 'горы', '10003', 3, 40.00, '213.87.130.25', '2012-08-17', '20:26:13'),
(4, 'shipping', 4, 'реки', '10004', 4, 60.00, '213.87.130.25', '2012-08-17', '20:26:13');

-- --------------------------------------------------------

--
-- Структура таблицы `store`
--
-- Создание: Авг 17 2012 г., 11:18
-- Последнее обновление: Авг 17 2012 г., 11:18
--

CREATE TABLE IF NOT EXISTS `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l1` varchar(256) DEFAULT NULL,
  `l2` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `artikul` varchar(256) DEFAULT NULL,
  `price_opt` decimal(10,2) DEFAULT NULL,
  `price_rosn` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `l1` (`l1`,`l2`,`name`,`artikul`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `store`
--

INSERT INTO `store` (`id`, `l1`, `l2`, `name`, `artikul`, `price_opt`, `price_rosn`) VALUES
(1, 'открытки', 'флора', 'береза', '10001', 30.00, 60.00),
(2, 'открытки', 'фауна', 'медведь', '10002', 40.00, 80.00),
(3, 'открытки', 'пейзажи', 'горы', '10003', 20.00, 40.00),
(4, 'открытки', 'пейзажи', 'реки', '10004', 30.00, 60.00);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
