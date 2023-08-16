#!/bin/bash

if [ -n "$(systemctl list-units --full -all --user | grep redshift.service)" ]; then
    systemctl restart --user redshift.service
    echo "[system] restart redshift service"
fi
