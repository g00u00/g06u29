#!/usr/bin/perl -w
use CGI::Carp qw (fatalsToBrowser);     # вывод ошибок к browser-у 
use CGI;
use DBI;

$remote_address = $ENV{ "REMOTE_ADDR" };
$query_str = $ENV{'QUERY_STRING'}; 


print <<END_HTML; 	
Content-type: text/html \n\n
<head>
<meta http-equiv='content-type' content='text/html'  charset='windows-1251'>
<title>Оформление ...</title>
</head>
<body>
END_HTML

my $query = new CGI;
my $control = $query->param("control") ;  $control  =~ tr/+/ /;
my $cond_1 = $query->param("cond_1") ;  $cond_1  =~ tr/+/ /;
my $cond_2 = $query->param("cond_2") ;  $cond_2  =~ tr/+/ /;


my $host = "localhost"; 
my $port = "3306"; 
my $db = "mar10000_storepl"; # имя базы данных -
my $user = "mar10000_storepl"; 
my $pass = "storepl"; # пароль
my $dbh = DBI->connect("DBI:mysql:$db:$host:$port",$user,$pass)|| die $DBI::errstr;
$dbh->do("SET NAMES 'cp1251'");

#------------------------------------------------------
if ($control eq "for_visitor") {for_visitor($control, $cond_1, $cond_2);}
if ($control eq "to_db") {to_db ($control, $cond_1, $cond_2);}
moving($control, $cond_1, $cond_2);

#------------------------------------------------------
my $rc = $dbh->disconnect;  # соединение	
print "\n</body>"; 
print "\n</html>";
#-------------------------------------------------------------------------
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
#------------------------------------------------------------------------
sub for_visitor($control,$cond_1, $cond_2,)
{
print <<END_HTML; 
<form  action="../cgi-bin/mysql_store.pl"   target='_self' method='get'>
<table  cellpadding=15 cellspacing=1 border=0>
END_HTML
print "<input type='Hidden' name='control' value='to_db'>";
print "<input type='Hidden' name='cond_1' value='$cond_1'>";
print "<input type='Hidden' name='cond_2' value='$cond_2'>";


#--считывем текущие атрибуты товаров
$sql="
SELECT *
FROM `store`
-- WHERE `store`.`price_rosn` <='40'
-- ORDER BY `store`.`price_rosn` DESC 
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
		FROM `moving`
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


sub to_db ($control, $cond_1, $cond_2)
{
@m_id_store=300;
@m_amount=300;

print $control, $cond_1, $cond_2;

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

#$sql=join ('',"DROP TABLE  IF  EXISTS  `",$cond_1,"`");
$dbh->do($sql);
$sql=join('',"
	CREATE TABLE IF NOT EXISTS `",$cond_1,"` (
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
	) ENGINE=MyISAM  DEFAULT CHARSET=cp1251
	; 
");
my $result = $dbh->prepare($sql);  $result->execute();


for ($i=1; $i<=$n_i; $i++)
	{print "\n<br>0", $m_id_store[$i], $m_amount[$i];
	$id_store=$m_id_store[$i]; $amount=$m_amount[$i]; $price=$price_opt[$i];

	if ($amount > 0)
		{

		$sql="
			select * from `store`
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

		$action=$cond_1;
		$price=0;
		if ($cond_1 eq"receiving") {$price=$price_opt;}
		if ($cond_1 eq"ordering") {$price=$price_rosn;}
		if ($cond_1 eq"shipping") {$price=$price_rosn;}
		$sql=join('',
			"INSERT INTO  `",$cond_1,"` 
			(`id` ,`action` , `id_store`,`name`, `artikul`,`amount`,`price`,`ip`, `date` ,`time` )
			VALUES 
			(NULL,'$action' , '$id_store','$name', '$artikul','$amount','$price', '$ip', CURDATE(), CURTIME());
			");		
		$dbh->do($sql);
		}
	}
print "Произведена запись в таблицу: ",$cond_1;	
$sql=join('',"select * from `",$cond_1,"`");
my $result = $dbh->prepare($sql);  $result->execute();
while (my @row = $result -> fetchrow_array())  {print "\n<br>@row";}

return
}


sub moving($control,$cond_1, $cond_2,)
{
$sql="
DROP TABLE IF EXISTS `moving`;
";
$dbh->do($sql);

$sql="
	CREATE TABLE IF NOT EXISTS moving (
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
	) ENGINE=MyISAM  DEFAULT CHARSET=cp1251
	; 
";
$dbh->do($sql);


$sql="
INSERT INTO `moving` SELECT * FROM `receiving`;
";
$dbh->do($sql);


$sql="
INSERT INTO `moving` SELECT * FROM `shipping`;
";
$dbh->do($sql);


my $amount_tmp="-1";
my $actiom_tmp="shipping";
$sql="
UPDATE `moving` SET `amount`=`amount`*'$amount_tmp'
where `action`='$actiom_tmp';
";
$dbh->do($sql);


return
}


