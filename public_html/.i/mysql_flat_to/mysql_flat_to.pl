#!/usr/bin/perl -w 
#use strict;              # спасает от глупых ошибок
use CGI::Carp qw (fatalsToBrowser);     # вывод ошибок к browser-у 
use DBI;


my $host = "localhost"; 
my $port = "3306"; 
my $db = "notroot"; # имя базы данных -
my $user = "notroot"; 
my $pass = "notroot"; # пароль

$dbh = DBI->connect("DBI:mysql:$db:$host:$port",$user,$pass)|| die $DBI::errstr;  
$dbh->do("SET NAMES 'utf8'");

{#Получение данных из формы и их начальная обработка
@m_param_name=1000;
@m_value=1000;
# Получение информации
$ip_env = $ENV{ "REMOTE_ADDR" };
$form_data = $ENV{'QUERY_STRING'};
$cookie = $ENV{'HTTP_COOKIE'};

# Меняем шестнадцатеричные коды символов на сами символы
$form_data =~ s/%(..)/pack("c",hex($1))/eg; 
# Меняем плюсы на пробелы
$form_data =~ tr/+/ /;
# Разбиваем пару на имя/значение поля
@pairs = split(/&/, $form_data);
}
foreach $pair (@pairs)
		{
		$n_i++; 
		($name, $value)=split(/=/,$pair);
		$m_name[$n_i]=$name;
		$m_value[$n_i]=$value;
		$filename=$m_value[$n_i-1];
		}
my $gorod = $m_value[1]; 
my $komnat= $m_value[2];
my $plochad= $m_value[3];
my $zena= $m_value[4];

print "Content-type: text/html \n\n";
print "<head>";
print "<meta http-equiv='content-type' content='text/html'  charset='windows-1251'>";
print "<title>Запись в базу и проверка</title>";
print "</head>";
print "<body>";

#print $gorod;
#-------------------------создаем таблицу в базе
$dbh->do("
CREATE TABLE flat_to (
id INT(32) not null AUTO_INCREMENT, 
date DATE, 
time TIME, 
gorod VARCHAR (128) , 
komnat INT(32),
plochad INT(32),
zena INT(32), 
PRIMARY KEY (id)
)
");
#-----------------------------------------------вставляем данные в таблицу-----------
$dbh->do("
INSERT INTO flat_to (
id,
date, 
time, 
gorod, 
komnat,
plochad,
zena 
) 
VALUES (
NULL, 
CURDATE(), 
CURTIME(),
'$gorod', 
'$komnat',
'$plochad',
'$zena'
)
");

print "<P>Десять последних записей в обратной последовательности ";
my $result = $dbh->prepare("
SELECT * FROM `flat_to`
ORDER BY `id` DESC
LIMIT 0 , 10
");
$result->execute();
while (my $ln = $result->fetchrow_hashref()) 
{
print "<br> Номер записи: $ln->{'id'}";
print " Дата:  $ln->{'date'}";   
print " Время: $ln->{'time'}";
print " Город:  $ln->{'gorod'}";   
print " Комнат:  $ln->{'komnat'}";   
print " Площадь:  $ln->{'plochad'}";   
print " Цена:  $ln->{'zena'}";   
print "\n\n";   
}
print "</P>";

print " <P>Последняя запись";
my $result = $dbh->prepare("
SELECT * FROM `flat_to`
ORDER BY `id` DESC
LIMIT 0 , 1
");
$result->execute();
while (my $ln = $result->fetchrow_hashref()) 
{
print "<br> Номер записи: $ln->{'id'}";
print " Дата:  $ln->{'date'}";   
print " Время: $ln->{'time'}";
print " Город:  $ln->{'gorod'}";   
print " Комнат:  $ln->{'komnat'}";   
print " Площадь:  $ln->{'plochad'}";   
print " Цена:  $ln->{'zena'}";   
print "\n\n";   
}
print "</P>";


 print "</body>";