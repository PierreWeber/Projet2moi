#!/bin/bash

#pour afficher les fichiers executables du repertoire en parametre

cd $1

for file in * 						#boucle FOR dans le repertoire courant
do 
  test -f $file -a -x $file && echo $file  	 	#Utilise la commande test pour fichier -f existant 
done					    		#utilise -x pour fichier existant et granted
for filesh in *.sh
do 
	[ -f $filesh -a -x $filesh ] ; echo $filesh   	#Utilise la commande test [] avec seulement -x pour les fichier granted 
done
for fil0 in *
do 
        [ -s $fil0 ]   					#Utilise le  -s pour les fichier >0 
	echo $fil0     					#Affiche le resultat
done


