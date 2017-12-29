#!/bin/ash

# ensure, that the sync dir exists and is owned by the user
[ -d $NC_SYNC_DIR ] || mkdir -p $NC_SYNC_DIR
echo "chown $USER:$USER $NC_SOURCE_DIR"
chown -R $USER:$USER $NC_SOURCE_DIR

while true
do
	/bin/su -s /bin/ash $USER -c 'nextcloudcmd $( [ $NC_SILENT == true ] && echo "--silent" ) $( [ $NC_TRUST_CERT == true ] && echo "--trust" ) --non-interactive -u $NC_USER -p $NC_PASS $NC_SOURCE_DIR $NC_URL'
	sleep 300
done
