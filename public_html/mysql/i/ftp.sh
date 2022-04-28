#!/bin/bash

IP_address="37.139.11.127"
username="g01u00"
password="g01u00"

ftp -n -i $IP_address <<EOF
verbose
open $domain
user $username $password
put /var/www/g01/g01u00/tmp/g01u00.bz2 /var/www/g00/g00u00/public_html/g01u00.bz2
chmod 600   /var/www/g00/g00u00/public_html/g01u00.bz2 
ls /var/www/g00/g00u00/public_html
bye
EOF
