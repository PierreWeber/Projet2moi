#/bin/bash

saisie() {                                              ## cree la fonction saisie 
	echo "Saisir un utilisateur"
	read utilisateur
}

verif_existance() {						## cree la fonction existance
	if grep ^$1: /etc/passwd > /dev/null;			## laisse un parametre 
	then
		echo "l'utilisateur $utilisateur existe"
	else
		echo "l'utilisateur $utilisateur n'existe pas"
	fi
}

Creation_utilisateur() {
	read name
	sudo adduser name
	echo " l'utilisateur " $name " est crée."
}

Supprimer_Utilisateur() {
	read name
	sudo userdel name
	echo " L'utilisateur "$name" est supprimé ." 
}


echo "1- Verifier l'existence d'un utilisateur"
echo "2- Connaitre l'UID d'un utilisateur"
echo "3- Creation d'un utilisateur"
echo "4- Suppression d'un utilisateur"
echo "q- Quitter"

read choix

case $choix in
1)
	saisie 							###### utilise la fonction saisie 
	verif_existance $utilisateur				## Utilise la fonction existance avec un parametre la variable utilisateur 

;;
2)
	saisie
	uid=`id -u $utilisateur 2> /dev/null`
	if [ -z $uid ]
	then 
		echo "l'utilisateur $utilisateur n'existe pas"
	else
		echo "l'uid de $utilisateur est $uid"
	fi
;;
3)
	Creation_utilisateur	 	
;;
4)
	Supprimer_Utilisateur	 
;;
q)
	exit
;;
*)
	echo "reponse incorrecte : 1 / 2 / 3 / 4 /q"
;;
esac
