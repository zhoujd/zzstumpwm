#!/bin/bash

qt() {
    echo "$(date) [QT] environment"
    QT_QPA_PLATFORMTHEME=gtk2
    QT_SCALE_FACTOR=1
}
