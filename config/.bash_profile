alias ll='ls -laGF'

alias grep='grep --color=auto'

alias fixprettier='git diff HEAD --name-only | xargs -I {} yarn prettier --write {}'
alias fp='ssh ron@floorplan.intranet.1stdibs.com'

alias wer='curl wttr.in?0'

# TODO: git aliases
alias gs='git status'
#alias gp = 'git pull --rebase upstream'
#alias gl = 'git reflog'

mkcd () { mkdir "$@" && cd "$@"; }

json () { cat "$@" | python -m json.tool; }

look () { grep -rnw "$2" -e "$1"; }

vimf () { vim $(fzf --height 40% --reverse -q "$@"); }
vims () { tmux split-window -v "vim $@"; }
vimi () { tmux split-window -h "vim $@"; }

# Include hidden files for fzf
export FZF_DEFAULT_COMMAND='find .'

dapache () { 
    cp ~/.vim/snips/docker-apache-php ./Dockerfile 
    docker build -t "$@" . 
    docker run -p 8080:80 -d "$@"
    docker run -p 8080:80 -d -v /Users/dan/site:/var/www/site "$@"
    apachectl start
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

split_pwd() {
        # Only show ellipses for directory trees -gt 3
        # Otherwise use the default pwd as the current \w replacement
        if [ $(pwd | grep -o '/' | wc -l) -gt 3 ]; then
            pwd | cut -d'/' -f1-3 | xargs -I{} echo {}"/../${PWD##*/}"
        else
            pwd
        fi
}

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
    # PS1="\[\033[1;33m\]\u\[\033[31m\]\$(parse_git_branch) \[\033[32m\]\$(split_pwd) \[\033[0m\]$ "
    PS1="\[\033[1;33m\]\u\[\033[31m\]\$(parse_git_branch) \[\033[32m\]\w \[\033[0m\]$ "
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

# git autocomplete script
source ~/.git-completion.sh

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 
