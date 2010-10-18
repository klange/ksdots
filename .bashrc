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

if [ "$(uname)" == "Darwin" ] ; then
	HOSTNAME=`hostname`	
else
	HOSTNAME=`hostname --long`
fi

# HOST OPTIONS
case $HOSTNAME in
	luka|kaito|miku|rin|len)
		KLANGE_USE_GIT=1
		KLANGE_USE_SVN=1
		KLANGE_USE_HG=1
		;;
	*.acm.uiuc.edu|*.acm.illinois.edu)
		KLANGE_USE_GIT=1
		alias conkyForecast="python conkyForecast/conkyForecast.py"
		;;
	*.ews.illinois.edu|*.ews.uiuc.edu)
		KLANGE_USE_GIT=0
		KLANGE_USE_SVN=1
		alias cs232=/homesta/classdata/bin/cs232
		alias sudo="echo This is an EWS workstation. You do not have 'sudo' here. #"
		;;
esac

# ~/bin
if [ -e ~/bin ]; then
	export PATH=~/bin:$PATH
fi

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
else
	if [ -e ~/bin/answerback ]; then
		export ANSWERBACK=$(~/bin/answerback)
		if [ "x$ANSWERBACK" == "xPuTTY" ]; then
			export TERM="xterm-256color"
			export COLORTERM="putty-256color"
			export LANG="C"
		fi
	fi
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

if [ "$TERM" == "screen-bce" ]; then
	# I use screen under 256-color-supportive things
	# far more often than not, so give me 256-colors
	export TERM=screen-256color
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
	# user and host
	local PROMPT_PREFIX="$USER_COLOR\u $HOST_COLOR\h "
	# Screen window number
	if [ "$WINDOW" != "" ] ; then
		PROMPT_PREFIX="$PROMPT_PREFIX$PINK_COLOR%$WINDOW "
	else
		PROMPT_PREFIX="$PROMPT_PREFIX$DATE_COLOR$DATE_STRING $TIME_COLOR$TIME_STRING "
	fi
	# Return code
	if [[ $RETURN_CODE != 0 ]] ; then
		PROMPT_PREFIX="$PROMPT_PREFIX$DATE_COLOR$RETURN_CODE$ASCII_RESET " # do nothing
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
	# Git support
	if [ $KLANGE_USE_GIT ]; then
		local GIT_STATUS=`git status 2>/dev/null`
		if [[ $GIT_STATUS != "" ]] ; then
			local REFS=" $(git symbolic-ref HEAD 2>/dev/null | sed 's/.*\///')"
			REFS="${REFS#refs/heads/}"
			if [[ `echo $GIT_STATUS | grep "modified:"` != "" ]] ; then
				REFS="$REFS$ASCII_RESET ${PINK_COLOR}m" # Modified
			elif [[ `echo $GIT_STATUS | grep "renamed:"` != "" ]] ; then
				REFS="$REFS$ASCII_RESET ${PINK_COLOR}m" # Modified as well
			fi
			if [[ `echo $GIT_STATUS | grep "ahead of"` != "" ]] ; then
				REFS="$REFS$ASCII_RESET ${CYAN_COLOR}s" # Staged
			fi 
			PROMPT_PREFIX="$PROMPT_PREFIX${HOST_COLOR}git$USER_COLOR$REFS$ASCII_RESET "
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
					REFS="$REFS$ASCII_RESET ${PINK_COLOR}m" # Modified
				fi
				PROMPT_PREFIX="$PROMPT_PREFIX${HOST_COLOR}svn$USER_COLOR$REFS$ASCII_RESET "
			fi
		fi
	fi
	#
	# Mercurial
	if [ $KLANGE_USE_HG ]; then
		if [ -e .hg ] ; then
			local REFS=" $(hg branch 2>/dev/null)"
			if [[ `hg status | sed 's/ .*//' | grep 'A'` != "" ]] ; then
				REFS="$REFS$ASCII_RESET ${PINK_COLOR}m" # modified
			fi
			PROMPT_PREFIX="$PROMPT_PREFIX${HOST_COLOR}hg$USER_COLOR$REFS$ASCII_RESET "
		fi
	fi
	# Paths
	local PATH="\w"
	if [ -e ~/bin/shorten_pwd ] ; then
		PATH=`~/bin/shorten_pwd`
	fi
	# And we're done
	PS1="$TITLEBAR$ASCII_BOLD[$PROMPT_PREFIX$ASCII_RESET$PATH$ASCII_BOLD]$ASCII_RESET\n$PROMPT_COLOR\\\$$ASCII_RESET "
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

# EDITOR

export EDITOR=vim

# FUNCTIONS

generate_password () {
	cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1
}

inform_the_mothership () {
	fqdn | ssh dakko.us tee `hostname` > /dev/null
}

unkey_host () {
	if [ $# -ne 1 ] ; then
		return 1
	fi
	sed -i -e "/$1/d" $HOME/.ssh/known_hosts
}

whos_running_firefox () {
	for i in thecheat zaphod ng yt hiro; do
		echo -e "\e[1m$i\e[0m"
		ssh $i "ps -A aux | grep firefox | grep -v grep"
	done
}

pecho () {
	if [ "$1" == "" ]; then
		echo 'Usage: pecho [window_number [window_number [...]]]'
		return 1
	fi
	echo -e "\e[1m[echoing in parallel on screens $@]\e[0m"
	while IFS= read -r -s -n1 c; do
		for screen in $@; do
			if [ "$c" == "" ]; then
				screen -X -p $screen stuff $'\012'
			else
				screen -X -p $screen stuff $"$c"
			fi
		done
	done
}

