#!/bin/bash

if [ ! -f config.cfg ]; then
    echo "Config file not found! Please make sure you have copied 'config.cfg.template' into 'config.cfg' and filled your user credentials."
    exit
fi

# creates /usr/local/alliance_connector if doesn't exists
mkdir -p /usr/local/alliance_connector

# copy all files from current directory
cp *.* /usr/local/alliance_connector/

# add cron record which runs every minute
crontab cron_record

echo "Installation is complete."
