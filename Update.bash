#!/bin/bash -e
clear
echo "================================================="
echo " Update WordPress Script" 
echo                     "Script By Ashkan Ebrahimi"
echo "Versian 1.0"
echo "================================================="
#Send Email Starting
wget http://ashkanebrahimi.com/Script/start.php.suspend
mv start.php.suspend start.php
php start.php
echo "Hostname: "
read host
cd /home/$host
#Start For Backup
zip -rv backup.zip public_html
echo "======================="
echo    "Backup completed"
echo "======================="
#start Update Core WordPress
echo "Insert again Hostname"
read host
cd /home/$host/public_html
# Download Last Vesion WordPress
echo Start Download Last Versian:
wget https://wordpress.org/latest.tar.gz
echo Complete!
#start Update
echo "Starting Update Core"
mv wp-content wp-content.org
mv wp-config.php wp-config.php.org
tar -zxvf latest.tar.gz
rm -rf wp-content && rm -rf wp-config.php
mv wp-content.org wp-content
mv wp-config.php.org

echo "Completed Update Core"
#Send Email Ending 
wget http://ashkanebrahimi.com/Script/end.php.suspend
mv start.php.suspend end.php
php end.php
