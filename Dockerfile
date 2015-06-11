# Nagios server with web config UI

FROM mhvelplund/nagios
MAINTAINER Mads Hvelplund "mhv@tmnet.dk"

## Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get install -y php5-mysqlnd

# Download NagiosQL
RUN mkdir download
WORKDIR /download
RUN wget http://downloads.sourceforge.net/project/nagiosql/nagiosql/NagiosQL%203.2.0/nagiosql_320.tar.gz
RUN tar xvzf nagiosql_320.tar.gz
WORKDIR /

# Install
RUN mv /download/nagiosql32 /usr/local/nagiosql
ADD nagiosql.conf /etc/apache2/conf-available/nagiosql.conf
RUN a2enconf nagiosql

# Configure
ADD nagioscfg.append /nagioscfg.append
ADD confignagiosql.sh /confignagiosql.sh
RUN /confignagiosql.sh
RUN /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

# Patch the entrypoint script
RUN sed -e 's/\/usr\/local\/nagios\/etc\/objects\/contacts.cfg/\/etc\/nagiosql\/contacts.cfg/' /entrypoint.sh > tmp.sh
RUN mv /tmp.sh entrypoint.sh
RUN chmod +x entrypoint.sh

# Patch PHP's config
RUN sed -e 's/;date.timezone =/date.timezone = UTC/' /etc/php5/apache2/php.ini > /tmp.ini
RUN mv /tmp.ini /etc/php5/apache2/php.ini

# Cleanup
RUN rm -rf /download
RUN rm -f /nagioscfg.append
RUN rm -f /confignagiosql.sh
