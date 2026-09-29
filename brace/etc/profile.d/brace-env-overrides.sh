#!/bin/sh
#Copyright (c) 2020-2026 Divested Computing Group
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

#misc
export CRYFS_NO_UPDATE_CHECK=true;

# zero video RAM to prevent leakage
# see (CC BY-SA 4.0): https://www.adlerweb.info/blog/2012/06/20/nvidia-x-org-video-ram-information-leak
export R600_DEBUG=zerovram; #r600
export AMD_DEBUG=zerovram; #radeonsi
export radeonsi_zerovram=true;
export RADV_DEBUG=zerovram; #radv
export radv_zero_vram=true;
export NVK_DEBUG=zero_memory; #nvk
export vk_zero_vram=true;

# enable gstreamer va-api plugin on unsupported drivers
export GST_VAAPI_ALL_DRIVERS=1;

# disable unnecessary gst plugins TODO: there are like 1,200 of them
#GST_PLUGIN_FEATURE_RANK=pluginA:NONE,pluginB:NONE...

# disable thread local malloc cache
export GLIBC_TUNABLES='glibc.malloc.tcache_count=0'

# disable JavaScript JIT, credit @RKNF404
# https://trac.webkit.org/wiki/EnvironmentVariables
export JavaScriptCoreUseJIT=0;
export JSC_useFTLJIT=0; #deprecated?
# https://gitlab.gnome.org/GNOME/gjs/-/blob/master/doc/Environment.md
export GJS_DISABLE_JIT=1;

# disable log uploading for Tailscale
export TS_NO_LOGS_NO_SUPPORT=true;

# set restrictive umask
if [ "$(/usr/bin/id -ru)" -ge 1000 ] && [ "$(/usr/bin/id -u)" -ge 1000 ] && [ "$(/usr/bin/id -gn)" = "$(/usr/bin/id -un)" ]; then
    umask 0077;
else
    umask 0022;
fi;

#Chromium hardening via flags to supplement the policy
#Credit: https://github.com/RKNF404/chromium-hardening-guide
#Credit: https://peter.sh/experiments/chromium-command-line-switches
export CHROMIUM_USER_FLAGS=" \
--component-updater=disable-pings \
--disable-3d-apis \
--disable-breakpad \
--disable-crash-reporter \
--disable-webgl \
--extension-content-verification=enforce_strict \
--extensions-install-verification=enforce_strict \
--no-pings \
--override-enabled-cdm-interface-version=999 \
--enable-features=ClearCrossSiteCrossBrowsingContextGroupWindowName,IsolateSandboxedIframes:grouping/per-document,OriginKeyedProcessesByDefault,PartitionAllocWithAdvancedChecks:enabled-processes/all-processes,PartitionConnectionsByNetworkIsolationKey,ReduceAcceptLanguage,ScopeMemoryCachePerContext,SplitCacheByIncludeCredentials,SplitCacheByNetworkIsolationKey,SplitCodeCacheByNetworkIsolationKey,SplitHostCacheByNetworkAnonymizationKey,StrictOriginIsolation \
--disable-features=AimEnabled,AutofillServerCommunication,CrashReporting,DocumentReporting,InterestFeedV2,Journeys,LensOverlay,LensStandalone,MediaDrmPreprovisioning,NTPPopularSitesBakedInContent,OptimizationHints,OptimizationHintsFetchingSRP,Reporting,SkillsEnabled,StarterPackExpansion,TabHoverCardImages,WebGPUBlobCache,WebGPUService";
