#!/data/data/com.termux/files/usr/bin/bash env

########################################
#  ARIE CLI Environment Setup Script: 1.2
########################################
#
# Dependencies: bash and curl.
#
########################################

# Update and upgrade
pkg up -y && pkg upgrade -y

# Switch permissive
su -c 'setenforce 0'

# Install dependencies
time apt install rsync aapt neofetch toilet ncurses-utils tsu openssl-tool ruby wget -y

# Remove existing files
tsu -c 'find . -iname '*arie*' -exec rm -rf {} \;'

# Device architecture
[[ "$(uname -m)" =~ 'aarch64' ]] || {
    printf "Your device's architecture isn't officially supported yet."
    exit 1
}

# Fetch the ELF and setup
tsu -c 'wget https://raw.githubusercontent.com/ARIEGAMING/Illusion-Remastered/master/Builds/arm64/arie_v1.2-cli -O ./arie_v1.2-cli'
tsu -c 'chmod a+x arie_v1.2-cli'
tsu -c ./arie_v1.2-cli
