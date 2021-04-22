#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

echo "Nom d'usuari per buscar UID: "
read USRNME

if id -u $USRNME 2>/dev/null
	then exit 0
else
	echo "Error. Aquest usuari no existeix"
	exit 1
fi


