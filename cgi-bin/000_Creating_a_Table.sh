#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html>"
echo "<head>"
echo "</head>"
echo "<body>"
echo "<pre>"
echo ""
echo "Задание"
echo "000_Creating_a_Table.sql"
who i am
date
echo ""
echo "Содержание скрипта"
cat 000_Creating_a_Table.sql
echo ""
echo ""
echo "Результаты"
mysql -ug06u29 -pmysql16 --table g06u29 < 000_Creating_a_Table.sql  > ../tmp/000_Creating_a_Table.txt
cat ../tmp/000_Creating_a_Table.txt
#mysqldump  -ug06u29 -pmysql16 g06u29 > ../tmp/000_Creating_a_Table_g06u29_dump.sql
#mysql -ug06u29 -pmysql16 < ../tmp/000_Creating_a_Table_g06u29_dump.sql
mysqldump  -ug01u00 -pmysql16 --no-tablespaces  g01u00 > ../tmp/000_Creating_a_Table_g06u29_dump.sql
#mysql -ug01u00 -pmysql16 g01u00  < ../tmp/000_Creating_a_Table_g06u29_dump.sql

echo "ls -lAFn 000_Creating_a_Table*.*"
ls -lAFn 000_Creating_a_Table*.*
echo "ls -lAFn ../tmp" 
ls -lAFn ../tmp
cat ../tmp/000_Creating_a_Table_g06u29_dump.sql
