#!/bin/bash

log={{ vtiger_log_dir }}

# compress log files older than two weeks
find $log -name "log_*.log" -mtime +14 |xargs gzip
find $log -name "sql_*.log" -mtime +14 |xargs gzip

# remove compressed log files older than one year
find $log -name "log_*.log.gz" -mtime +365 |xargs rm -f
find $log -name "sql_*.log.gz" -mtime +365 |xargs rm -f

# remove elomake files older than one week
find $log/elomake -name "report*csv" -mtime +7 |xargs rm -f

# remove mysqldump files older than one week
find $log/mysqldump -name "booked*.sql" -mtime +7 |xargs rm -f
