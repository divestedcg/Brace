#!/usr/bin/bash
#Copyright (c) 2017-2019 Divested Computing, Inc.
#License: GPLv3

if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

echo "Setting hardened booleans for SELinux policy";
if [ -f /etc/fedora-release ] || [ -f /etc/centos-release ]; then
	setsebool -P deny_ptrace on;
	#setsebool -P deny_execmem on;
	setsebool -P selinuxuser_execheap off;
	setsebool -P selinuxuser_execmod off;
	setsebool -P selinuxuser_execstack off;

	setsebool -P allow_ptrace off;
	#setsebool -P allow_execmem off;
	setsebool -P allow_execheap off;
	setsebool -P allow_execmod off;
	setsebool -P allow_execstack off;

	setsebool -P logadm_exec_content off;
	setsebool -P dbadm_exec_content off;
	setsebool -P auditadm_exec_content off;
	setsebool -P secadm_exec_content off;

	setsebool -P guest_exec_content off;
	setsebool -P xguest_exec_content off;
	#setsebool -P user_exec_content off;
	#setsebool -P staff_exec_content off;
	#setsebool -P sysadm_exec_content off;
else
	echo "Currently only Fedora and CentOS are supported";
fi;
