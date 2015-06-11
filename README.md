# NagiosQL

This container extends the "``mhvelplund/nagios``" container by adding the configuration frontend, [NagiosQL](http://www.nagiosql.org).

The first time the application is started, it configures the email and password for the local "nagiosadmin" account. To set these start the container as follows:

    docker run -dP -e NAGIOSADM_PW=mysupersecretpassword -e NAGIOSADM_EMAIL=email@server.com mhvelplund/nagios-webui

On subsequent runs, only the "docker run" statement is needed.

    docker run -dP mhvelplund/nagios-webui

The container exposes port 80. Check "``docker ps``"" to see which port it is mapped to.

Once up and running, the Nagios server can be reached on the url "``http://<dockerhostip>/nagios``" with the login "nagiosadmin" and the password chosen during setup.

NagiosQL is exposed on the same port at the address "``http://<dockerhostip>/nagiosql``" with the same credentials.