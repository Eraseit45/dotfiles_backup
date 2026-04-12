export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export XDG_SESSION_TYPE=x11

picom --config ~/.config/picom/picom.conf &

feh --bg-scale ~/Pictures/wallpapers/iceland-wallpaper.jpg&

xremap ~/.config/xremap/config.yml &

fcitx5 &

exec i3
