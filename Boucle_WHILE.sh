#!/bin/bash

###while conditions do   				##Attention TRUE  doit etre la condition ##
## Traitement à répéter Commandes
###done

#Exemple

echo  "Programme de saisie continue" 

saisie=a 
while [ $saisie != "Y" ]
do
	echo " Saisie la lettre Y"
	read saisie
done
echo -n "Programme Termine"


#!/bin/bash

#ecrire un script Shell oui.sh affichant « OUI » si l’utilisateur a saisi le caractère o ou O, « NON » si l’utilisateur a
#saisi le caractère n ou N et « Réponse incorrecte » dans tous les autres cas.

while true
do
echo -n "Entrer un caractere suivant (o/n) "
read on
case $on in
[oO]) echo -n "OUI" ; break;;
[nN]) echo -n "NON" ; break;;
*) echo "$yn: réponse incorrecte";;
esac
done


## meme script avec les Fonctions saisie dedans et sans la Boucle WHILE 
#!/bin/bash

echo "Saisir un caractere (O/o/N/n)"
read saisie


if [ "$saisie" = "O" -o "$saisie" = "o" ]
then
	echo "OUI"
elif [ "$saisie" = "N" -o "$saisie" = "n" ] 
then
	echo "NON"
else
	echo "Reponse incorrecte"
fi

# le break permet de sortir d un boucle sans terminer l'iteration en cour et sans passer par le test
#!/bin/bash

while true		## la condition TRUE est viable  
do
        echo -n "list the current dir? (y/n/q) "
        read yn
                case $yn in
                [yY]) ls -l . ; break;;
                [nN]) echo "skipping" ; break;;
                q*)   echo "$yn: unknown response";;
                esac
done
