## saveTXT.sh

#!/bin/bash


if [ ! -d ~/backup ]
then
	mkdir ~/backup
fi 

find ~/ -name "*.txt" -exec cp {} ~/backup \;
