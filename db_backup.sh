#!/bin/bash

create_database_backup() {
    #creates db backup for lab
    local database="$1"
    local backup_dir="$2"
    local username="$3"
    local password="$4"
    local timestamp="$(date +'%Y%m%d_%H%M%S')"
    local backup_file="$backup_dir/${database}_${timestamp}.sql"
    echo "Starting backup for $database... Please wait a moment."

    mkdir -p "$backup_dir"
    mysqldump -u "$username" -p"$password" --single-transaction --quick "$database" > "$backup_file"
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully for $backup_file"
    else
        echo "Backup failed for $database."
        exit 1
    fi
}

echo "db_backup.sh ran successfully!"
read -p "Enter database username: " db_username
read_secret "Enter database password" db_password
database_name="your_database_name" #CHANGE HERE
backup_directory="/path/to/backup/directory" #CHANGE HERE
create_database_backup "$database_name" "$backup_directory" "$db_username" "$db_password"
