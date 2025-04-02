#!/bin/bash

system() {
    if [ -n "$(systemctl list-units --full -all --user | grep redshift.service)" ]; then
        systemctl restart --user redshift.service
        echo "$(date) [system] restart redshift service"
    fi
}
