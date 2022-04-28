#!/usr/bin/perl -w
use CGI;
use CGI::Carp qw (fatalsToBrowser);     # вывод ошибок к browser-у 
use DBI;

#$remote_address = $ENV{ "REMOTE_ADDR" };
#$query_str = $ENV{'QUERY_STRING'}; 


print <<END_HTML; 	
Content-type: text/html \n\n
<head>
<meta http-equiv='content-type' content='text/html'  charset='utf-8'>
<title>Оформление ...</title>
</head>
<body>
END_HTML

my $query = new CGI;
my $control = $query->param("control") ;  $control  =~ tr/+/ /;
my $cond_db = $query->param("cond_db") ;  $cond_db  =~ tr/+/ /;
my $cond_1 = $query->param("cond_1") ;  $cond_1  =~ tr/+/ /;
my $cond_2 = $query->param("cond_2") ;  $cond_2  =~ tr/+/ /;

my $host = "localhost"; 
my $port = "3306"; 
my $db = "notroot"; # имя базы данных -
my $user = "notroot"; 
my $pass = "notroot"; # пароль
my $dbh = DBI->connect("DBI:mysql:$db:$host:$port",$user,$pass)|| die $DBI::errstr;
$dbh->do("SET NAMES 'utf8'");


#------------------------------------------------------
if ($control eq "for_visitor") {for_visitor($control, $cond_db, $cond_1, $cond_2);}
if ($control eq "to_db") {to_db ($control, $cond_db, $cond_1, $cond_2);}
moving($control, $cond_db, $cond_1, $cond_2);

#------------------------------------------------------
my $rc = $dbh->disconnect;  # соединение	
print "\n</body>"; 
print "\n</html>";
#-------------------------------------------------------------------------
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
#------------------------------------------------------------------------
sub for_visitor($control, $cond_db, $cond_1, $cond_2,)
{
print <<END_HTML; 
<form  action="../cgi-bin/mysql_store.pl"   target='_self' method='get'>
<table  cellpadding=15 cellspacing=1 border=0>
END_HTML
print "<input type='Hidden' name='control' value='to_db'>";
print "
<SELECT name='cond_db'>
	<OPTION selected value='shop_receiving'>оприходовать (менеджеру)</OPTION>
    <OPTION selected value='shop_shipping'>оформить отгрузку(менеджеру)</OPTION>
    <OPTION selected value='shop_ordering'>заказать(посетителю)</OPTION>
/SELECT>
";

print "<input type='Hidden' name='cond_1' value='$cond_1'>";
print "<input type='Hidden' name='cond_2' value='$cond_2'>";

print "\n<br>группа- $cond_1 подгруппа - $cond_2 ";

#--считывем текущие атрибуты товаров
=pod
$sql="
SELECT *
FROM `shop_store`
-- WHERE `shop_store`.`price_rosn` <='40'
-- ORDER BY `shop_store`.`price_rosn` DESC 
;
";

=cut


=pod
$sql="
SELECT * 
FROM  `shop_store` 
WHERE  `l1` LIKE  '$cond_1'
AND  `l2` LIKE  '$cond_2'
;
";

=cut

$sql="
SELECT * 
FROM  `shop_store`
-- ORDER BY `l1`,`l2`,`name` ASC  
;
";


my $result = $dbh->prepare($sql); $result->execute();
$i_td=0;
while (my $row = $result->fetchrow_hashref()) 
{
my $id=$row->{'id'};
my $name=$row->{'name'};
my $artikul=$row->{'artikul'};
my $price_opt=$row->{'price_opt'};
my $price_rosn=$row->{'price_rosn'};

#--определяем наличие
	$sum_amount=0;
	$sql="
		SELECT SUM(`amount`) as `sum_amount`
		FROM `shop_moving`
		WHERE  `id_store`='$id'
		GROUP BY `id_store`
		;
	";
	my $result=$dbh->prepare($sql);$result->execute();
	while (my $row = $result -> fetchrow_hashref())  
		{$sum_amount = $row->{'sum_amount'};
		 }
#/------------

my $img=join('',"../public_html/db/mysql_store/img/",$artikul,".jpg");
# - количество колонок в таблице вывода
if ($i_td >= 2){$i_td=0; print "\n<tr>" }
print "\n<td> ";
print "<img src=$img height='100'>";
print "<br>", $name," ", $price_rosn,"", "р. Наличие:",$sum_amount ;

print "<input type='Hidden' name='id_store' value=$id>";
print "<br>Заказать: <input type='Text' name='amount' value='0'  size=2 > ";
$i_td=$i_td+1;
}

print <<END_HTML; 
</table>
<p>
<input type='Reset'  name='reset' value='Очистить'>
<input type='Submit' name='submit' value='Отправить'>
</p>
END_HTML

return
}


