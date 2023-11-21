#!/bin/sh

set -ex

service mysql start

/usr/bin/mysql -h db -u root --password=root hub < /../backups/backup.sql
