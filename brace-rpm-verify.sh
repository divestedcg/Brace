#!/bin/bash
if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

echo "This script is *not* for security purposes, but instead to fix broken packages.";
dnf reinstall $(rpm -qf $(rpm -Va 2>&1 | grep -vE '^$|prelink:' | sed 's|.* /|/|') | sort -u | grep -v -e "kernel-" -e "fedora-" -e "setup" -e "grub2-");
#Credit: https://unix.stackexchange.com/a/217024
