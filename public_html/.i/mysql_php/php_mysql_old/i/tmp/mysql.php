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

	$con = mysql_connect("marshirov.nnov.ru", "dbu","passw");
	if (!$con)
	  {
	  die('Could not connect: ' . mysql_error());
	  }
	mysql_select_db ("db", $con);
    mysql_query ("SET NAMES 'cp1251'");


	$sql = "
	CREATE TABLE Persons 
	(
	personID int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(personID),
	FirstName varchar(255),
	LastName varchar(255),
	Age int
	)
	";
	
	//mysql_query($sql,$con); 

	mysql_query("
	INSERT INTO Persons (FirstName, LastName, Age)
	VALUES ('Иван', 'Петров', '25')
	");

	echo "	\n\n<table>";
	echo "\n\n<caption> Записываем и выводим последнюю запись из базы";

	$result = mysql_query("
	SELECT * , CURDATE() AS 'date', CURTIME() AS 'time' FROM Persons
	ORDER BY `Persons`.`personID` DESC
	LIMIT 0 , 1
	");
	while($row = mysql_fetch_array($result))
	  {
	 // echo $row['FirstName'] . " " . $row['LastName'] . " " . $row['Age'];
	 // echo "<br />";
		echo "\n<tr>";
		echo "<td>";
		echo $row['personID'] ; 
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