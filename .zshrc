## Oh-My-Zsh stuff ##
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git gitfast git-flow python)
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

# systemd
alias ssc='sudo systemctl'

# ncmpcpp remote host
alias ncmp='ncmpcpp -h 192.168.0.102 -p 6600'

# Launch Oryx in root Opera session.
alias oryx='sudo opera https://configure.ergodox-ez.com/train 2>/dev/null'

# OnePlus Syncing
alias rsyncpm='rsync -av --size-only --force --del /home/james/Music/ /home/james/OnePlus/Internal\ shared\ storage/Music/.'
alias rsyncpp='rsync -av --size-only /var/lib/mpd/playlists/ /home/james/OnePlus/Internal\ shared\ storage/Music/.'

# BEST ALIAS EVER
alias fucking='sudo'

# Add color
alias ls='ls -lh --color --group-directories-first'
alias la='ls -a' # Also show hidden files
alias lsd='ls /dev | grep sd'
alias grep='grep --color'

# Exa
alias exa='exa -l --group-directories-first'
alias exaa='exa -a'
alias exag='exa -a --git'

## Nano
# Nano using line numbers
alias nano='nano -c'

# Nano creates backup when editing
alias nanob='nano -B -C /home/james/nano-backups'

# Open nano read-only
alias nanov='nano -v'

# Edit this file
alias nanoz='nano ~/.zshrc'

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
alias drt='dtach -a /home/james/.rtorrent.dtach'
alias drtu='sudo start-stop-daemon --start --chuid james --name rtorrent --exec /usr/bin/dtach -- -n /home/james/.rtorrent.dtach /usr/bin/rtorrent'
alias drtd='sudo start-stop-daemon --stop --name rtorrent'

# Install shit quicker, apt edition
alias agi='sudo apt-get install --autoremove'
alias agui='sudo apt-get update && sudo apt-get install'
alias agu='sudo apt-get update && sudo apt-get upgrade'
alias agr='sudo apt-get remove --autoremove'

# Install shit quicker, pacman edition
alias pacman='pacman --color always'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rsn'
alias pacsu='sudo pacman -Syyu'
alias pacc='sudo pacman -Sc'

# Install shit quicker, AUR edition
alias auri='makepkg -sic'

# Randomize wallpaper
alias rwp='feh --randomize --bg-fill /home/james/Pictures/Desktops/2560x1440'

# Beets
alias bimm='beet import -m'
alias bim='beet import'

# Volume control (pulse)
# e.g. '$ vol 50%'
alias vol='pactl set-sink-volume 1'

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

# This is the greatest program ever.
eval $(thefuck --alias)

# WSL likes to start us somewhere besides the home directory. Fix that.
cd

## That's all, folks!
