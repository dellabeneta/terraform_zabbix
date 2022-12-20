#!/bin/bash
excludepkgs=zabbix*
rpm -Uvh https://repo.zabbix.com/zabbix/6.2/rhel/9/x86_64/zabbix-release-6.2-3.el9.noarch.rpm
dnf clean all
dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-nginx-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent mysql-server wget vim
systemctl enable --now mysqld
echo "create database zabbix character set utf8mb4 collate utf8mb4_bin;" | mysql
echo "create user zabbix@localhost identified by 'password';" | mysql
echo "grant all privileges on zabbix.* to zabbix@localhost;" | mysql
echo "set global log_bin_trust_function_creators = 1;" | mysql
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql zabbix
echo "DBPassword=password" >> /etc/zabbix/zabbix_server.conf
#sed -i '2ilisten 8080;' /etc/nginx/conf.d/zabbix.conf
#sed -i '3iserver_name example.com;' /etc/nginx/conf.d/zabbix.conf
systemctl restart zabbix-server zabbix-agent nginx php-fpm
systemctl enable zabbix-server zabbix-agent nginx php-fpm