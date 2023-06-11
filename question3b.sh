#!/bin/bash

#this function generates a random password using openssl
gen_pass_ran() {
    local length="$1"
    openssl rand -base64 "$length" | tr -dc A-Za-z0-9 | head -c "$length"
    echo
}

#input the length of the password
read -p "Enter the length of the password: " pass_len

#generating random password using the gen_pass_ran function
pass_openssl=$(gen_pass_ran "$pass_len")

echo "Random password (using openssl): $pass_openssl"    

