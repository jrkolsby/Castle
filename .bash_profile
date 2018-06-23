# List files with colors
alias ll='ls -laGF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

mkcd () { mkdir "$@" && cd "$@"; }
clac () { ssh $@@clac.cs.columbia.edu; }

# Easier directory navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# color!
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[1;33m\]\u \[\033[31m\]@\h \[\033[32m\]:\w \[\033[0m\]$ "
else
    PS1="\u @\h :\w $ "
fi
unset color_prompt force_color_prompt

LS_COLORS=$LS_COLORS:'di=1;4;31;42' ; export LS_COLORS

# added to install fontforge
export PATH=/usr/local/bin:$PATH

# added to install scim
export PATH=$PATH:~/Documents/sc-im/src

# Setting PATH for Python 3.5
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 