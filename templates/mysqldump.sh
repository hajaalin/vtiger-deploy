#!/bin/sh
timestamp=`date +'%Y%m%d%H%M%S'`
dumpfile={{ booked_log_dir }}/mysqldump/booked_${timestamp}.sql

mysqldump --defaults-file=/home/{{ booked_user }}/mysql_opts_booked.cnf -h {{ booked_db_hostspec }} -u {{ booked_db_user }} {{ booked_db_name }} > $dumpfile
ln -sf $dumpfile {{ booked_log_dir }}/mysqldump/latest.sql
