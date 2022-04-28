<?php
$con = mysql_connect("avatar.bz8.ru","dbu_marsh_1","torrent");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }


mysql_select_db("db_marsh_1", $con);


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
VALUES ('Peter', 'Griffin', '35')");

mysql_query("INSERT INTO Persons (FirstName, LastName, Age)
VALUES ('Glenn', 'Quagmire', '33')");


$result = mysql_query("SELECT * FROM Persons");

while($row = mysql_fetch_array($result))
  {
  echo $row['FirstName'] . " " . $row['LastName'] . " " . $row['Age'];
  echo "<br />";
  }








mysql_close($con);
?> 