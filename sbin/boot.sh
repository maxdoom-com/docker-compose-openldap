#!/bin/bash

####################################################################
## SET THE HOSTNAME
####################################################################

echo "${HOSTNAME}" > /etc/hostname


####################################################################
## CREATE A USER AND A GROUP WITH YOUR IDS
####################################################################

addgroup -g ${GID} you
adduser -D -h /home/you -u ${UID} -G you -s /bin/bash you


####################################################################
## RUN OPENLDAP
####################################################################

# chown the directories
chown you:you -R /var/lib/openldap/
chown you:you -R /etc/openldap/

# rebuild the config
echo "rebuild config"
/bin/rebuild-config

# run it
echo "run"
/usr/sbin/slapd -d 0 -F /etc/openldap/ &
sleep 2

# add import data
for f in `ls /var/lib/openldap/import/`; do
    echo "importing /var/lib/openldap/import/$f"
    /bin/restore /var/lib/openldap/import/$f
done

####################################################################
## SLEEP ENDLESS
####################################################################

sleep infinity
