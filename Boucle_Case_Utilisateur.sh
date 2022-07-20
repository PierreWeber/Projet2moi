#!/bin/bash

# script pour faire un choix de lavage programme 
echo "Choix du programme"
echo "1) cotton 60°"
echo "2) cotton 40°"
echo "3) laine 30°"

read choix  			## attend la variable choix 

case $choix in   		# effectue un commande selon le choix 
1)				# ouvre le cas avec la )
echo "lancement du prog 1"
;;				# ferme le case avec ;; 
2)
echo "lancement du prog 2"
;;
3)
echo "lancement du prog 3"
;;
*) 				# choix par default 
echo "ce programme n'existe pas"
;;
esac

## script plus avance pour recherche un utilisateur ###  

#!/bin/bash

echo "1- Verifier l'existence d'un utilisateur"
echo "2- Connaitre l'UID d'un utilisateur"
echo "q- Quitter"

read users

case $users in
1)
	echo "Saisir un utilisateur"
	read utilisateur
	if grep ^$utilisateur: /etc/passwd > /dev/null;  	## renvoie vers message d'erreur 
	then
		echo "l'utilisateur $utilisateur existe"
	else
		echo "l'utilisateur $utilisateur n'existe pas"
	fi
;;
2)	
	echo "Saisir un utilisateur"
	read utilisateur
	uid=`id -u $utilisateur 2> /dev/null`			## recherche par la commande id -u pour l'utilisateur renvoie tout message d erreur hors de la commande  
	if [ -z $uid ]  					## test la valeur uid , option -z est pour ne pas afficher la valeur UID à 0 
	then 
		echo "l'utilisateur $utilisateur n'existe pas"
	else
		echo "l'uid de $utilisateur est $uid"
	fi
;;
q)
	exit
;;
*)
	echo "reponse incorrecte : 1 / 2 / q"
;;
esac

### meme script qu'avant mais avant les fonctions saisie 
#!/bin/bash

saisie() {							## cree la fonction saisie 
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

echo "1- Verifier l'existence d'un utilisateur"
echo "2- Connaitre l'UID d'un utilisateur"
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
q)
	exit
;;
*)
	echo "reponse incorrecte : 1 / 2 / q"
;;
esac

## Script avec boucle CASE IF qui determine si un fichier est ouvert , fichier mis en 1er parametre , le 2e parametre est pour changer le drapeau 

#!/bin/bash

case $# in     					## ouvre le case avec la valeur 0 qui est le parametre du script 
1)
	if [ -e $1 ]				## le test a la condition de verifier si c'est un fichier 
	then
		cat $1
	else
		echo "erreur: le fichier n'existe pas"		## sinon message 
	fi
;;
2)
	if [ $2 = "on" ]			## le 2eme parametre active le flag on/off/flop , verifier grave a IF
	then
		echo 1 > $1
	elif [ $2 = "off" ]
	then
		echo 0 > $1
	elif [ $2 = "flop" ]
	then
		contenu=`cat $1 2> /dev/null`	## mets la valeur du fichier en condition du IF -z pour mettre aucun message d'erreur dedans 	
		if [ -z $contenu ]
		then
			echo "erreur: le fichier est vide ou il n'existe pas"
		elif [ $contenu -eq 1 ]
		then
			echo 0 > $1		## change la valeur du flag grace au redirecteur . 
		elif [ $contenu -eq 0 ]
		then
			echo 1 > $1
		fi
	fi

;;
esac
