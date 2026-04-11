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
  if [ -f "/opt/ros/noetic/setup.bash" ]; then
#    source /opt/ros/foxy/setup.bash
    source /opt/ros/noetic/setup.bash
    echo "ROS environment initialized inside the container"
  fi
fi

# This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Enable NVIDIA GLX offload in this distrobox for Gazebo/rviz GLX apps.
if [ -f /run/.containerenv ] || [ -n "B20-noetic" ]; then
  export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/nvidia/current${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
  export __NV_PRIME_RENDER_OFFLOAD=1
  export __GLX_VENDOR_LIBRARY_NAME=nvidia
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
alias temp='cd ~/misc/temp'
alias dot='cd ~/dotfiles'
alias pic='cd ~/Pictures'
# for a shortcut
alias za='zathura'
alias cal='calcurse'
alias lzg='lazygit'
alias lzd='lazydocker'
