#!/bin/bash

# quick command
# scp <source> <destination>

secure_file_transfer() {
    local source_path="$1"
    local destination_path="$2"
    local remote_username="$3"
    local remote_host="$4"
    local ssh_key="$5"

    echo "Initiating secure file transfer... Please wait a moment"
    rsync -avz -e "ssh -i $ssh_key" "$source_path" "$remote_username@$remote_host:$destination_path"

    if [ $? -eq 0 ]; then
        echo "File transfer completed successfully."
    else
        echo "File transfer failed."
        exit 1
    fi
}


echo "file_transfer.sh ran successfully"

#===============CHANGE EVERYTHING HERE============================
source_path="path/to/local/file"
destination_path="path/to/remote/directory"
remote_username="remote_username"
remote_host="remote_host_address"
ssh_key="path/to/ssh/key"

secure_file_transfer "$source_path" "$destination_path" "$remote_username" "$remote_host" "$ssh_key"
