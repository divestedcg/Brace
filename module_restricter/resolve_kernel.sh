#!/bin/sh
#Copyright (c) 2026 Divested Computing Group
#
#License: CC0
for kmod in $(find /lib/modules/$1/ -name *.ko.xz); do
	name=$(modinfo "$kmod" | grep -m1 "^name: " | sed "s/.* //");
	description=$(modinfo "$kmod" | grep -m1 "^description: " | sed "s/.*:[[:blank:]]*//");
	echo "$name #$description" >> kernels/$1.txt;
done
sort -u -o kernels/$1.txt kernels/$1.txt;
