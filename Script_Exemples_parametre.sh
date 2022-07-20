#!/bin/bash

## affichage des parametres comme exemple  

echo $0 	&& echo "le nom du script (du fichier)"
echo $# 	&& echo "le nombre de paramètres du script"
echo $* 	&& echo "la liste des paramètres du script"
echo $$ 	&& echo "le numéro de processus du shell courant (PID)"
echo $PPID 	&& echo "le numero du processus parent" 
echo $PWD 	&& echo "Affiche le nom du repertoire courant"
echo $SECOND	&& echo "le temps (en secondes) écoulé depuis le lancement du shell courant"
echo $RAMDOM	&& echo "un nombre entier aléatoire"
echo $!		&& echo "le numéro du dernier processus lancé en arrière-plan"
echo $_		&& echo "le dernier mot de la dernière commande exécutée"
$1  && echo "le 1er parametre mis apres la commande"
echo $? && echo "le code de retour de la dernière commande exécutée"

#!/bin/bash
### début du script de bienvenue 
echo "Hello $USER"
echo "You are currently on $HOST"
echo "The content of your homedir:"
/bin/ls					                                ## accede au chemin directement sans condition ou boucle ni variable 
NBFILES=$(ls | wc -l) 			                    # affectation de la variable NBFILES avec une commande sur un pipe 
echo "Total: $NBFILES elements"

#!/bin/bash
host=`cat /etc/hostname`  		                  ## lit le fichier hostname dans le chemin completement 
echo -n "hello $USER, you are logged on $host and current date and time are :"
date 

#!/bin/bash
echo $0 ; echo $$
echo -n "Hello, $#"

#!/bin/bash
echo  $0
for file in * 		                              ## lit le dossier en cour  
do 
cat  $file 
done
