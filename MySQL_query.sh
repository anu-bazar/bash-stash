#!/bin/bash

execute_sql_query() {
    local query="$1"
    local database="$2"
    local username="$3"
    local password="$4"
    mysql -u "$username" -p"$password" -D "$database" -e "$query" #change client here for 
}

echo "MySQL_query.sh is running"

#db credentials. this is for read-only
read -p "Enter database username: " db_username
read_secret "Enter database password" db_password  #call read_secret()
read -p "Enter SQL query: " sql_query
database_name="your_database_name"
execute_sql_query "$sql_query" "$database_name" "$db_username" "$db_password"
