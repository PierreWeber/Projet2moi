#!/bin/bash

###Presentation de la condition avec une alternative BOOLEN
#if test_0
#then commandes_1
#fi

### verifier dans la condition IF , le crochet sont doubler a cause du * 
if [[ "bonjour" == *bonjour* ]]
then 
echo "cela est identique" 
else
echo "ceci n' est pas  identique"
fi

###Comparaison de parametre 
if cmp $1 $2; 							##cmp compare dans la condition du IF  
then
echo "les parametres $1 et $2 sont identiques"
else
echo "les parametres $1 et $2 sont differents"
fi

## Script qui permet d'avoir un note et de l evaluer avec la Boucle IF 
#!/bin/bash

echo "Saisir une note"
read note

if [ $note -ge 16 -a $note -le 20 ]				## la condition est tester car la valeur est un Integer ,  
then								## -a = and , -ge = greater egal , -le = lower egal 						
	echo "très bien"
elif [ $note -lt 16 -a $note -ge 14 ]				## -lt = lower than 		
then
	echo "bien"
elif [ $note -ge 12 -a $note -lt 14 ]
then
	echo "assez bien"
elif [ $note -ge 10 -a $note -lt 12 ] 
then
	echo "moyen"
elif [ $note -lt 10 -a $note -ge 0 ]
then
	echo "insuffisant"
fi


########Script avec boucle IF qui permet de verifier si un utilisateur existe 

#!/bin/bash

user=$1
if [[ $user = `cat /etc/passwd | cut -d ":" -f 1 | grep $1` ]]
then 	echo  " L'utilisateur recherché a un compte sur la machine"  
	echo -n $?
else 	echo  " L’utilisateur recherché n’a pas de compte sur la machine"
	echo -n $?
fi

#Une version protégée de cat
if ls $1 &> /dev/null; 
then 
cat $1 
else
echo "le fichier $1 est introuvable"
fi

## script qui donne le salut selon l'heure qui est lors de la commande 
#!/bin/bash

heure=$(date +"%H")
if [ $heure -le 12 ]
then
	echo -n "Good morning "
elif [ $heure -ge 19 ]
then
	echo -n "Good evening "
else
	echo -n "Good afternoon "
fi
echo "$USER, you're logged on $HOSTNAME"


###Sélection à plusieurs alternatives BOOLEN 

#!/bin/bash
## Script qui permet de verifier les droits d'un parametre mis apres la commande
 
if [ $# -ne 1 ]					## verifier en condition du IF sil ya un paramètres du script"
then
        echo "Erreur: Le nombre de parametres n'est pas bon"
        exit 1
fi
if [ ! -e $1 ]					## verifie en condition du IF si le fichier existe sinon message "le chemin n'existe pas  
then
        echo "le chemin n'existe pas"
elif [ -L $1 ]					##verifie en condition du IF si le fichier existe et si c'est un lien symbolique 
then
        echo "c'est un lien symbolique"
elif [ -f $1 ]					## verifie en condition du IF le fichier   
then
        echo -n "c'est un fichier ("
        [ -r $1 ] && droit="$droit"r				## test si le parametre peut etre lu
        [ -w $1 ] && droit="$droit"w				## test si le parametre peut etre lecrit
        [ -x $1 ] && droit="$droit"x				## test si le parametre peut etre execute
        echo " $droit )"
elif [ -d $1 ]
then
        echo -n "c'est un dossier ("
        [ -r $1 ] && droit="$droit"r
        [ -w $1 ] && droit="$droit"w
        [ -x $1 ] && droit="$droit"x
        echo " $droit )"
fi

#### script avec une suite de note superieur a 0 ou egal a 20 , en fait une moyenne  
#!/bin/bash

nb_notes=0							## pose la variable a 0
echo "Saisir une note"						## on demarre par la phrase d'acceuil  
read note
somme=0								## pose la variable a 0 

while [ $note -ge 0 ]						## la boucle WHILE est mise car on ne caonnit pas le nombre de note 
do
	nb_notes=$(($nb_notes+1))				## rajoute +1 au debut pour faire la moyenne 
	if [ $note -ge 16 -a $note -le 20 ]
	then
		echo "très bien"
	elif [ $note -lt 16 -a $note -ge 14 ]
	then
		echo "bien"
	elif [ $note -ge 12 -a $note -lt 14 ]
	then
		echo "assez bien"
	elif [ $note -ge 10 -a $note -lt 12 ] 
	then
		echo "moyen"
	elif [ $note -lt 10 -a $note -ge 0 ]
	then
		echo "insuffisant"
	fi
	somme=$(($somme+$note))					## a chaque fin de boucle la note et rajouter a la somme 
	echo "saisir une autre note"				## voici la deuxieme demande 
	read note
	if [ $note = "q" ]					## condition IF qui permet de quitter la boucle WHILE
	then
		break						## permet de quitter la boucle 
	fi
done
moyenne=$(($somme/$nb_notes))					## calcul la moyenne 
echo "La moyenne est $moyenne et la somme est $somme"

