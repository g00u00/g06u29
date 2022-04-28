#!/usr/bin/perl -w
#http://marshirov.ru/cgi-bin/personal_nabor.pl?control=010 
use CGI::Carp qw (fatalsToBrowser);     # вывод ошибок к browser-у 
use CGI;
use DBI;



print <<END_HTML; 	
Content-type: text/html \n\n
<head>
<meta http-equiv='content-type' content='text/html'  charset='windows-1251'>
<title>Набор персонала</title>
</head>
<body>
END_HTML

my $query = new CGI;
my $control = $query->param("control") ;  $control  =~ tr/+/ /;
my $cond_1 = $query->param("cond_1") ;  $cond_1  =~ tr/+/ /;
my $cond_2 = $query->param("cond_2") ;  $cond_2  =~ tr/+/ /;
my $id_vacancy = $query->param("id_vacancy") ;  $id_vacancy  =~ tr/+/ /;
my $vacancy = $query->param("vacancy") ;  $vacancy  =~ tr/+/ /;
my $fio = $query->param("fio") ;  $fio  =~ tr/+/ /;
my $year_of_birth = $query->param("year_of_birth") ;  $year_of_birth  =~ tr/+/ /;
my $sex = $query->param("sex") ;  $sex  =~ tr/+/ /;
my $education = $query->param("education") ;  $education  =~ tr/+/ /;
my $experience = $query->param("experience") ;  $experience  =~ tr/+/ /;
my $additional_information = $query->param("additional_information") ;  $additional_information  =~ tr/+/ /;
my $phone = $query->param("phone") ;  $phone  =~ tr/+/ /;


my $host = "localhost"; 
my $port = "3306"; 
my $db = "personal_nabor"; # имя базы данных -
my $user = "personal_nabor"; 
my $pass = "personal_nabor"; # пароль
my $dbh = DBI->connect("DBI:mysql:$db:$host:$port",$user,$pass)|| die $DBI::errstr;
$dbh->do("SET NAMES 'cp1251'");

#------------------------------------------------------



if ($control eq "vacancy_pervichka_insert") {vacancy_pervichka_insert($cond_1);}
if ($control eq "pervichka_insert_view") {pervichka_insert_view($cond_1);}
if ($control eq "vacancies_candidates") {vacancies_candidates($cond_1);}
if ($control eq "table_results_create_insert") {table_results_create_insert($cond_1);}
if ($control eq "table_results_obj1_alter_update") {table_results_obj1_alter_update($cond_1);}
if ($control eq "table_results_obj2_alter_update") {table_results_obj2_alter_update($cond_1);}
if ($control eq "factors_create_insert_update") {factors_create_insert_update($cond_1);}
if ($control eq "itog") {itog($cond_1);}

