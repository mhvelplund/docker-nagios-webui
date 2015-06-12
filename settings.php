<?php
exit;
?>
;///////////////////////////////////////////////////////////////////////////////
;
; NagiosQL
;
;///////////////////////////////////////////////////////////////////////////////
;
; Project  : NagiosQL
; Component: Database Configuration
; Website  : http://www.nagiosql.org
; Date     : June 12, 2015, 8:10 am
; Version  : 3.2.0
;
;///////////////////////////////////////////////////////////////////////////////
[db]
type         = mysql
server       = db
port         = 3306
database     = db_nagiosql_v32
username     = nagiosql_user
password     = nagiosql
[path]
base_url     = /nagiosql/
base_path    = /usr/local/nagiosql/