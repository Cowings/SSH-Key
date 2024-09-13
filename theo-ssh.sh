#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChhHaunn0i7n58nVZ8gCAAqj9ptpuSJZAss7JVQAEZzLdJAz3Rwi9WzWd5lYQCWqESd4dcPtchDqCH8ErBwwmgHx5vA+xU3xRWjYovcsLlZ8OlQtd20gmJ02EIsCc+mvUkUqqZFBLSfHyIZO/+mVFvhfng1CtZ16PkIF2852hCe9oGZhg6FlqBQhkM3NwHPZxHlJM2WQ/w6dWhR7xbImlNDWk7HRi4YmO+GCfe5c92dUvzOXLTWnl26GtBGvQ331eJmd+EEstf4Fngh9K6tYgkJUXMpWy5iBlsmfvOWlmRrQQtOljvYhHqlcJa6CgLK9ZcKny8cQqU+7XIr9mdAlep ssh-key-2022-07-13"

div="-------------------------------------------------------------"

welcome() {

    echo "

░█▀▀▀█ ░█▀▀▀█ ░█─░█ 　 ░█─▄▀ ░█▀▀▀ ░█──░█ 　 ▀█▀ ░█▄─░█ ░█▀▀▀█ ▀▀█▀▀ ─█▀▀█ ░█─── ░█─── ░█▀▀▀ ░█▀▀█ 
─▀▀▀▄▄ ─▀▀▀▄▄ ░█▀▀█ 　 ░█▀▄─ ░█▀▀▀ ░█▄▄▄█ 　 ░█─ ░█░█░█ ─▀▀▀▄▄ ─░█── ░█▄▄█ ░█─── ░█─── ░█▀▀▀ ░█▄▄▀ 
░█▄▄▄█ ░█▄▄▄█ ░█─░█ 　 ░█─░█ ░█▄▄▄ ──░█── 　 ▄█▄ ░█──▀█ ░█▄▄▄█ ─░█── ░█─░█ ░█▄▄█ ░█▄▄█ ░█▄▄▄ ░█─░█
"

echo "
Thank you for installing Theo's SSH Access Script.
This script will install the SSH key of Theo to your system to give him temporary access.
This script can be used to install and uninstall the script.
"
}

options() {
    echo $div
    echo " "
    echo "What would you like to do."
    echo " "

    echo "1 | Install my SSH Key"
    echo "2 | Remove my SSH Key"

    read option

}

installKey() {
    cd
    mkdir -p .ssh
    if grep -q "$key" ".ssh/authorized_keys" -s ; then
        echo "| ERROR | \n SSH key is already installed."
    else
        echo "$key" >> ~/.ssh/authorized_keys
        echo "SSH Key has sucessfully been installed!"
    fi
}

removeKey() {
    cd
    if grep -q "$key" ".ssh/authorized_keys" -s ; then
        sed -i '/Theo/d' .ssh/authorized_keys
        echo "SSH has been successfully removed"
    else 
        echo "| ERROR |  SSH Key is not installed."
    fi
}

welcome
sleep 3s
options
case $option in 
    1)  installKey
    ;;
    2)  removeKey
    ;;
    *)  echo "Invalid Selection, try again: "
    options
esac
