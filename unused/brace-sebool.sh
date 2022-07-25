#!/usr/bin/bash
#Copyright (c) 2017-2019 Divested Computing, Inc.
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

if [ "$(/usr/bin/id -u)" -ne "0" ]; then echo 'This script needs to be run as root!'; exit 1; fi;

if [ -f /etc/fedora-release ] || [ -f /etc/centos-release ]; then
	echo "Setting hardened booleans for SELinux policy";
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
