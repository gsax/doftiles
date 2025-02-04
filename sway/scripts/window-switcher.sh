#!/usr/bin/env bash

export FZF_DEFAULT_OPTS=" \
	--color=fg:#f8f8f2,bg:#181a26,hl:#bd93f9 \
	--color=fg+:#f8f8f2,bg+:#44475a,hl+:#00fa3f \
	--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
	--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

echo -ne "\x1b]0;WINDOW-SWITCHER\x1b\\"
swaymsg -t get_tree \
        | jq -r 'recurse(.nodes[]?)|recurse(.floating_nodes[]?)|select(.type=="con"),select(.type=="floating_con")|(.id|tostring)+" "+.app_id+": "+.name' \
        | rg -v '^[0-9]* : $' \
        | rg -v 'WINDOW-SWITCHER' \
				| fzf \
				| awk '{print $1}' \
				| xargs -I % swaymsg '[con_id="%"] focus'
