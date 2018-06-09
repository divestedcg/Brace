#!/bin/bash
dnf install dnf-automatic
systemctl enable dnf-automatic-install.timer --now
