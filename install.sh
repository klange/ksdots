#!/bin/bash
echo -e "\e[1mInstalling (or updating) ksdots...\e[0m"

current_path=$(pwd)
cd ~/
for i in  $current_path/home/*; do
	echo -n "Installing $i -> "
	j=`echo $i | sed "s/.*home\//\./"`
	echo "~/$j"
	rm $j
	echo "ln -f -s $i $j"
	ln -f -s $i $j
done