sub to_db ($control, $cond_db, $cond_1, $cond_2)
{
@m_id_store=300;
@m_amount=300;

print $control, $cond_db, $cond_1, $cond_2;

$ip = $ENV{ "REMOTE_ADDR" };
$query_str = $ENV{'QUERY_STRING'}; 
$query_str =~ s/%(..)/pack("c",hex($1))/eg;
$query_str =~ tr/+/ /;

print $remote_address, $query_str;

@pairs = split(/&/, $query_str);
$n_i = 0;
foreach $pair (@pairs)
    {(my $name, $value)=split(/=/,$pair);
		if ($name eq "id_store"){$n_i=$n_i+1; $m_id_store[$n_i]=$value;}
		if ($name eq "amount") {$m_amount[$n_i]=$value;}
	}

#$sql=join ('',"DROP TABLE  IF  EXISTS  `",$cond_db,"`");
$dbh->do($sql);
$sql=join('',"
	CREATE TABLE IF NOT EXISTS `",$cond_db,"` (
	  `id` int(11) NOT NULL auto_increment,
	  `action` varchar(64) NOT NULL,
	  `id_store` int(11) NOT NULL,
	  `name` varchar(256) NOT NULL,
	  `artikul` varchar(256) NOT NULL,
	  `amount` int(11) NOT NULL,
	  `price` decimal(10,2) default NULL,
	  `ip` varchar(64) NOT NULL,
		`date` date,
		`time` time,
	  PRIMARY KEY  (`id`)
	)DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
	; 
");
my $result = $dbh->prepare($sql);  $result->execute();


for ($i=1; $i<=$n_i; $i++)
	{print "\n<br>0", $m_id_store[$i], $m_amount[$i];
	$id_store=$m_id_store[$i]; $amount=$m_amount[$i]; $price=$price_opt[$i];

	if ($amount > 0)
		{

		$sql="
			select * from `shop_store`
			WHERE `id`='$id_store'
			;
		";
		my $result=$dbh->prepare($sql);$result->execute();
		while (my $row = $result -> fetchrow_hashref())  
			{$name = $row->{'name'};
			 $artikul = $row->{'artikul'};
			 $price_opt = $row->{'price_opt'};
			 $price_rosn = $row->{'price_rosn'};
			 }

		$action=$cond_db;
		$price=0;
		if ($cond_db eq"shop_receiving") {$price=$price_opt;}
		if ($cond_db eq"shop_ordering") {$price=$price_rosn;}
		if ($cond_db eq"shop_shipping") {$price=$price_rosn;}
		$sql=join('',
			"INSERT INTO  `",$cond_db,"` 
			(`id` ,`action` , `id_store`,`name`, `artikul`,`amount`,`price`,`ip`, `date` ,`time` )
			VALUES 
			(NULL,'$action' , '$id_store','$name', '$artikul','$amount','$price', '$ip', CURDATE(), CURTIME());
			");		
		$dbh->do($sql);
		}
	}
print "<br>Таблица ",$cond_db, " содержит: <br>";	
$sql=join('',"select * from `",$cond_db,"`");
my $result = $dbh->prepare($sql);  $result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}

return
}


sub moving($control, $cond_db ,$cond_1, $cond_2,)
{
$sql="
DROP TABLE IF EXISTS `shop_moving`;
";
$dbh->do($sql);

$sql="
	CREATE TABLE IF NOT EXISTS shop_moving (
	  `id` int(11) NOT NULL,
	  `action` varchar(64) NOT NULL,
	  `id_store` int(11) NOT NULL,
	  `name` varchar(256) NOT NULL,
	  `artikul` varchar(256) NOT NULL,
	  `amount` int(11) NOT NULL,
	  `price` decimal(10,2) default NULL,
	  `ip` varchar(64) NOT NULL,
		`date` date,
		`time` time
	)DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
	; 
";
$dbh->do($sql);


$sql="
INSERT INTO `shop_moving` SELECT * FROM `shop_receiving`;
";
$dbh->do($sql);


$sql="
INSERT INTO `shop_moving` SELECT * FROM `shop_shipping`;
";
$dbh->do($sql);


my $amount_tmp="-1";
my $actiom_tmp="shop_shipping";
$sql="
UPDATE `shop_moving` SET `amount`=`amount`*'$amount_tmp'
where `action`='$actiom_tmp';
";
$dbh->do($sql);


return
}


=pod
USE notroot;


DROP TABLE IF EXISTS `shop_store`;
DROP TABLE IF EXISTS `shop_receiving`;
DROP TABLE IF EXISTS `shop_ordering`;
DROP TABLE IF EXISTS `shop_shipping`;

shop_shipping
DROP TABLE IF EXISTS `shop_moving`;


CREATE TABLE IF NOT EXISTS `shop_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l1` varchar(256) DEFAULT NULL,
  `l2` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `artikul` varchar(256) DEFAULT NULL,
  `price_opt` decimal(10,2) DEFAULT NULL,
  `price_rosn` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

DESCRIBE shop_store;

INSERT INTO `shop_store` (`l1`, `l2`, `name`, `artikul`, `price_opt`, `price_rosn`) VALUES
('открытки', 'флора', 'береза', '10001', 30.00, 60.00),
('открытки', 'фауна', 'медведь', '10002', 40.00, 80.00),
('открытки', 'пейзажи', 'горы', '10003', 20.00, 40.00),
('открытки', 'пейзажи', 'реки', '10004', 30.00, 60.00);

SELECT * FROM `shop_store`;






SELECT * FROM `shop_receiving`;






http://notroot.nn2000.info/cgi-bin/mysql_store.pl?control=for_visitor
http://notroot.nn2000.info/cgi-bin/mysql_store.pl?control=for_visitor&cond_1=%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BA%D0%B8&cond_2=%D1%84%D0%BB%D0%BE%D1%80%D0%B0
=cut

