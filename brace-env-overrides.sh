export CRYFS_NO_UPDATE_CHECK=true;

# zero video RAM to prevent leakage
# see: https://www.adlerweb.info/blog/2012/06/20/nvidia-x-org-video-ram-information-leak
export R600_DEBUG=zerovram;
export AMD_DEBUG=zerovram;
export RADV_DEBUG=zerovram;
