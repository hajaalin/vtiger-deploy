#!/bin/sh
dumpfile=$1

if [[ -z $dumpfile ]]; then
  dumpfile={{ booked_log_dir }}/booked_db_to_import.sql
  scp {{ ssh_user }}@{{ booked_host_to_backup }}:{{ booked_log_dir }}mysqldump/latest.sql $dumpfile
fi

# check sql with php-sqllint
#php-sqllint/bin/php-sqllint $dumpfile

# import sql
mysql --defaults-file=/home/{{ booked_user }}/mysql_opts_booked.cnf -h {{ booked_db_hostspec }} -u {{ booked_db_user }} {{ booked_db_name }} < $dumpfile
