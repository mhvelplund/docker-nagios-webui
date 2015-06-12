#!/bin/bash

#Patch out the some definition
#sed -e 's/^cfg_file=\/usr\/local\/nagios\/etc\/objects\/localhost.cfg/#cfg_file=\/usr\/local\/nagios\/etc\/objects\/localhost.cfg/' | sed -e 's/^cfg_file=\/usr\/local\/nagios\/etc\/objects\/templates.cfg/#cfg_file=\/usr\/local\/nagios\/etc\/objects\/templates.cfg/' | /etc/nagios/nagios.cfg > /tmp.cfg
sed -e 's/^cfg_file=/#cfg_file=/' /etc/nagios/nagios.cfg > /tmp.cfg
mv /tmp.cfg /etc/nagios/nagios.cfg

cat /nagioscfg.append >> /etc/nagios/nagios.cfg

chgrp www-data /etc/nagios
chgrp www-data /etc/nagios/nagios.cfg
chgrp www-data /etc/nagios/cgi.cfg

chmod 775 /etc/nagios
chmod 664 /etc/nagios/nagios.cfg
chmod 664 /etc/nagios/cgi.cfg

chmod -R 6755 /etc/nagiosql
chown -R www-data.nagios /etc/nagiosql

#touch /etc/nagiosql/contactgroups.cfg
#touch /etc/nagiosql/hosttemplates.cfg
#touch /etc/nagiosql/hostgroups.cfg
#touch /etc/nagiosql/hostextinfo.cfg
#touch /etc/nagiosql/hostescalations.cfg
#touch /etc/nagiosql/hostdependencies.cfg
#touch /etc/nagiosql/servicetemplates.cfg
#touch /etc/nagiosql/servicegroups.cfg
#touch /etc/nagiosql/serviceextinfo.cfg
#touch /etc/nagiosql/serviceescalations.cfg
#touch /etc/nagiosql/servicedependencies.cfg
chmod -R 644 /etc/nagiosql/*.cfg
chown -R www-data.nagios /etc/nagiosql/*.cfg

chown nagios.www-data /usr/local/nagios/bin/nagios
chmod 750 /usr/local/nagios/bin/nagios

chgrp www-data /usr/local/nagiosql/config
chmod 775 /usr/local/nagiosql/config
chmod -R 644 /usr/local/nagiosql/config/settings.php
chown -R www-data.nagios /usr/local/nagiosql/config/settings.php
