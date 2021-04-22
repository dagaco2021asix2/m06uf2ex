#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

CONTINUAR=y

while [ "$CONTINUAR" = y ]
do

COPYFILE1=/etc/ssh/sshd_config
COPYFILE2=/etc/cups/cupsd.conf

echo "Nom de la carpeta a crear: "
read NEWDIREC

CHECKDIREC=/var/$NEWDIREC
if [[ ! -d $CHECKDIREC ]]
	then mkdir $CHECKDIREC
fi

if cp $COPYFILE1 $CHECKDIREC/sshd_config
	then echo "Fitxers copiats"
else
	echo "Ha fallat la copia"
fi

if cp $COPYFILE2 $CHECKDIREC/cupsd.conf
	then echo "Fitxers copiats"
else
	echo "Ha fallat la copia"
fi


echo "Vols continuar? [y per continuar]"
read CONTINUAR
if [ "$CONTINUAR" = y ]
	then clear
fi

done
exit 5
