#!/bin/bash
dnf reinstall $(rpm -qf $(rpm -Va 2>&1 | grep -vE '^$|prelink:' | sed 's|.* /|/|') | sort -u | grep -v -e "kernel-" -e "fedora-" -e "setup" -e "grub2-");
#Credit: https://unix.stackexchange.com/a/217024
