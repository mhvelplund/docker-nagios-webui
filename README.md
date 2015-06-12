# NagiosQL

This container extends the "``mhvelplund/nagios``" container by adding the configuration frontend, [NagiosQL](http://www.nagiosql.org).

To run, this container needs a MySQL 5.5 container to be linked with the alias "db". A [Docker Compose](https://docs.docker.com/compose/) configuration has been provided to help.

With DC, the container can be started by typing:

    docker-compose up -d

This starts the containers in daemon mode, and opens a web-server on port 10080 of the Docker host.

The first time the container is started, NagiosQL must be configure. Simply go to the following URL, "``http://<dockerhost>:10080/nagiosql``" and complete the setup wizard. 

* Make sure "Local hostname or IP address" is set to "localhost"
* Set "Administrative Database Password" to "root". It must match the MySQL root password defined in the compose file), and check all the boxes
* Check the box "Drop database if already exists"
* Pick an "Initial NagiosQL Password" and retype it below
* Check the box "Import Nagios sample config"
* Check the box "Create NagiosQL config paths"
* Click next twice

NagiosQL is now configured.

NagiosQL runs on "``http://<dockerhost>:10080/nagiosql``"
Nagios runs on "``http://<dockerhost>:10080/nagios``"

The login username for Nagios is "nagiosadm", and the password is whatever the "NAGIOSADM_PW" is set to in the Compose file (default: nagios).