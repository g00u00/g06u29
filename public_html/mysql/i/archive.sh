cd ~/tmp 
mysqldump g01u00 -u'g01u00' -p'g01u00'> ./g01u00.sql
tar -cpjf g01u00.bz2 ../public_html ../cgi-bin ./g01u00.sql
ls -la
