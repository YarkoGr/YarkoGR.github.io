
sudo yum -y update

sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo yum -y install epel-release
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php72
sudo yum -y update
sudo yum -y install php php-mysql php-common php-curl php-ldap php-apc php-dom php-xml php-xmlrpc php-gd php-intl php-mbstring php-soap php-zip php-opcache php-cli
sudo systemctl restart httpd.service

sudo firewall-cmd --zone=public --add-port=http/tcp
sudo firewall-cmd --zone=public --add-port=http/tcp --permanent

sudo yum -y install mariadb-server
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
sudo mysql -e"CREATE USER 'yarkogr'@'localhost' IDENTIFIED BY '2402';"
sudo mysql -e"CREATE DATABASE moodledb;"
sudo mysql -e"GRANT ALL PRIVILEGES ON moodledb.* TO 'yarkogr'@'localhost';"
sudo mysql -e"FLUSH PRIVILEGES;"
sudo mysql -e"SET GLOBAL innodb_file_format = 'BARRACUDA';"
sudo mysql -e"SET GLOBAL innodb_large_prefix = 'ON';"
sudo mysql -e"SET GLOBAL innodb_file_per_table = 'ON';"

sudo yum -y install wget
sudo wget https://download.moodle.org/download.php/direct/stable37/moodle-latest-37.tgz
sudo tar -zxvf moodle-latest-37.tgz -C /var/www/html
sudo chown -R apache:apache /var/www/