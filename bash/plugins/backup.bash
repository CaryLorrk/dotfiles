#!/bin/bash

backup_family() {
    rsync -av /home/carylorrk/Family/Family /home/carylorrk/Data/backup
}

export -f backup_family
