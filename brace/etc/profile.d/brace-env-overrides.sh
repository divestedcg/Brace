#!/bin/sh
#Copyright (c) 2020 Divested Computing Group
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

#misc
export CRYFS_NO_UPDATE_CHECK=true;

# zero video RAM to prevent leakage
# see (CC BY-SA 4.0): https://www.adlerweb.info/blog/2012/06/20/nvidia-x-org-video-ram-information-leak
export R600_DEBUG=zerovram;
export AMD_DEBUG=zerovram;
export RADV_DEBUG=zerovram;

# enable gstreamer va-api plugin on unsupported drivers
export GST_VAAPI_ALL_DRIVERS=1;

# disable thread local malloc cache
GLIBC_TUNABLES='glibc.malloc.tcache_count=0'

# set restrictive umask
if [ "$(/usr/bin/id -ru)" -ge 1000 ] && [ "$(/usr/bin/id -u)" -ge 1000 ] && [ "$(/usr/bin/id -gn)" = "$(/usr/bin/id -un)" ]; then
    umask 0077;
else
    umask 0022;
fi;
