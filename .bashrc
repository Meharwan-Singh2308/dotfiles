# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
alias zed='/home/meharwansingh/.var/app/dev.zed.Zed/data/zed'
eval "$(starship init bash)"

# My custom alias
fzf_command() {
  local result=$(fzf)
  if [[ -n "$result" ]]; then
    # You can choose what to do with the selected result here
    nvim $result
  fi
}

bind -x '"\C-f": fzf_command'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
alias pdf="evince"
alias dsa="cd ~/Documents/DSA\ Practice/"
alias cfhypr="nvim ~/.config/hypr/hyprland.conf"
alias cfwaybar="nvim ~/.config/waybar/"
alias cfi="nvim ~/.config/i3/config"
alias cfn="nvim ~/.config/nvim/init.lua"

alias cfbash="nvim ~/.bashrc"
alias wiki="nvim -c VimwikiIndex"
alias playp="mpv --volume=60 --no-video --shuffle ~/Desktop/Punjabi\ Songs//"
alias playl="mpv --volume=50 --no-video --shuffle ~/Desktop/lofi/"
alias playe="mpv --volume=50 --no-video --shuffle ~/Desktop/english_songs/"
alias playk="mpv --volume=50 --no-video --shuffle ~/Desktop/kavishri"
alias tlauncher="java -jar ~/Downloads/TLauncher.v10/TLauncher.jar"
alias anime="ani-cli --dub"
alias yazi="~/yazi/target/release/yazi"
alias ytda='yt-dlp -f bestaudio -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
# alias yta='ytfzf -L "The text after the command ( yta )" | xargs mpv --volume=60 --no-video'
alias asdf="sudo dnf"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

yta() {
  local query="$*"
  ytfzf -L "$query" | xargs mpv --volume=60 --no-video
}

. "$HOME/.cargo/env"
