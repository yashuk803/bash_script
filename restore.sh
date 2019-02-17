#!/bin/bash

if [[ ! -n "$1" ]]; then
    echo "expected second parameter";
fi

BACKUPS_ROOT=backups/$1;
RESTORE_ROOT=restore/$1;

if [[ ! -d $BACKUPS_ROOT ]]; then
        echo "for $BACKUPS_ROOT/$1 no backup";
fi

if [[ ! -d $RESTORE_ROOT ]]; then
        echo "Creating restore directory";
        mkdir -p $RESTORE_ROOT;
fi

#Копируем файлы в деректорию где нужно распоковать
cp -i $BACKUPS_ROOT/dump.sql.gz  $RESTORE_ROOT;

gzip -d  $RESTORE_ROOT/dump.sql.gz;
unzip  $BACKUPS_ROOT/uploads.zip -d  $RESTORE_ROOT ;

