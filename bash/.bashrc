# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# vi_mod
set -o vi

#oh-my-posh
if [ ! -f /run/.containerenv ] || [ -z "$CONTAINER_ID" ]; then
eval "$(/opt/oh-my-posh/oh-my-posh init bash --config $HOME/.config/oh-my-posh/catppuccin_mocha.omp.json)"
fi

# helix
export HELIX_RUNTIME=~/.local/src/helix/runtime
# cargo
. "$HOME/.cargo/env"
# for devide .bashrc between local and the docker(ros)
if [ -f /run/.containerenv ] || [ -n "$CONTAINER_ID" ]; then
  if [ -f "/opt/ros/foxy/setup.bash" ]; then
    source /opt/ros/foxy/setup.bash
    source /opt/ros/noetic/setup.bash
    echo "ROS environment initialized inside the container"
  fi
fi

# daily use
# highlights in search/list
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# easier cd
alias no='cd ~/misc/notes'
alias blog='cd ~/misc/blog'
alias prj='cd ~/misc/projects'
alias mat='cd ~/misc/material'
alias down='cd ~/Downloads/'

# for a shortcut
alias za='zathura'

