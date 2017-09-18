#!/bin/ash

# ensure, that the sync dir exists
[ -d $NC_SYNC_DIR ] || mkdir -p $NC_SYNC_DIR

nextcloudcmd $( [ $NC_SILENT == true ] && echo "--silent" ) $( [ $NC_TRUST_CERT == true ] && echo "--trust" ) --non-interactive -u $NC_USER -p $NC_PASS $NC_SOURCE_DIR $NC_URL
