# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "agnoster/agnoster-zsh-theme"
plug "olets/zsh-abbr"

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

# Create session aliases and shut up about it.
alias abr='abbr --session --force --quieter'

abr fire='rpicam-still -n --timelapse=1000ms --datetime'

# Give up and start over
# by calling `$ git unfuck`
abr 'git unfuck'='git reset --hard HEAD'
# abr unfuck='git reset --hard HEAD'

# systemd
abr ssc='sudo systemctl'
abr ssu='systemctl --user'

# ncmpcpp remote host
abr ncmp='ncmpcpp -h $MPD_HOST -p 6600'

# Music Syncing
#abr rsyncpm='rsync -av --size-only --force --del /home/james/Music/ /home/james/Marconi/Music/.'
abr rsyncpm='adbsync --del --show-progress push Music/ /storage/emulated/0/Music'
# abr rsyncpp='rsync -av --size-only /var/lib/mpd/playlists/ /home/james/Marconi/Music/.'
abr rsynccm='rsync -av --force --del james@192.168.0.102:/home/james/Music/. Music/. && tput bel'

# BEST ALIAS EVER
abr fucking='sudo'

# Add color
abr ls='ls -lh --color --group-directories-first'
abr la='ls -a' # Also show hidden files
abr lsd='ls /dev | grep sd'
abr grep='grep --color'

# Exa
abr exa='eza -l --group-directories-first --icons' # exa maintainer MIA.
abr exaa='exa -a'
abr exag='exa -a --git'
abr exat='exa -T'
abr exaat='exaa -T'

## Nano
# Nano using line numbers
abr nano='nano -c'

# Use neovim instead of vi
abr vi='nvim'
# Use neovim instead of vim
abr vim='nvim'
# Use nvim with user rc file for sudo
abr svi='sudoedit'


# dc undoes cd! \o/
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
abr dc='popd'

# Aliases for safety
setopt RM_STAR_WAIT
abr rm='rm -i'
abr mv='mv -i'
abr cp='cp -i'

## Torrent Box Aliases
abr drt='dtach -a /home/james/.rtorrent.dtach'
abr drtu='sudo start-stop-daemon --start --chuid james --name rtorrent --exec /usr/bin/dtach -- -n /home/james/.rtorrent.dtach /usr/bin/rtorrent'
abr drtd='sudo start-stop-daemon --stop --name rtorrent'

# Install shit quicker, apt edition
abr agi='sudo apt-get install --autoremove'
abr agu='sudo apt-get upgrade --update'
abr agr='sudo apt-get remove --update --autoremove'

# Install shit quicker, pacman edition
abr pacman='pacman --color auto'
abr pacs='sudo pacman -S'
abr pacr='sudo pacman -Rsn'
abr pacsu='sudo pacman -Syyu'
abr pacc='sudo pacman -Sc'

# Install shit quicker, AUR edition
abr auri='makepkg -sic'

# Randomize wallpaper
abr rwp='feh --randomize --bg-fill /home/james/Pictures/Desktops/21x9/3440x1440'

# Beets
abr bim='beet import'

# Volume control (pulse)
# e.g. '$ vol 50%'
abr vol='pactl set-sink-volume 1'

abr luamake=/home/james/Code/lua-language-server/3rd/luamake/luamake

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

# That's all, folks!
