#!/bin/bash

# On verfie si le serveur maria-db est déja installé :
apt list --installed | grep "mariadb-server"

# Si ce n'est pas le cas, installation
if [ ! $? ]; then
	sudo apt update; sudo apt install mariadb-server

else
	echo "Déja installé"
	echo "Quel nom pour le projet ? nomme aussi la db et un utilisateur du projet : "
	read projectname
	echo "Ok pour $projectname"
# Création de la db
 	mariadb -u root -p -e "CREATE DATABASE $projectname;"
# Génération du mot de passe 
	pass=$(openssl rand -base64 16)
	echo $pass > pass_$projectname
# Création de l'utilisateur
	mariadb -u root -p -e "CREATE USER '$projectname'@'localhost' IDENTIFIED BY '$pass';"
# Privilége total de l'utilisateur sur la db 
        mariadb -u root -p -e "GRANT ALL PRIVILEGES ON "$projectname".* TO '$projectname'@'localhost';"
fi


