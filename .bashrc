#
# klange's ~/.bashrc
# 
# [2010-09-22] Make linux palette a function
# [2010-09-21] update_bashrc command
# [2010-09-21] Initialize git -> github.com/klange/bashrc
# [2010-09-21] Added Tango framebuffer palette
#

[ -z "$PS1" ] && return

# DEFAULTS
KLANGE_USE_GIT=0
KLANGE_USE_SVN=0
KLANGE_USE_HG=0

# HOST OPTIONS
case `hostname --long` in
	luka|kaito|miku|rin|len)
		KLANGE_USE_GIT=1
		KLANGE_USE_SVN=1
		KLANGE_USE_HG=1
		;;
	*.acm.uiuc.edu|*.acm.illinois.edu)
		KLANGE_USE_GIT=1
		alias conkyForecast="python conkyForecast/conkyForecast.py"
		export PATH=/afs/acm.uiuc.edu/user/lange7/bin:$PATH
		;;
	*.ews.illinois.edu|*.ews.uiuc.edu)
		KLANGE_USE_GIT=0
		KLANGE_USE_SVN=1
		alias cs232=/homesta/classdata/bin/cs232
		export PATH=/home/engr/lange7/bin:$PATH
		alias sudo="echo This is an EWS workstation. You do not have 'sudo' here. #"
		;;
esac

# SPECIAL OPTIONS AND FIXES

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# Fix gnome-terminal color support
if [ "$COLORTERM" == "gnome-terminal" ]; then
	export TERM="xterm-256color"
fi

# Tango palette for framebuffers
function color_palette () {
	echo -en "\e]P02e3436" #black
	echo -en "\e]P8555753" #darkgray
	echo -en "\e]P1cc0000" #darkred
	echo -en "\e]P9ef2929" #red
	echo -en "\e]P24e9a06" #darkgreen
	echo -en "\e]PA8ae234" #green
	echo -en "\e]P3c4a000" #brown
	echo -en "\e]PBfce94f" #yellow
	echo -en "\e]P43465a4" #darkblue
	echo -en "\e]PC729fcf" #blue
	echo -en "\e]P575507b" #darkmagenta
	echo -en "\e]PDad7fa8" #magenta
	echo -en "\e]P606989a" #darkcyan
	echo -en "\e]PE34e2e2" #cyan
	echo -en "\e]P7ffffff" #lightgray
	echo -en "\e]PFeeeeec" #white
}
if [ "$TERM" == "linux" ]; then
	color_palette
fi

# PROMPT

