#!/bin/bash

# la commande continue permet de passer directement a l'itération suivante 
# sans necessairement terminer l'iteration en cours


for f in *; do
	[ -f $f ] || continue
	[ -r $f ] || continue
	echo "printing file $f:"
	case $f in
		*.ps ) lpr $f;;
		*.txt) a2ps $f;;
		*) echo "don't know how to print $f"
	esac
echo "fin de travail"
done
# permet de garder le programme ouvert 
&