my $rc = $dbh->disconnect;  # соединение	
print "\n</body>"; 
print "\n</html>";
#-------------------------------------------------------------------------
#-------------------------------------------------------------------------
sub test()
{
	# - получаем в виде массива или конкретных элементов массива
	my $result = $dbh->prepare("
	SELECT* FROM`vacancy`
	");
	$result->execute();
	while (my @row = $result -> fetchrow_array())  {print "\n<br> @row";}
	#while (my @row = $result -> fetchrow_array()){print "\n<br>";$i=0; while ($row[$i]){print "\t $row[$i]";$i=$i+1; } }
	#/
	
	# - получаем в виде хэша и выводим нужные элементы
	my $result = $dbh->prepare("
	SELECT* FROM`vacancy`
	");
	$result->execute();
	while (my $row1 = $result->fetchrow_hashref()) 
		{print "\n<br>vacancy: $row1->{'vacancy'}";}
	return
	}
	#/



sub vacancy_pervichka_insert($cond_1)
{
print <<END_HTML;
<form method='get' action='../cgi-bin/personal_nabor.pl' target='_self'>
<input type='hidden' name='control' value='pervichka_insert_view'>
END_HTML

print "<h4>Список вакансий</h4>";
print "<table border=1>";
my $result = $dbh->prepare("
SELECT* FROM`vacancy`
");
$result->execute();
while (my $ln = $result->fetchrow_hashref()) 
	{
	print "<tr>
	<td>$ln->{'id'}
	<td><input type='radio' name='id_vacancy' value='$ln->{'id'}'>$ln->{'vacancy'}
	<td>$ln->{'min_salary'}
	<td>$ln->{'max_salary'}
	<td>$ln->{'description'}
	<td>$ln->{'place'}
	";
	}
print "</table>";

print <<END_HTML;
<h4>Выберите вакансию из таблицы и введите Ваши данные</h4>
ФИО<input type="text" name="fio" value=""  size=60>
<br>Год рождения <input type="date" name="year_of_birth" value="" title="в виде:1900-01-24" size=60>
<br>Пол <input type='radio' name='sex' value='м'>муж. <input type='radio' name='sex' value='ж'>женск.
<br>Образование <input type="text" name="education" value=""  size=60>
<br>Стаж работы по специальности, лет<input type="text" name="experience" value=""  size=60>
<br>Дополнительная информация<input type="text" name="additional_information" value=""  size=60>
<br>Телефон <input type="text" name="phone" value=""  size=60>
<br><input type="Reset"  name="reset" value="Очистить форму">	<input type=Submit name='submit' value='Уточнить/Записать'>
END_HTML

return
}


#-------------------------------------------------------
sub pervichka_insert_view($cond_1)
{

$dbh->do("
CREATE TABLE  IF  NOT EXISTS  `pervichka` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
`id_vacancy` INT UNSIGNED,
`vacancy` VARCHAR( 512 ) CHARACTER SET cp1251 COLLATE cp1251_general_ci NOT NULL ,
`fio` VARCHAR( 512 ) CHARACTER SET cp1251 COLLATE cp1251_general_ci NOT NULL ,
`year_of_birth` DATE NOT NULL ,
`sex`  ENUM('м', 'ж') ,
`education`  VARCHAR( 512 ),
`experience` VARCHAR( 512 ),
`additional_information` VARCHAR( 512 ),
`phone` VARCHAR( 512 ),
`date` DATE, 
`time` TIME, 
PRIMARY KEY ( `id` )
) 
#ENGINE=INNODB CHARACTER SET cp1251 COLLATE cp1251_general_ci; 
ENGINE=MyISAM  CHARACTER SET cp1251 COLLATE cp1251_general_ci;
");

print $id_vacancy;
$sql="SELECT * FROM `vacancy` where `id`='$id_vacancy'";
my $result=$dbh->prepare($sql);$result->execute();
while (my $row = $result -> fetchrow_hashref())  
 {$vacancy=$row->{'vacancy'};}

$dbh->do("
INSERT INTO `pervichka` 
(`id` ,`id_vacancy`,`vacancy`,`fio` ,`year_of_birth` ,`sex` ,`education`,`experience`,`additional_information`,`phone`,`date`,`time`)
VALUES 
(NULL ,'$id_vacancy','$vacancy','$fio','$year_of_birth' ,'$sex' ,'$education','$experience','$additional_information','$phone',CURDATE(),CURTIME());
");


my $result = $dbh->prepare("
SELECT* FROM`pervichka`
ORDER BY  `id` DESC 
LIMIT 0 , 1
");
$result->execute();
print "\n<p><font size=+1>Последняя  запись</font>";
while (my $ln = $result->fetchrow_hashref()) 
	{
	print "\n<br>";
	print "\n<br>Вакансия: $ln->{'vacancy'}";
	print "\n<br>Претендент: $ln->{'fio'}";
	print "\n<br>Возраст: $ln->{'year_of_birth'}";
	print "\n<br>Пол: $ln->{'sex'}";
	print "\n<br>Образование: $ln->{'education'}";
	print "\n<br>Стаж по специальности: $ln->{'experience'}";
	print "\n<br>Дополнительная инормация: $ln->{'additional_information'}";
	print "\n<br>Телефон: $ln->{'phone'}";
	print "\n<br>Дата регистрации: $ln->{'date'}";
	print "\n<br>Время регистрации: $ln->{'time'}";
	}
print "\n</p>";
}

#---------------------------------
sub vacancies_candidates($cond_1)
{
my $result = $dbh->prepare("
SELECT* FROM`vacancy`
");
$result->execute();
while (my $ln = $result->fetchrow_hashref()) 
	{
	print "<br><tr>
	<td><input type='radio' name='id_vacancy' value='$ln->{'id'}'>$ln->{'vacancy'}
	<td>$ln->{'min_salary'}
	<td>$ln->{'max_salary'}
	<td>$ln->{'description'}
	<td>$ln->{'place'}
	";
	$id_vacancy_current=$ln->{'id'};

	my $result1 = $dbh->prepare("
	SELECT* FROM`pervichka`
	WHERE `id_vacancy`='$id_vacancy_current'
	");
	$result1->execute();

	while (my $ln = $result1->fetchrow_hashref()) 
		{
	print "\n<br>";
	print "\n<br>ФИО: $ln->{'fio'}";
	print "\n<br>Возраст: $ln->{'year_of_birth'}";
	print "\n<br>Пол: $ln->{'sex'}";
	print "\n<br>Образование: $ln->{'education'}";
	print "\n<br>Стаж по специальности: $ln->{'experience'}";
	print "\n<br>Дополнительная инормация: $ln->{'additional_information'}";
	print "\n<br>Телефон: $ln->{'phone'}";
	print "\n<br>Дата регистрации: $ln->{'date'}";
	print "\n<br>Время регистрации: $ln->{'time'}";
		}
	print "\n</p>";	
	
	}
return
}


#-------------------------------------------------------
sub table_results_create_insert($cond_1)
{
if($cond_1 == "0")
{
print <<END_HTML;
<form method='get' action='../cgi-bin/personal_nabor.pl' target='_self'>
<input type='hidden' name='control' value='table_results_create_insert'>
END_HTML

print "<h4>Список вакансий</h4>";
print "<table border=1>";
my $result = $dbh->prepare("
SELECT* FROM`vacancy`
");
$result->execute();
while (my $ln = $result->fetchrow_hashref()) 
	{
	print "<tr>
	<td>$ln->{'id'}
	<td><input type='radio' name='cond_1' value='$ln->{'id'}'>$ln->{'vacancy'}
	<td>$ln->{'min_salary'}
	<td>$ln->{'max_salary'}
	<td>$ln->{'description'}
	<td>$ln->{'place'}
	";
	}
print "</table>";

print <<END_HTML;
<p>Выберите вакансию для оценки претендентов
<br><input type=Submit name='submit' value='Продолжить'>
</p>
END_HTML
}

$dbh->do("DROP  TABLE  IF  EXISTS  `results`;");
$dbh->do("
CREATE TABLE  IF  NOT EXISTS  `results` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
`id_vacancy` INT UNSIGNED,
`vacancy` VARCHAR( 512 ) CHARACTER SET cp1251 COLLATE cp1251_general_ci NOT NULL ,
`fio` VARCHAR( 512 ) CHARACTER SET cp1251 COLLATE cp1251_general_ci NOT NULL ,
`year_of_birth` DATE NOT NULL ,
`sex`  ENUM('м', 'ж') ,
`education`  VARCHAR( 512 ),
`experience` VARCHAR( 512 ),
`additional_information` VARCHAR( 512 ),
`phone` VARCHAR( 512 ),
`date` DATE, 
`time` TIME, 
PRIMARY KEY ( `id` )
) 
#ENGINE=INNODB CHARACTER SET cp1251 COLLATE cp1251_general_ci; 
ENGINE=MyISAM  CHARACTER SET cp1251 COLLATE cp1251_general_ci;
");


$dbh->do("
INSERT INTO `results` SELECT * FROM `pervichka`  WHERE id_vacancy='$cond_1';
");

=pod
my $result = $dbh->prepare("
INSERT INTO `results` SELECT * FROM `pervichka`  WHERE id_vacancy='$cond_1';
");
$result->execute();
=cut

# - получаем в виде массива или конкретных элементов массива

print"\n<br><h3>Избранные поля</h3>";
$sql="SELECT `vacancy`, `fio`, YEAR(CURDATE())-YEAR(`year_of_birth`) AS `age`, `experience`, `additional_information`  FROM`results`";
my $result=$dbh->prepare($sql);$result->execute();
while (my $row = $result -> fetchrow_hashref())  
 {print "\n<br>vacancy: $row->{'vacancy'};  fio: $row->{'fio'};  age: $row->{'age'};  experience: $row->{'experience'};  additional_information: $row->{'additional_information'};  ";}


print"\n<br><h3>Избранные поля в виде таблицы </h3>";
$sql="SELECT `vacancy`, `fio`, YEAR(CURDATE())-YEAR(`year_of_birth`) AS `age`,`experience`,`additional_information`  FROM`results`";
my $result=$dbh->prepare($sql);$result->execute();
print "<table border=1>";
while (my $row = $result -> fetchrow_hashref())  
 {print "\n<tr> <td>$row->{'vacancy'} <td>$row->{'fio'}  <td>$row->{'age'} <td>$row->{'experience'} <td>$row->{'additional_information'}";}
print "\n</table>";
 
print"\n<br><h3>Все поля и записи</h3>";
my $result = $dbh->prepare("
	SELECT* FROM`results`
	");
	$result->execute();
	while (my @row = $result -> fetchrow_array())  {print "\n<br> @row";}

return
}


#--------------------------------------------
#--------------------------------------------

sub table_results_obj1_alter_update($cond_1)
{

=pod
$dbh->do("
ALTER TABLE `results`
DROP  `age`, DROP `age_rel`, DROP `age_norm`;
");
=cut

$dbh->do("
ALTER TABLE  `results` 
ADD  `age` INT( 3 ) NOT NULL AFTER  `year_of_birth` ,
ADD  `age_rel` DECIMAL( 6,0 ) NOT NULL AFTER  `age`,
ADD  `age_norm` DECIMAL( 2,2 ) NOT NULL AFTER  `age_rel`;
");

$dbh->do("
UPDATE `results`
SET results.age=YEAR(CURDATE())-YEAR(year_of_birth);
");


$dbh->do("
UPDATE results
SET results.age_rel=
(CASE 
WHEN age <= 25 THEN '60'
WHEN age <= 35 THEN '80'
WHEN age <= 45 THEN '100'
WHEN age <= 55 THEN '80'
WHEN age <= 65 THEN '60'
WHEN age <= 75 THEN '40'
WHEN age > 75 THEN '0'
ELSE '0'
END
);
");

$sql="select SUM(age_rel) from `results`";
my $result = $dbh->prepare($sql); 
$result->execute();
while (my @row = $result -> fetchrow_array()) {$age_rel_sum=$row[0];}
$sql=join('',"UPDATE results SET age_norm=age_rel/",$age_rel_sum);
$dbh->do($sql);

# - получаем в виде массива или конкретных элементов массива
my $result = $dbh->prepare("
SELECT* FROM`results`
");
$result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}

return
}


sub table_results_obj2_alter_update($cond_1)
{
$dbh->do("
ALTER TABLE  `results` 
ADD  `experience_norm` DECIMAL( 6, 3 ) NOT NULL AFTER  `experience`;
");

$sql="select SUM(experience) from `results`";
my $result = $dbh->prepare($sql); 
$result->execute();
while (my @row = $result -> fetchrow_array()) {$experience_sum=$row[0];}
$sql=join('',"UPDATE results SET experience_norm=experience/",$experience_sum);
$dbh->do($sql);

# - получаем в виде массива или конкретных элементов массива
my $result = $dbh->prepare("
SELECT* FROM`results`
");
$result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}
return
}


sub factors_create_insert_update($cond_1)
{
$dbh->do("DROP TABLE  IF  EXISTS  `factors`;");
$dbh->do("
CREATE TABLE  `factors` (
`id` INT NOT NULL  AUTO_INCREMENT ,
`f_name` VARCHAR( 512 ) NOT NULL ,
`f_value` DECIMAL( 6, 2 ) NOT NULL ,
`f_norm` DECIMAL( 6, 2 ) ,
PRIMARY KEY (  `id` )
) 
ENGINE = MYISAM 
CHARACTER SET cp1251 COLLATE cp1251_general_ci;
");


$dbh->do("
INSERT INTO  `factors` 
(`id` ,`f_name` ,`f_value` ,`f_norm`)
VALUES 
('',  'age',  '60',  ''),
('',  'experience',  '45',  '');
");

$sql="select SUM(f_value) from `factors`";
my $result = $dbh->prepare($sql); 
$result->execute();
while (my @row = $result -> fetchrow_array()) {$sum_f_value=$row[0];}
$sql=join('',"UPDATE factors SET f_norm=f_value/",$sum_f_value);
$dbh->do($sql);

my $result = $dbh->prepare("
SELECT* FROM`factors`
");
$result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}

return
}

sub itog($cond_1)
{
$sql="ALTER TABLE  `results` ADD  `itog` DECIMAL(5,3) NOT NULL ;";
my $result = $dbh->prepare($sql); $result->execute();

$sql="select `f_norm` from `factors` where `f_name`='age'";
my $result = $dbh->prepare($sql); $result->execute();
while (my @row = $result -> fetchrow_array()) {$f_age_norm=$row[0];}

$sql="select `f_norm` from `factors` where `f_name`='experience'";
my $result = $dbh->prepare($sql); $result->execute();
while (my @row = $result -> fetchrow_array()) {$f_experience_norm=$row[0];}



$sql="UPDATE results SET itog=(age_norm*'$f_age_norm' + experience_norm*'$f_experience_norm')";
my $result = $dbh->prepare($sql); $result->execute();

print "\n<br> Нормализованные факторы";
$sql="SELECT* FROM`factors`";
my $result=$dbh->prepare($sql);$result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}

print "\n<br> Важнейшие результаты";
$sql="SELECT* FROM`results`";
my $result=$dbh->prepare($sql);$result->execute();
while (my $row = $result -> fetchrow_hashref())  
 {print "\n<br>vacancy: $row->{'vacancy'};  fio: $row->{'fio'};  age: $row->{'age'};  age_norm: $row->{'age_norm'};  experience_norm: $row->{'experience_norm'};  itog: $row->{'itog'};  ";}


print "\n<br> Сводная таблица";
$sql="SELECT* FROM`results`";
my $result=$dbh->prepare($sql);$result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}

 
return
}


