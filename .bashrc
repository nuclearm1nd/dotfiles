#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export EDITOR="vim"
#export pacman_program="pacman-color"
export PATH=$PATH:/usr/bin

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
#alias ping='ping -c 5'
alias ..='cd ..'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
#alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

# privileged access
if [ $UID -ne 0 ]; then
alias sudo='sudo '
alias scat='sudo cat'
alias svim='sudo vim'
alias root='sudo su'
alias reboot='sudo reboot'
alias halt='sudo halt'
#alias update='sudo pacman -Su'
# alias netcfg='sudo netcfg2'
		fi

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias l1='ls -1'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# pacman aliases (if applicable, replace 'pacman' with your favorite AUR helper)
alias pac="sudo pacman -S"      # default action     - install one or more packages
alias pacu="sudo pacman -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
alias pacs="pacman -Ss"    # '[s]earch'         - search for a package using one or more keywords
alias pacqs="pacman -Qs"
alias paci="pacman -Si"    # '[i]nfo'           - show information about a package
alias pacqi="pacman -Qi"
alias pacr="sudo pacman -R"     # '[r]emove'         - uninstall one or more packages
alias pacl="pacman -Sl"    # '[l]ist'           - list all packages of a repository
alias pacll="pacman -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
alias paclo="pacman -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
alias paco="pacman -Qo"    # '[o]wner'          - determine which package owns a given file
alias pacql="pacman -Ql"    # '[f]iles'          - list all files installed by a given package
alias pacc="sudo pacman -Sc"    # '[c]lean cache'    - delete all not currently installed package files
alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory

alias setukr="setxkbmap -layout \"us,ru,ua\" -option \"grp:alt_shift_toggle\""

# Sort pacman mirrors and overwrite /etc/pacman.d/mirrorlist
alias rflct="reflector --verbose -l 20 -p http --sort rate --country Ukraine,Poland,Lithuania,Latvia --save /etc/pacman.d/mirrorlist"

# export NVM_DIR="/home/vova/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Show weather in cli
alias meteo="curl wttr.in/Kharkiv"
alias meteo2="curl v2.wttr.in/Kharkiv"

export PATH=$PATH:~/.bin

source /etc/profile.d/vte.sh

