#!/bin/bash

export MYSQL_ROOT_USER=${MYSQL_ROOT_USER:-"root"}
export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-"admin123"}
export MYSQL_HOST=${MYSQL_HOST:-"localhost"}

export MYSQL_DB_NAME=${MYSQL_DB_NAME:-"testdb"}
export MYSQL_DB_USER=${MYSQL_DB_USER:-"testdb"}
export MYSQL_DB_PASSWORD=${MYSQL_DB_PASSWORD:-"testdb123"}

MYSQL=`which mysql`

Q1="CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;"
Q2="GRANT USAGE ON *.* TO $MYSQL_DB_USER@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';"
Q3="GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO $MYSQL_DB_USER@'%';"
Q4="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}"

CMD="$MYSQL -u \"$MYSQL_ROOT_USER\" -p\"${MYSQL_ROOT_PASSWORD}\" -e \"$SQL\" -h $MYSQL_HOST; echo $?"
echo "$CMD"

STATUS=`$MYSQL -u "$MYSQL_ROOT_USER" -p"${MYSQL_ROOT_PASSWORD}" -e "$SQL" -h $MYSQL_HOST; echo $?`

if [ $STATUS -eq 0 ]; then
    echo "Database credentials added to $MYSQL_HOST"
    echo ""
    exit 0
fi

echo "ERROR - Database credentials not added to localhost or $MYSQL_HOST"
echo ""
exit 1
