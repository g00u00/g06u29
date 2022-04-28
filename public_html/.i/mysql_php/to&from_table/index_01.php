	<html>
	 <head>
	 <meta http-equiv='content-type' content='text/html'; charset='utf-8'>
	  <title>PHP&MySQL (удаляем, создаем, заполняем, считываем)</title> 
	 </head>
	 <body>


<?php
	$con = mysql_connect("localhost","notroot","notroot");
	if (!$con)
	  {
	  die('Could not connect: ' . mysql_error());
	  }
	mysql_select_db ("notroot", $con);



	$sql="set names utf8;";	mysql_query($sql,$con);

	$sql="DROP TABLE IF EXISTS `page`;";mysql_query($sql,$con); 
	
	$sql = "
	CREATE TABLE `page` (
    `id` int NOT NULL AUTO_INCREMENT,
	`date` DATE NOT NULL ,
	`time` TIME NOT NULL ,
	`l_1` varchar(256),
	`l_2` varchar(256),
	`title` varchar(256),
	`body` varchar(256),
	PRIMARY KEY(id)
	)DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
	";
	mysql_query($sql,$con); 

	$tmp=rand(5,15);
	mysql_query("INSERT INTO page (
	id,
	date,
	time,
	l_1,
	l_2,
	title,
	body)
	VALUES (null,CURDATE( ),CURTIME( ),'Случайное число -',$tmp, 'Содержание заголовка', 'Содержание тела')");

	echo "
	\n\n<table border=1>
	\n<tr>
	<td>id</td><td>Дата</td><td>Время</td><td>Поле_1</td><td>Поле_2</td><td>Заголовок</td><td>Тело</td>
	</tr>
	";

	$result = mysql_query("
	SELECT * 
	FROM  `page` 
	ORDER BY  `page`.`id` DESC 
	LIMIT 0 , 10
	");
	while($row = mysql_fetch_array($result))
	  {
		echo "\n<tr>";
		echo "<td>";
		echo $row['id'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['date'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['time'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['l_1'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['l_2'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['title'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['body'] ; 
		echo "</td>";
		echo "</tr>";
	  }
	echo "
	</table>
	";
	
	mysql_close($con);
?> 


<?php print "
  <br>Готово ...
 </body>
</html>
" ?>