#!/bin/bash

#Patch out the sample configuration
sed -e 's/^cfg_file=/#cfg_file=/' /etc/nagios/nagios.cfg > /tmp.cfg
mv /tmp.cfg /etc/nagios/nagios.cfg

cat /nagioscfg.append >> /etc/nagios/nagios.cfg

chgrp www-data /etc/nagios
chgrp www-data /etc/nagios/nagios.cfg
chgrp www-data /etc/nagios/cgi.cfg
chgrp www-data /etc/nagios/resource.cfg

chmod 775 /etc/nagios
chmod 664 /etc/nagios/nagios.cfg
chmod 664 /etc/nagios/cgi.cfg
chmod 664 /etc/nagios/resource.cfg

chmod -R 6755 /etc/nagiosql
chown -R www-data.nagios /etc/nagiosql

chmod -R 644 /etc/nagiosql/*.cfg
chown -R www-data.nagios /etc/nagiosql/*.cfg

chown www-data.nagios /usr/local/nagios/bin/nagios
chmod 770 /usr/local/nagios/bin/nagios

chgrp www-data /usr/local/nagiosql/config
chmod 775 /usr/local/nagiosql/config
chmod -R 644 /usr/local/nagiosql/config/settings.php
chown -R www-data.nagios /usr/local/nagiosql/config/settings.php

chown -R www-data.nagios /usr/local/nagios/var