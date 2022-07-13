#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA1tCrlFZZWyyOanSaTolynvSuLppeb+CNXIl+u0HOqzrBO1hpYyLxNnNaf0qCtzFxZsGZpKoBIdMKZHczBHYbNIuQydg8A+pYj5FCpNwQ8YXh0K8jf5tY7nkom2DsoT8A5h64HiJ1YKAipDoPFi0++p+ETREnA/+LEfbVkC6jdQ8F8ejZrUmJ53o5CR1AeaAn/qCqf4ijkGRutHioPifYOqFoAgeeo9UiYGi4m9lc6gtCsldNXvzBp0nj/+cWVg86AaHDtUsa7tTu638AW1uYLXAJD4CrwoQnsbpW7uZTYeLy/xLbAEIPf/GX1tglc8Cs/roVmQ3dP0aj4+cnEabYzw== Cowings"

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
