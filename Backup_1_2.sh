#!/bin/bash

## saveTXT.sh

if [ ! -d ~/backup ]
then
	mkdir ~/backup
fi 

find ~/ -name "*.txt" -exec cp {} ~/backup \;
