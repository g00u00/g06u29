#!/usr/bin/perl -w 
use CGI qw(:standard);
use CGI::Carp qw (fatalsToBrowser);     # ����� ������ � browser-� 
use CGI::Carp qw(cluck);


print "Content-type: text/html \n\n";
print "<head>";
print "<meta http-equiv='content-type' content='text/html'  charset='windows-1251'>";
print "<title>������������ �������� ���������</title>";
print "</head>";

@m_name=200;
@m_value=200;

$remote_address = $ENV{ "REMOTE_ADDR" };

$query_str = $ENV{'QUERY_STRING'}; 
#if($ENV{'REQUEST_METHOD'} eq 'GET'){  $query_str=$ENV{'QUERY_STRING'};}
#elsif($ENV{'REQUEST_METHOD'} eq 'POST'){sysread STDIN,$query_str,$ENV{'CONTENT_LENGTH'};}
$query_str =~ s/%(..)/pack("c",hex($1))/eg;
$query_str =~ tr/+/ /;
#print "\n<br> $remote_address";
#print "\n<br> $query_str";

@pairs = split(/&/, $query_str);
$n_i = 0;
foreach $pair (@pairs)
     { $n_i=$n_i+1; 
	($name, $value)=split(/=/,$pair);
	$m_name[$n_i]=$name;
	$m_value[$n_i]=$value;
	}

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =localtime(time);
		$year=$year+1900;
		$mon=$mon+1;
		if ($min < 10) {$min = "0$min";}    if ($hour < 10) {$hour = "0$hour";}   if ($mon < 10) {$mon = "0$mon";   }   if ($mday < 10) {$mday = "0$mday";}
		if ($mon==1) {$mon="������";} 	if ($mon==2) {$mon="�������";} 		
		if ($mon==3) {$mon="�����";} 		if ($mon==4) {$mon="������";} 		
		if ($mon==5) {$mon="���";} 		if ($mon==6) {$mon="����";} 
		if ($mon==7) {$mon="����";} 		if ($mon==8) {$mon="�������";} 		
		if ($mon==9) {$mon="��������";}	if ($mon==10) {$mon="�������";} 		
		if ($mon==11) {$mon="������";} 	if ($mon==12) {$mon="�������";} 


$name_out="../public_html/db/mysql_store/logs/custmers.txt";		
open OUTFILE,">>",  $name_out or die "mistake-$name_out" ;
print OUTFILE $remote_address,"	";
print OUTFILE $year,".",$mon, ".", $mday, "	",   $hour,  ":",  $min, chr(59);
for ($i=0; $i<=$n_i; $i++)
#		{print OUTFILE $m_name[$i],"	", $m_value[$i],"	";
		{print OUTFILE $m_value[$i],"	";
		}
print OUTFILE " \n";
close(OUTFILE);		

print "<body>";
print "<p>";
print "<br> �������, ";
print $mday,  "&nbsp;&nbsp;", $mon,  "&nbsp;&nbsp;",   $hour,  ":",  $min,  ".";
print "  ���� ��������� ��������";

$print_table="Y";
if ($print_table eq "Y")
	{print "<br>  �� ���������:";
	print "<br> <table border=1>";
	for ($i=1; $i<=$n_i-1; $i++)
	   {print "<tr>";
		 print "<td>$i</td>";
		 print "<td>  $m_name[$i]  </td>";
		 print "<td> $m_value[$i]  </td>";
		 print "</tr>";
	   }
	print "</table>";		
	}	
	elsif  ($print_table eq "N")
		{ print "<br> ������� �� �������";
		}
		else 
		{
		}
		
print "</body>";
print "</html>";


# ��������������.
# ��� ���������� �������������� ������������ �������:
# - ������ ������ ������ ���� ����������� � ����, ������� �������� � �������������� �����
#- ��������� �������������� �����, �����������: 
#--������ ������ � ����;
#-- ����� �� ����� ������� � ���������� ������ �������
#-����������� ������ � ��������������  �������� "hidden" 
#