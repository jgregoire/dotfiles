# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
eval "$(starship init zsh)"

# Load and initialise completion system
# zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# zstyle :compinstall filename '/home/james/.zshrc'
# zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

autoload -Uz compinit
compinit

bindkey -e

plug "Aloxaf/fzf-tab"
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

plug "zsh-users/zsh-syntax-highlighting"

# vi-mode by default
# bindkey -v

##
## Add directories to default PATH
##
pathdirs=(
	~/Scripts
    ~/.local/bin
)

# Now we make sure they exist before adding them
for dir in $pathdirs; do
	if [ -d $dir ]; then
		path+=$dir
	fi
done

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

alias fire='rpicam-still -n --timelapse=1000ms --datetime'

# Be more informative
alias which='which -a'

# Give up and start over
# by calling `$ git unfuck`
alias 'unfuck'='git reset --hard HEAD'

# systemd
alias ssc='sudo systemctl'
alias ssu='systemctl --user'

# ncmpcpp remote host
# I set MPD_HOST and MPD_PORT in .zprofile now.
# alias ncmp='ncmpcpp -h $MPD_HOST -p 6600'

# Music Syncing
#alias rsyncpm='rsync -av --size-only --force --del /home/james/Music/ /home/james/Marconi/Music/.'
alias rsyncpm='adbsync --del --show-progress push Music/Sync /storage/emulated/0/Music'
# alias rsyncpp='rsync -av --size-only /var/lib/mpd/playlists/ /home/james/Marconi/Music/.'
alias rsynccm='rsync -av --force --del james@heaviside.local:/media/pidrive/Music/. Music/. && tput bel'

# BEST ALIAS EVER
alias fucking='sudo'

# Add color
alias ls='ls -lh --color --group-directories-first'
alias la='ls -a' # Also show hidden files
alias lsd='ls /dev | grep sd'
alias grep='grep --color'

# Exa
alias exa='eza -l --group-directories-first --icons' # exa maintainer MIA.
alias exaa='exa -a'
alias exag='exa -a --git'
alias exat='exa -T'
alias exaat='exaa -T'

## Nano
# Nano using line numbers
alias nano='nano -c'

# Use neovim instead of vi
alias vi='nvim'

# Use neovim instead of vim
alias vim='nvim'

# Use nvim with user rc file for sudo. EDITOR set in .zprofile.
alias svi='sudoedit'

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

# Install shit quicker, apt edition
alias agi='sudo apt install --autoremove'
alias agu='sudo apt update && sudo apt-get upgrade'
alias agr='sudo apt remove --autoremove'

# Install shit quicker, pacman edition
alias pacman='pacman --color auto'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rsn'
alias pacsu='sudo pacman -Syyu'
alias pacc='sudo pacman -Sc'

# Install shit quicker, AUR edition
alias auri='makepkg -sic'

# Beets
alias bim='beet import'

# Volume control (pulse)
# e.g. '$ vol 50%'
alias vol='wpctl set-volume @DEFAULT_AUDIO_SINK@'

alias luamake='/home/james/Code/lua-language-server/3rd/luamake/luamake'

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

# WSL likes to start us somewhere besides the home directory. Fix that.
cd

# In WSL, jump to Windows home dir
alias cdh='cd /mnt/c/Users/jfg'

# load fzf
source <(fzf --zsh)

# That's all, folks!
