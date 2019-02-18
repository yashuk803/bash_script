#!/bin/bash
set -e

if [ -z $1 ] || [ "$#" -gt 1 ]; then
    echo -e "expected one argument in format date d-m-Y";
    exit 1;
fi

REGEX_DATE='^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

if [[ ! $1 =~ $REGEX_DATE ]]; then
    echo -e "Incorrect Date format";
    exit 1;
fi

BACKUPS_ROOT=~/backups/$1;
APP_ROOT=~/backend;
APP_UPLOAD_ROOT=$APP_ROOT/web/uploads;

if [[ ! -d $BACKUPS_ROOT ]]; then
        echo -e "for $BACKUPS_ROOT no backup";
        exit 1;
fi

if [[ ! -d $APP_UPLOAD_ROOT ]]; then
        echo "Creating app directory";
        mkdir -p $APP_UPLOAD_ROOT;
fi

#Copy dump.sql to the root application directory
cp -i $BACKUPS_ROOT/dump.sql.gz  $APP_ROOT;

gzip -d  $APP_ROOT/dump.sql.gz;
unzip  $BACKUPS_ROOT/uploads.zip -d  $APP_UPLOAD_ROOT ;

