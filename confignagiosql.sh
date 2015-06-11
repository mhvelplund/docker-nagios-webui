#!/bin/bash
mkdir -p /etc/nagiosql/hosts		
mkdir -p /etc/nagiosql/services	
mkdir -p /etc/nagiosql/backup/hosts
mkdir -p /etc/nagiosql/backup/services

cp /usr/local/nagios/etc/objects/commands.cfg /etc/nagiosql/commands.cfg
cp /usr/local/nagios/etc/objects/timeperiods.cfg /etc/nagiosql/timeperiods.cfg
cp /usr/local/nagios/etc/objects/templates.cfg /etc/nagiosql/templates.cfg
cp /usr/local/nagios/etc/objects/contacts.cfg /etc/nagiosql/contacts.cfg
cp /usr/local/nagios/etc/objects/localhost.cfg /etc/nagiosql/hosts/localhost.cfg

touch /etc/nagiosql/contactgroups.cfg
touch /etc/nagiosql/hosttemplates.cfg
touch /etc/nagiosql/hostgroups.cfg
touch /etc/nagiosql/hostextinfo.cfg
touch /etc/nagiosql/hostescalations.cfg
touch /etc/nagiosql/hostdependencies.cfg
touch /etc/nagiosql/servicetemplates.cfg
touch /etc/nagiosql/servicegroups.cfg
touch /etc/nagiosql/serviceextinfo.cfg
touch /etc/nagiosql/serviceescalations.cfg
touch /etc/nagiosql/servicedependencies.cfg

sed -e 's/^cfg_file/#cfg_file/' /usr/local/nagios/etc/nagios.cfg |sed -e 's/^cfg_dir/#cfg_dir/' > /tmp.cfg
mv /tmp.cfg /usr/local/nagios/etc/nagios.cfg
cat /nagioscfg.append >> /usr/local/nagios/etc/nagios.cfg

chgrp www-data /usr/local/nagios/etc
chgrp www-data /usr/local/nagios/etc/nagios.cfg
chgrp www-data /usr/local/nagios/etc/cgi.cfg
chmod 775 /usr/local/nagios/etc
chmod 664 /usr/local/nagios/etc/nagios.cfg
chmod 664 /usr/local/nagios/etc/cgi.cfg

chmod -R 6755 /etc/nagiosql
chown -R www-data.nagios /etc/nagiosql
chmod -R 644 /etc/nagiosql/*.cfg
chown -R www-data.nagios /etc/nagiosql/*.cfg
chown nagios.www-data /usr/local/nagios/bin/nagios
chmod 750 /usr/local/nagios/bin/nagios

chgrp www-data /usr/local/nagiosql/config
chmod 775 /usr/local/nagiosql/config