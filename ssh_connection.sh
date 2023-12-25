#!/bin/bash

#NO ECHO reading password sensitive information
read_secret() {
    prompt=$1
    prompt+=": "
    if [ -t 0 ]; then
        stty -echo
        trap 'stty echo' EXIT
    fi

    printf "%s" "$prompt"
    read secret
    stty echo
    trap - EXIT
    printf "%s\n" "$secret"
}

#establish connexion
establish_ssh_connection() {
    local username="$1"
    local host="$2"
    local port="$3"
    local identity_file="$4"

    ssh -i "$identity_file" -p "$port" "$username@$host"
}

echo "SSH Connection Script"

read -p "Enter SSH username: " ssh_username
read -p "Enter SSH host: " ssh_host
read -p "Enter SSH port (default 22): " ssh_port
ssh_port=${ssh_port:-22} 
#change here if needed

#path to private key
read -p "Enter path to private key: " ssh_key_path
if [ ! -f "$ssh_key_path" ]; then
    echo "Private key not found at $ssh_key_path"
    exit 1
fi

#establish connexion
establish_ssh_connection "$ssh_username" "$ssh_host" "$ssh_port" "$ssh_key_path"