function prompt_command {
	# [user host MM/DD HH:MM /path/to/us]
	# $ *
	local RETURN_CODE="$?"
	local ASCII_RESET="\[\e[0m\]"
	local ASCII_BOLD="\[\e[1m\]"
	local USER_COLOR="\[\e[1;33m\]"
	local PROMPT_COLOR="\[\e[1;32m\]"
	if [[ ${EUID} == 0 ]] ; then
		PROMPT_COLOR="\[\e[1;31m\]"
	fi
	local HOST_COLOR="\[\e[1;32m\]"
	local DATE_COLOR="\[\e[1;31m\]"
	local TIME_COLOR="\[\e[1;34m\]"
	local DATE_STRING="\$(date +%m/%d)"
	local TIME_STRING="\$(date +%H:%M:%S)"
	local CYAN_COLOR="\[\e[1;36m\]"
	local PINK_COLOR="\[\e[1;35m\]"
	#
	local PROMPT_PREFIX="$PROMPT_COLOR"
	if [[ $RETURN_CODE != 0 ]] ; then
		PROMPT_PREFIX="$DATE_COLOR$RETURN_CODE$ASCII_RESET " # do nothing
	fi
	# Title bar
	local TITLEBAR=""
	case $TERM in
		xterm*|*rxvt*|cygwin|interix|Eterm|mlterm|kterm|aterm|putty*)
			if [ "${STY}" ] ; then
				 TITLEBAR="\[\ek\u@\h:\w\e\134\]"
			else
				TITLEBAR="\[\e]1;\u@\h:\w\007\e]2;\u@\h:\w\007\]"
			fi
		;;
		screen*)
			TITLEBAR="\[\ek\u@\h:\w\e\134\]"
		;;
	esac
	#
	# Git support
	if [ $KLANGE_USE_GIT ]; then
		if [ -e .git ] ; then
			local GIT_STATUS=`git status 2>/dev/null`
			if [[ $GIT_STATUS != "" ]] ; then
				local REFS=" $(git symbolic-ref HEAD 2>/dev/null | sed 's/.*\///')"
				REFS="${REFS#refs/heads/}"
				if [[ `echo $GIT_STATUS | grep "modified:"` != "" ]] ; then
					REFS="$REFS$ASCII_RESET ${PINK_COLOR}modified"
				fi
				if [[ `echo $GIT_STATUS | grep "ahead of"` != "" ]] ; then
					REFS="$REFS$ASCII_RESET ${CYAN_COLOR}not pushed"
				fi 
				PROMPT_PREFIX="$PROMPT_PREFIX${HOST_COLOR}git$USER_COLOR$REFS$ASCII_RESET "
			fi
		fi
	fi
	#
	# SVN support
	if [ $KLANGE_USE_SVN ]; then
		if [ -e .svn ] ; then
			local SVN_STATUS=`svn info 2>/dev/null`
			if [[ $SVN_STATUS != "" ]] ; then
				local REFS=" $(svn info | grep "Repository Root" | sed 's/.*\///')"
				if [[ `svn status | sed 's/ .*//' | grep M` != "" ]] ; then
					REFS="$REFS$ASCII_RESET ${PINK_COLOR}modified"
				fi
				PROMPT_PREFIX="$PROMP_PREFIX${HOST_COLOR}svn$USER_COLOR$REFS$ASCII_RESET "
			fi
		fi
	fi
	#
	# Mercurial
	if [ $KLANGE_USE_HG ]; then
		if [ -e .hg ] ; then
			local HG_STATUS=`hg summary 2>/dev/null`
			if [[ HG_STATUS != "" ]] ; then
				local REFS=" $(echo $HG_STATUS | grep 'branch: ' | sed 's/branch: //')"
				if [[ `hg status | sed 's/ .*//' | grep 'A'` != "" ]] ; then
					REFS="$REFS$ASCII_RESET ${PINK_COLOR}modified"
				fi
				PROMPT_PREFIX="$PROMPT_PREFIX${HOST_COLOR}hg$USER_COLOR$REFS$ASCII_RESET "
			fi
		fi
	fi
	# And we're done
	PS1="$TITLEBAR$ASCII_BOLD[$USER_COLOR\u $HOST_COLOR\h $DATE_COLOR$DATE_STRING $TIME_COLOR$TIME_STRING $PROMPT_PREFIX$ASCII_RESET\w$ASCII_BOLD]$ASCII_RESET\n$PROMPT_COLOR\\\$$ASCII_RESET "
}
export PROMPT_COMMAND=prompt_command

# COLOR SUPPOORT

if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
	alias ls='ls --color=auto'
fi

# TAB COMPLETION

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# ALIASES

alias なの="LANG=ja_JP.utf8 nano"
alias rape='fsck -f'
alias ll='ls -l'
alias la='ls -la'

# FUNCTIONS

generate_password () {
	cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1
}

inform_the_mothership () {
	fqdn | ssh dakko.us tee `hostname --long` > /dev/null
}

unkey_host () {
	if [ $# -ne 1 ] ; then
		return 1
	fi
	sed -i -e "/$1/d" $HOME/.ssh/known_hosts
}

update_bashrc () {
	echo "Updating .bashrc..."
	wget -O /tmp/new_bashrc -q http://github.com/klange/bashrc/raw/master/.bashrc
	if [ "$(cmp /tmp/new_bashrc ~/.bashrc)" == "" ] ; then
		echo "You are already up to date."
	else
		echo -e "\e[1mChanges in this update:\e[0m"
		diff ~/.bashrc /tmp/new_bashrc
		echo -n "Do you wish to continue? (Y/n) "
		read bashrc_update_continue
		if [ "$bashrc_update_continue" == "n" ] ; then
			echo "Update cancelled."
		else
			mv /tmp/new_bashrc ~/.bashrc
			echo -n "Update completed, restart bash? (Y/n) "
			read bashrc_update_restart
			if [ "$bashrc_update_restart" == "n" ] ; then
				echo "Please restart bash for changes to take effect."
			else
				exec bash
			fi
		fi
	fi
}
