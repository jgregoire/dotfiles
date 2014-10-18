## Oh-My-Zsh stuff ##
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git gitfast git-flow)

source $ZSH/oh-my-zsh.sh

## The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/james/.zshrc'

autoload -Uz compinit
compinit
## End of lines added by compinstall
## Lines configured by zsh-newuser-install
bindkey -e
## End of lines configured by zsh-newuser-install


##
## Add directories to default PATH
##
# Add directories here
pathdirs=(
	~/Scripts
)

# Now we make sure they exist before adding them
for dir in $pathdirs; do
	if [ -d $dir ]; then
		path+=$dir
	fi
done


##
## Beautify the Terminal
##

# Set prompt style
autoload colors && colors
# Green and yellow (fafnir)
#PROMPT="%{$fg[green]%}%n%{$reset_color%}%{$fg_no_bold[yellow]%}@%{$reset_color%}%{$fg[green]%}%M%{$reset_color%} %{$fg_bold[yellow]%}%~%{$reset_color%} > "

# Blues (ymir)
#PROMPT="%{$fg[cyan]%}%n%{$reset_color%}%{$fg_no_bold[magenta]%}@%{$reset_color%}%{$fg[cyan]%}%M%{$reset_color%} %{$fg_bold[magenta]%}%~%{$reset_color%} > "

# Reds (nidhoggr)
#PROMPT="%{$fg[red]%}%n%{$reset_color%}%{$fg[yellow]%}@%{$reset_color%}%{$fg[red]%}%M%{$reset_color%} %{$fg_bold[yellow]%}%~%{$reset_color%} > "

# Purples (jormundgand)
#PROMPT="%{$fg[magenta]%}%n%{$reset_color%}%{$fg[yellow]%}@%{$reset_color%}%{$fg[magenta]%}%M%{$reset_color%} %{$fg_bold[yellow]%}%~%{$reset_color%} > "


# Set title style
case $TERM in
  *term*)
    chpwd () {print -Pn "\e]0;%n@%M %~\a"}
    ;;
esac


##
## History Settings
##

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY


##
## Other Settings
##

# Stops pesky Ctrl-S halting terminal
setopt NO_FLOW_CONTROL 

# Don't kill backgrnd processes when exiting shell
setopt AUTO_CONTINUE

# Watch other users login/out
watch=notme            


##
## Globbing Settings
##

setopt EXTENDED_GLOB
setopt NUMERIC_GLOB_SORT


##
## Aliases
##

alias go='sudo mencoder tv:// -tv driver=v4l2:width=1280:height=720:device=/dev/video0 -nosound -ovc lavc -o capture.avi'

# Add color
alias ls='pwd; ls -lh --color --group-directories-first'
alias la='ls -a' # Also show hidden files
alias lsd='ls /dev | grep sd'
alias grep='grep --color'


## Nano

# Nano creates backup when editing
alias nanob='nano -B -C /home/james/nano-backups'

# Open nano read-only
alias nanov='nano -v'

# Nano using line numbers
alias nanoc='nano -c'

# Copy with a progress bar
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'

# dc undoes cd! \o/
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
alias dc='popd'

# Aliases for safety
setopt RM_STAR_WAIT
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

## Torrent Box Aliases

# Shortcut to pull up rtorrent 'screen' session (Ctrl+AD to return)
#alias srt='stty stop undef; stty start undef; screen -dr rtorrent'

# Unless I'm using dtach instead. (Ctrl+\ to return)
alias drt='dtach -a /tmp/rtorrent.dtach'

# Start or kill LCD update daemon
alias lcdu='sudo start-stop-daemon --start --name LCDd.py --exec /home/james/Scripts/LCDd.py'
alias lcdd='sudo start-stop-daemon --stop --name LCDd.py'
alias lcdr='lcdd && lcdu'

# Install shit quicker.
alias agi='sudo apt-get install'
alias agui='sudo apt-get update && sudo apt-get install'
alias agu='sudo apt-get update && sudo apt-get upgrade'
alias agr='sudo apt-get remove'

##
## Keybinds
##

# Fix keybinds
bindkey '^K' kill-whole-line
bindkey "\e[1~" beginning-of-line	# Home (console)
bindkey "\e[H" beginning-of-line	# Home (xterm)
bindkey "\e[4~" end-of-line			# End (console)
bindkey "\e[F" end-of-line			# End (xterm)
bindkey "\e[2~" overwrite-mode		# Ins
bindkey "\e[3~" delete-char			# Delete

# Magic space!?
bindkey -M viins ' ' magic-space


##
## Completion Voodoo
##

# Color-coding
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

# Show ... while processing completion, so we know it's working
expand-or-complete-with-dots() {
  echo -n "\e[36m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

## That's all, folks!
