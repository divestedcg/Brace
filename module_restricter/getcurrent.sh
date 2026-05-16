#!/bin/sh
#Copyright (c) 2026 Divested Computing Group
#
#License: CC0
sed 's/ .*//g' /proc/modules | sort -u
