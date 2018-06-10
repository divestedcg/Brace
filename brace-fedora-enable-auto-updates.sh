#!/bin/bash
#Copyright (c) 2017-2018 Divested Computing, Inc.
#License: GPLv3

if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

dnf install dnf-automatic;
systemctl enable dnf-automatic-install.timer --now;
