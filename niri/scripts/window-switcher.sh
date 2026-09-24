#!/usr/bin/env bash

export FZF_DEFAULT_OPTS=" \
	--color=fg:#f8f8f2,bg:#181a26,hl:#bd93f9 \
	--color=fg+:#f8f8f2,bg+:#44475a,hl+:#00fa3f \
	--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
	--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

echo -ne "\x1b]0;WINDOW-SWITCHER\x1b\\"
niri msg -j windows \
  | jq -r '.[] | "\(.app_id): \(.title) | \(.id)"' \
	| rg -v 'WINDOW-SWITCHER' \
	| fzf \
	| awk '{print $NF}' \
	| xargs -I % niri msg action focus-window --id "%"
