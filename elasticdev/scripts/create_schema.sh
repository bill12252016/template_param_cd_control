#!/bin/bash

SQL_FILE=${SQL_FILE:="seed.sql"}

mysql -u "$MYSQL_DB_USER" -p"${MYSQL_DB_PASSWORD}" $MYSQL_DB_NAME -h $MYSQL_HOST < $SQL_FILE
