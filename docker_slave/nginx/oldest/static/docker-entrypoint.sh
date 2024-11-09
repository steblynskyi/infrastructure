#!/bin/bash
set -e

if [ -z $SKIP ]; then
	if [ -z $PICKUPDIR ]; then
		PICKUPDIR="dist/*"
	else 
		PICKUPDIR="$PICKUPDIR/*"
	fi

	if [ -z $TARGETDIR ]; then
		TARGETDIR="/var/www/html/"
	else
		TARGETDIR="/var/www/html/$TARGETDIR/"
	fi
	npm install
	npm run build 

	mkdir -p $TARGETDIR
	cp -r $PICKUPDIR $TARGETDIR
fi
exec "$@"