<?php 
	// строчный комментарий
	/* 
	  комментируем несколько 
	  строк
	*/
?>

<?php print "
	<html>
	 <head>
	  <title>Тестируем PHP&MySQL</title> 
	 </head>
	 <body>
" ?>


<?php

	$con = mysql_connect("localhost","notroot","notroot");
	if (!$con)
	  {
	  die('Could not connect: ' . mysql_error());
	  }
	mysql_select_db ("notroot", $con);
    mysql_query ("SET NAMES 'utf8'");
    mysql_query ("USE `notroot`");
	

$sql = "
CREATE TABLE IF NOT EXISTS `Persons` 
(id int  AUTO_INCREMENT PRIMARY KEY,
FirstName varchar(15),
LastName varchar(15),
Age int
)
DEFAULT CHARACTER SET = utf8
DEFAULT COLLATE = utf8_general_ci; 
";
mysql_query($sql,$con); 

$sql="INSERT INTO Persons (FirstName, LastName, Age)
	VALUES ('$_POST[firstname]','$_POST[lastname]','$_POST[age]')";
if (!mysql_query($sql,$con))
	{die('Error: ' . mysql_error());
	}

echo "В базу данных добавлена  одна запись  c использованием  формы";

echo "<p>&nbsp;</p>";

echo "	\n\n<table border=1>";
echo "\n\n<caption>Выводим 5 последних записей из базы";

$result = mysql_query("
SELECT * , CURDATE() AS `date`, CURTIME() AS `time` FROM Persons
ORDER BY `Persons`.`id` DESC
LIMIT 0 , 5
");
while($row = mysql_fetch_array($result))
  {
 // echo $row['FirstName'] . " " . $row['LastName'] . " " . $row['Age'];
 // echo "<br />";
	echo "\n<tr>";
	echo "<td>";
	echo $row['id'] ; 
	echo "<td>";
	echo $row['FirstName'] ; 
	echo "<td>";
	echo $row['LastName'] ; 
	echo "<td>";
	echo $row['Age'] ; 
	echo "<td>";
	echo $row['date'] ; 
	echo "<td>";
	echo $row['time'] ; 
	echo "</tr>";
  }

echo "
</table>\n\n
";






mysql_close($con);
?> 


<?php print "
<br>Готово!
</body>
</html>
" ?>