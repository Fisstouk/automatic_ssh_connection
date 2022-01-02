#!/bin/bash
#
#
#version:1.0

if [ "$#" -ne 1 ]; then
	echo 'Utilisation: '$0' [chemin_cle_publique.pub]'
	exit
fi

#echo "Installation de l'outil sshpass"
sudo apt install sshpass

#utiliser la cle publique comme argument 1
file="$1"

echo "Entrez le nom de l'utilisateur de la machine distante"
read usr

echo "Entrez l'adresse IP de la machine distante"
read host

#argument -s empeche l'affichage du mot de passe entré
echo "Entrez le mot de passe de la machine distante"
read -s password

echo "Transfert de la clé publique au serveur"
sshpass -p "$password" ssh-copy-id -i "$file" "$usr"@"$host" -p 22

#suppression du contenu de la variable $password
unset password

echo "Connexion à la machine $usr@$host"
ssh $usr@$host

