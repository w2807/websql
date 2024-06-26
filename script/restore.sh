#!/bin/bash

DB_USER="root"
DB_PASSWORD=YOUR_PASSWORD
DB_NAME="websql"

BACKUP_DIR="../backup"
BACKUP_DATE=$(date +%Y-%m-%d)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${BACKUP_DATE}.tar.gz"

tar -xzvf $BACKUP_FILE -C $BACKUP_DIR

SQL_FILE="${BACKUP_DIR}/${DB_NAME}_${BACKUP_DATE}.sql"

MYSQL_CMD="mysql -u${DB_USER} -p${DB_PASSWORD} ${DB_NAME}"

$MYSQL_CMD < $SQL_FILE

echo "Restore completed: ${SQL_FILE}"
