<?php 
	// �������� �����������
	/* 
	  ������������ ��������� 
	  �����
	*/
?>


	<html>
	 <head>
	  <title>��������� PHP&MySQL (��������� ������ � ��������� ��� �������)</title> 
	 </head>
	 <body>


<?php

	$con = mysql_connect("localhost","mysql_php","mysql_php");
	if (!$con)
	  {
	  die('Could not connect: ' . mysql_error());
	  }
	mysql_select_db ("mysql_php", $con);
    mysql_query ("SET NAMES 'cp1251'");


	$sql = "
	CREATE TABLE site_pages (
    id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(id),
	`date` DATE NOT NULL ,
	`time` TIME NOT NULL ,
	l_1 varchar(256),
	l_2 varchar(256),
	title text,
	body text
	)
	";
	mysql_query($sql,$con); 

	$tmp=rand(5,15);
	mysql_query("INSERT INTO site_pages (
	id,
	date,
	time,
	l_1,
	l_2,
	title,
	body)
	VALUES (null,CURDATE( ),CURTIME( ),'��������� ����� -',$tmp, '���������', '����')");

	echo "
	\n\n<table border=1>
	\n<tr>
	<td>id</td><td>����</td><td>�����</td><td>����_1</td><td>����_2</td><td>���������</td><td>����</td>
	</tr>
	";


	$result = mysql_query("SELECT * FROM site_pages");
	while($row = mysql_fetch_array($result))
	  {
	 // echo $row['FirstName'] . " " . $row['LastName'] . " " . $row['Age'];
	 // echo "<br />";
	  //
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
	</table>\n\n
	";



	mysql_close($con);
?> 


<?php print "
  <br>������!
 </body>
</html>
" ?>