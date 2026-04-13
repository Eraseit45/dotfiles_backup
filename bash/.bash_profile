# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi


# fcitx5 input method configuration
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export GLFW_IM_MODULE=fcitx5

# xdg-desktop-portal-termfilechooser
export XDG_CURRENT_DESKTOP=i3
#. "$HOME/.cargo/env"
export PATH="/usr/local/go/bin:/usr/sbin:$HOME/.local/bin:$PATH"
