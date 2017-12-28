#!/bin/ash

# check if the sync user exists
id -u $USER || adduser -D -H $USER

# ensure, that the sync dir exists and is owned by the user
[ -d $NC_SYNC_DIR ] || mkdir -p $NC_SYNC_DIR
chown $USER:$USER $NC_SOURCE_DIR

su $USER -c 'nextcloudcmd $( [ $NC_SILENT == true ] && echo "--silent" ) $( [ $NC_TRUST_CERT == true ] && echo "--trust" ) --non-interactive -u $NC_USER -p $NC_PASS $NC_SOURCE_DIR $NC_URL'
