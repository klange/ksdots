#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DRY=

log () {
	echo -e "\e[1;32m$1\e[0m"
}

install_dir () {
	# $1 source
	# $2 target
	# $3 prefix
	log "Installing '$1' files to '$2'"
	mkdir -p $2
	pushd $2
		for i in $DIR/$1/*; do
			j=`echo $i | sed "s/.*$1\//$3/"`
			echo "  Linking $i → $2/$j"
			if [ -e "$j" ]; then
				echo "   Removing existing $j"
				$DRY rm -r $j
			fi
			$DRY ln -f -s $i $j
		done
	popd
}

install_project () {
	# $1 thing to check $PATH for
	# $2 group
	# $3 project

	log "Checking for a $1..."
	if [ -z "$(which $1)" ]; then
		echo "  Building a $1..."
		mkdir -p ~/Projects
		pushd ~/Projects
			git clone git@github.com:$2/$3
			pushd $3
				make
				sudo make install
			popd
		popd
	fi
	$1 --version
}

install_dir "home" ~ "."
install_dir "scripts" ~/bin ""
install_project "kuroko" "kuroko-lang" "kuroko"
install_project "bim" "klange" "bim"

