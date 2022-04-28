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

	$con = mysql_connect("localhost","mar10000_hse","marhse");
	if (!$con)
	  {
	  die('Could not connect: ' . mysql_error());
	  }
	mysql_select_db ("mar10000_sitepl", $con);
    mysql_query ("SET NAMES 'cp1251'");



	$sql = "CREATE TABLE Persons 
	(
	personID int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(personID),
	FirstName varchar(15),
	LastName varchar(15),
	Age int
	)";
	
	mysql_query($sql,$con); 

	mysql_query("INSERT INTO Persons (FirstName, LastName, Age)
	VALUES ('Иван', 'Петров', '25')");

	echo "
	\n\n<table>
	\n<tr><td>FirstName</td><td>LastName</td><td>Age</td></tr>
	";



	$result = mysql_query("SELECT * FROM Persons");
	while($row = mysql_fetch_array($result))
	  {
	 // echo $row['FirstName'] . " " . $row['LastName'] . " " . $row['Age'];
	 // echo "<br />";
	  //
		echo "\n<tr>";
		echo "<td>";
		echo $row['FirstName'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['LastName'] ; 
		echo "</td>";
		echo "<td>";
		echo $row['Age'] ; 
		echo "</td>";
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