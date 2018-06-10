#!/bin/bash
#Copyright (c) 2017-2018 Divested Computing, Inc.
#License: GPLv3

dnf install dnf-automatic;
systemctl enable dnf-automatic-install.timer --now;
