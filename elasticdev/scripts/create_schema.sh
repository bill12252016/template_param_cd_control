#!/bin/bash
  
MYSQL=`which mysql`
SQL_FILE=${SQL_FILE:="seed.sql"}
$MYSQL -u "$DB_USER" -p"${DB_PASS}" $DB_NAME -h $DB_HOST < $SQL_FILE
