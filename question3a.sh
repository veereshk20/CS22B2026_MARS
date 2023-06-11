#!/bin/bash

#this function generates a random password using /dev/urandom
password_urandom() {
    local length="$1"
    tr -dc A-Za-z0-9 < /dev/urandom | head -c "$length"
    echo
}

# input the length of the password
read -p "Enter the desired password length: " pass_length

#calling the function to geerate the random password
pass_urandom=$(password_urandom "$pass_length")

echo "Random Password (using /dev/urandom): " $pass_urandom     
