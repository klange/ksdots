#!/bin/bash
echo -e "\e[1mInstalling (or updating) ksdots...\e[0m"

echo -e "\e[1;32mInstalling rc files...\e[0m"
current_path=$(pwd)
cd ~/
for i in  $current_path/home/*; do
	echo -n "Installing $i -> "
	j=`echo $i | sed "s/.*home\//\./"`
	echo "~/$j"
	rm -r $j
	echo "ln -f -s $i $j"
	ln -f -s $i $j
done

echo -e "\e[1;32mInstalling scripts...\e[0m"
if [ ! -e ~/bin ] ; then
	mkdir ~/bin
fi
cd ~/bin
for i in $current_path/scripts/*; do
	echo -n "Installing $i -> "
	j=`echo $i | sed "s/.*scripts\///"`
	echo "~/bin/$j"
	rm -r $j
	echo "ln -f -s $i $j"
	ln -f -s $i $j
done
