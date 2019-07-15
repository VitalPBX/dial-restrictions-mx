#!/bin/bash
set -e

logo="$(tput setaf 2)
__      ___ _        _ _____  ______   __
\ \    / (_) |      | |  __ \|  _ \ \ / /
 \ \  / / _| |_ __ _| | |__) | |_) \ V /
  \ \/ / | | __/ _  | |  ___/|  _ < > <
   \  /  | | || (_| | | |    | |_) / . \
    \/   |_|\__\__,_|_|_|    |____/_/ \_\
$(tput sgr0)"

echo "$logo"

echo "$(tput setaf 3)Downloading Required Files...$(tput sgr0)"

#Download the dialplan
rm -rf /etc/asterisk/ombutel/extensions__90-check-mobile.conf
wget -P /etc/asterisk/ombutel/ https://raw.githubusercontent.com/VitalPBX/dial-restrictions-mx/master/source/extensions__90-check-mobile.conf

#Download the PHP script
rm -rf /usr/share/ombutel/scripts/check_mx_mobile_numbers
wget -P /usr/share/ombutel/scripts/ https://raw.githubusercontent.com/VitalPBX/dial-restrictions-mx/master/source/check_mx_mobile_numbers

#Download the SQL file
rm -rf /tmp/ift.sql
wget -P /tmp/ https://raw.githubusercontent.com/VitalPBX/dial-restrictions-mx/master/source/ift.sql

echo "$(tput setaf 3)Installing the database...$(tput sgr0)"
mysql -uroot asterisk < /tmp/ift.sql
rm -rf /tmp/ift.sql

echo "$(tput setaf 3)Applying Asterisk Changes...$(tput sgr0)"
asterisk -rx"core reload"

echo "$(tput setaf 3)Now you may restrict calls to Mexican mobile numbers setting the context \"forbidden-mx-mobile-numbers\" on the \"dialing restriction rules\" module$(tput sgr0)"
