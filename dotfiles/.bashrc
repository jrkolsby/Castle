alias ls='ls'
alias o='xdg-open'

alias l='ls -1aGF'
alias ll='ls -laGF'

alias grep='grep --color=auto'

alias youtube-dl='youtube-dl --recode-video mp4'

alias clear='tmux clear-history &>/dev/null && clear'

alias fixprettier='git diff HEAD --name-only | xargs -I {} yarn prettier --write {}'
alias fp='ssh ron@floorplan.intranet.1stdibs.com'

# weather
alias wer='curl wttr.in?0'

alias mysql='mysqlsh --sql'
alias sql='mysqlsh --sql --uri dbuser@localhost'

# Git aliases
alias gb='git branch'
alias gbc='git branch --show-current'
alias gs='git status'
alias gr='git pull --rebase'
alias gl='git log --date=short --pretty=format":%C(yellow)%h %C(blue)%ad %C(green)%aN %Creset%s%C(red)%d%Creset"'

alias startdbl='USE_LOCAL_DBL=true yarn start'
alias devdbl='yarn dev --local-dbl'

qsys () { 
    scl enable devtoolset-2 /opt/intelFPGA/18.1/embedded/embedded_command_shell.sh 
}

export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/.castle/bin/git-complete
source ~/miniforge3/bin/activate

die () { kill -9 $(lsof -i:$1 -t); }

mkcd () { mkdir "$@" && cd "$@"; }

json () { cat "$@" | python -m json.tool; }

look () { grep -rnw "$2" -e "$1"; }

vimf () { vim $(fzf --height 40% --reverse -q "$@"); }
vims () { tmux split-window -v "vim $@"; }
vimi () { tmux split-window -h "vim $@"; }

makemov () { ffmpeg -i "$1" -vcodec libx264 -pix_fmt yuv420p -acodec copy "$1.mov"; } 
makemovsub () { ffmpeg -i "$1" -vcodec libx264 -pix_fmt yuv420p -acodec copy -vf "subtitles='$2':force_style='FontName=HelveticaNeue,Bold=700,FontSize=18,Outline=1'" "$1-subbed.mov"; }
makemovsubtest () { ffmpeg -i "$1" -vcodec libx264 -t 00:05:00 -pix_fmt yuv420p -acodec copy -vf "subtitles='$2':force_style='FontName=HelveticaNeue,Bold=700,FontSize=18,Outline=1'" "$1-subbed.mov"; }
shiftsubs() { ffmpeg -itsoffset $2 -i "$1" -c copy "$1-shifted.srt"; }

makegifloop () { ffmpeg -y -i "$1" -filter_complex "[0]reverse[r];[0][r]concat=n=2:v=1:a=0,fps=12,scale=720:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=64[p];[s1][p]paletteuse=dither=bayer" "$1.gif"; }
makemosaic () { ffmpeg -i "$1" -vf select='gt(scene\,0.2)',scale=160:-1,tile=8x30 -frames:v 1 "$1.png"; }
makemosaicc4k () { ffmpeg -i still-%05d.png -filter_complex "crop=3600:1890:0:260,scale=1000:-1,tile=2x4" output.png; }

makegif () { ffmpeg -y -i "$1" -filter_complex "fps=12,scale=720:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=64[p];[s1][p]paletteuse=dither=bayer" "$1.gif"; }

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

sleep-in() {
    local minutes=$1
    local datetime=`date -v+${minutes}M +"%m/%d/%y %H:%M:%S"`
    sudo pmset schedule sleep "$datetime"
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

export PATH="$PATH:/usr/local/bin"			# fontforge
export PATH="$PATH:/opt/etcher-cli"			# etcher cli
export PATH="$PATH:/opt/intelFPGA/18.1/quartus/bin"	# quartus
export PATH="$PATH:/opt/intelFPGA/19.1/modelsim_ase/bin" # modelsim
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.5/bin"
export PATH="$PATH:/Users/james/Library/Python/3.8/bin"
export PATH="$PATH:$HOME/.rvm/bin"			# scripting?
export PATH="$PATH:$HOME/Documents/sc-im/src"		# scim
export PATH="$PATH:$HOME/.castle/bin"			# our scripts!
export PATH="$PATH:/opt/rh/devtoolset-2/root/usr/bin"	# g++ 4.8
export PATH="$PATH:/opt/homebrew/bin"	                # brew
export PATH="$PATH:~/miniforge3/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export MANPATH="$MANPATH:/usr/local/opt/coreutils/libexec/gnuman/"
export MANPATH="$MANPATH:/usr/local/linux-man/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
