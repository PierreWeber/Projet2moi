#!/bin/bash

for i in $(seq 0 9)
do 

echo -n "$i"

done


#script bash pour creer des repertoires/fichier avec un parametre dans  une sequence fini par le parametre 
#!/bin/bash

for i in $(seq 1 $1);
do 

touch "fichier$i"	## creer un fichier
mkdir "tmp$i"		## cree un repertoire 

echo ls 		## pour voir la creation
done

## Script qui permet de faire une exponentionnelle d'un nombre donné
#!/bin/bash

echo "entrez un nombre"
read n

resultat=1		##ouvre la valeur a 1 , peut etre 2 , ou 3

for i in $(seq 1 $n)
do
	resultat=$(($resultat*$n))		## il est important de doubler la parenthese 
done

echo "$n puissance $n = $resultat"		## affiche le nombre donne avec le resultat calcule par la boucle SEQ






