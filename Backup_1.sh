#!/bin/bash

# permet via un boucle FOR de faire une copie de fichier vers un repertoire   

mkdir ~/copie   # creer un repertoire copie 

for file in ~/*.tar.gz   # montre les fichiers tar.gz du repertoire courant 
do 
echo $file  #Affiche les fichiers 
done

f=$1 # recupere le parametre a verifier  
for f in ~/*.tar.gz   ## boucle tout les entite choisi avec l'extension .tar.gz
do
nom=`basename $f ".tar.gz"`  # enleve l'entite pour le mettre dans nom 
cp $f ~/copie/"$nom"_copie.tar.gz # copie le fichier vers le repertoire avec le nom choisi en premier 
done


if [ ! -d ~/backup ]  ## Creer le repertoire backup sil n'existe pas deja 
then
        mkdir ~/backup
fi 

find ~/ -name "*.txt" -exec cp {} ~/backup \;   # recuperer tout les fichiers existant en .txt
find ~/ -name "*.txt" -exec cp -n {} ~/backup \; # ne reecrit pas sur les fichiers existant grace option-n 
