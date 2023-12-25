#!/bin/bash

MYSQL_USER="your_mysql_user"
MYSQL_PASSWORD="your_mysql_password"

#ex.:
# create_database "your_database"
# create_table "your_database" "your_table" "column1 INT, column2 VARCHAR(255)"
# modify_table_schema "your_database" "your_table" "ADD column3 DATE"
# display_table_schema "your_database" "your_table"

execute_query() {
    local query="$1"
    mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "$query"
}

create_database() {
    local database="$1"
    execute_query "CREATE DATABASE IF NOT EXISTS $database;"
}

create_table() {
    local database="$1"
    local table="$2"
    local schema="$3"
    execute_query "USE $database; CREATE TABLE IF NOT EXISTS $table ($schema);"
}

modify_table_schema() {
    local database="$1"
    local table="$2"
    local new_schema="$3"
    execute_query "USE $database; ALTER TABLE $table $new_schema;"
}

display_table_schema() {
    local database="$1"
    local table="$2"
    execute_query "USE $database; DESC $table;"
}



