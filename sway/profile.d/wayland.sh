#!/bin/sh

if [ -z $DISPLAY ] && [ $(tty) = "/dev/tty1" ]; then
	# Session
	export XDG_SESSION_TYPE=wayland
	export XDG_SESSION_DESKTOP=sway
	export XDG_CURRENT_DESKTOP=sway
	export XDG_SESSION_CLASS=user

	# XDG Dirs
	export XDG_CONFIG_HOME=/home/gsx/.config
	export XDG_CACHE_HOME=/home/gsx/.cache
	export XDG_DATA_HOME=/home/gsx/.local/share
	export XDG_STATE_HOME=/home/gsx/.local/state
	export XDG_RUNTIME_DIR=/run/user/1000
	export XDG_DATA_DIRS=/home/gsx/.local/share:/usr/local/share:/usr/share

	# Use GPG-agent for ssh keys
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

	# Wayland stuff
	export MOZ_ENABLE_WAYLAND=1
	export QT_QPA_PLATFORM=wayland
	export CLUTTER_BACKEND=wayland
	export SDL_VIDEODRIVER=wayland
	export _JAVA_AWT_WM_NONREPARENTING=1

	exec sway $@
fi

