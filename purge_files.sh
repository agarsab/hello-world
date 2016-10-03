#!/bin/bash
# FUNCION Elimina los ficheros de <directorio> que tienen mas de <dias>
DIR=$1
DIAS=$2

function error_exit {
        echo "Error: "$1
        echo $0" <directorio> <dias>"
        exit 1
}

if [ -z "$DIR" ];
then
        error_exit "no se indica el directorio"
fi

if [ -z "$DIAS" ];
then
        error_exit "no se indican los dias"
fi

if [ ! -d "$DIR" ];
then
        error_exit "no existe el directorio"$DIR
fi

if [ $DIAS -le 0 ];
then
        error_exit "numero de dias incorrecto: "$DIAS
fi

find $DIR -type f -mtime +$DIAS -exec rm -rf {} \;
find $DIR -type d -empty -exec rmdir -p {} \;

exit 0
