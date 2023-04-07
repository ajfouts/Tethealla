#!/bin/sh

INTERNAL_IP=`tail -n 1 /etc/hosts | awk '{print $1}'`

echo "Internal Address: $INTERNAL_IP"

echo "Setting up ship.ini"
cp ship.ini.template ship.ini
sed -i "s/REPLACE_ME_INT_SHIP/${INTERNAL_IP}/g" ship.ini

echo "Setting up tethealla.ini"
cp tethealla.ini.template tethealla.ini
sed -i "s/REPLACE_ME_INT_TETH/${INTERNAL_IP}/g" tethealla.ini
