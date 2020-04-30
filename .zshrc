## .zshrc

## load system startup
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi

## zsh setopts
## https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
setopt NO_CASE_GLOB
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

## zsh other
SAVEHIST=5000
HISTSIZE=2000

## environment vars
umask 027
export TZ="HST"
export MALLOC_CHECK_=0
export LC_ALL=C
export GZIP="--best"
export BZIP2="--best"
export PAGER="less -emqw"
export LESS="eMqwP ?1b(line %1b).  ?f%f:stdin.  ?e(END)  :?pb%pb\% .."
export LESSCHARSET="utf-8"
export EDITOR="emacs"
export GREP_OPTIONS="--color=auto"
if [ -z $DISPLAY ]; then
  export DISPLAY=:0.0
fi

## RedHat 
export MINISHIFT_USERNAME=ken.cantwell
export MINISHIFT_PASSWORD=narvik201

## git


## PATH init
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Library/TeX/texbin

## Anaconda aliases
#apath=/Users/Shared/anaconda
apath=/usr/local/anaconda3
alias pyoff="source ${apath}/bin/deactivate &> /dev/null"
alias root="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate root"
#alias py27="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate py27"
#alias py35="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate py35"
#alias py36="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate py36"
alias py37="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate py37"
#alias cartopy="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate cartopy"
#alias mydash="source ${apath}/bin/deactivate &> /dev/null ; source ${apath}/bin/activate mydash"
alias qtconsole="${apath}/envs/py37/bin/jupyter-qtconsole"
alias aconda="${apath}/bin/conda"

## aliases
alias di="dirs -v"
alias ex="exit"
alias hi="history"
alias jo="jobs -l"
alias la="/bin/ls -Ga"
alias ll="/bin/ls -Gasl"
alias ls="/bin/ls -G"
alias mo="less -L -X -emq"
alias num="nl -ba"
alias p="/sbin/ping -c1 -W1 -q"
alias pop="popd; dirs -v"
alias so="source"
#alias timeit="/usr/bin/time -f 'real_time= %E'"
alias timeit="/usr/bin/time"
alias tart="tar tzvf"
alias tarx="tar xzpvf"
alias xxdiff="kdiff3"

## macos
alias brewup="brew update ; brew upgrade ; brew cleanup ; brew doctor"
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

## missing
alias debug="valgrind --leak-check=no"
alias gvv="evince"
alias k="konqueror -geometry 800x1000+100+10"
alias xpdf="/usr/local/bin/xpdf -z page"


## functions
function bak
{
    cp -p $1 $1.$(date +"%Y_%m_%d")
}
function org
{
    cp -p $1 $1.org
    chmod 0444 $1.org
}
function sav
{
    cp -p $1 $1.sav
    chmod 0444 $1.sav
}
function pd
{
    pushd $1
    dirs -v
}
function purge0
{
    if [ $# = 0 ]; then
	/bin/rm -f .??*~ *~ core 2> /dev/null
    else
	for dir; do
	    if [ -d ${dir} ]; then
		/bin/rm -f ${dir}/.??*~ ${dir}/*~ ${dir}/core
	    fi
	done
    fi
}
function purge
{
    if [ $# = 0 ]; then
	dir=.
    else
        dir=${1}
    fi
    if [ -d ${dir} ]; then
	find ${dir} -maxdepth 1 -name ".??*~" | xargs /bin/rm -f
	find ${dir} -maxdepth 1 -name "*~"    | xargs /bin/rm -f
	find ${dir} -maxdepth 1 -name core  | xargs /bin/rm -f
    fi
}
function showpath
{
    xvar="PATH"
    if [ $# -gt 0 ]; then
	xvar=$(printenv | cut -f1 -d= | grep -i "$1")
    fi
    xlist=$(printenv "${xvar}" | sed s/":"/" "/g)
    echo "=== listing ${xvar} ==="
    for item in ${=xlist}; do
	echo "${item}"
    done
}
function meminfo
{
    if [ -e /proc/meminfo ]; then
	## Linux
	value=$(cat /proc/meminfo | grep -i memtotal | awk -F: '{print $2}' | head -n1 | awk '{print $1}')
	value=$(expr ${value} / 1024)
	echo "$value MB"
    else
	## macos
	/usr/bin/top -l1 -s0 | grep PhysMem
    fi
}
function cpuinfo
{
    val=1
    if [ -d /sys/devices/system/cpu ]; then
	val=$(ls -d /sys/devices/system/cpu/cpu[0-9]* | wc -w)
	echo ${val}
    elif [ -e /proj/cpuinfo ]; then
	val=$(cat /proc/cpuinfo | grep -i "^processor" | wc -l)
	echo ${val}
    else
	/usr/sbin/sysctl -a | grep machdep\.cpu | egrep brand_string\|core_count
    fi
}
function inspect
{
    (head -n4 ; tail -n4) < "$1" | column -t
}
function ti
{
    /usr/bin/env TZ=HST     date "+%Y-%m-%d %t %R:%S %t %A %t julian %j %t HST"
    /usr/bin/env TZ=EST5EDT date "+%Y-%m-%d %t %R:%S %t %A %t julian %j %t EST5EDT"
    /usr/bin/env TZ=UTC     date "+%Y-%m-%d %t %R:%S %t %A %t julian %j %t ZULU"
    /usr/bin/env TZ=GMT0BST date "+%Y-%m-%d %t %R:%S %t %A %t julian %j %t GMT0BST"
}

## prompt
#export PS1="$(whoami)@$(uname -n)%  "
#export PS1="$(uname -n)%  "
#export PS1="\h% "
PROMPT="%B%F{9}%m%#%f%b "
