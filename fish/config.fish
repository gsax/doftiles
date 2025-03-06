if status is-interactive
    # set umask
    umask 0077

    # disable greeting
    set -U fish_greeting

    # support colors in less
    set -gx LESS_TERMCAP_mb \e'[01;31m'
    set -gx LESS_TERMCAP_md \e'[01;31m'
    set -gx LESS_TERMCAP_me \e'[0m'
    set -gx LESS_TERMCAP_se \e'[0m'
    set -gx LESS_TERMCAP_so \e'[04;30;32m'
    set -gx LESS_TERMCAP_ue \e'[0m'
    set -gx LESS_TERMCAP_us \e'[01;32m'
    set -gx GROFF_NO_SGR 1
    # use less for colorfull manpages
    # set -gx MANPAGER "less -M -R -i --use-color -Dd+R -Du+B -DHkC -j5"

    # Aliases
    # remove the l alias for ls -alh
    functions --erase l
    # ls
    alias ls 'ls -F --color=auto --time-style=long-iso'
    alias ll 'ls -l'
    alias la 'ls -a'
    alias lla 'ls -la'
    alias llh 'ls -lh'

    # tree
    alias tree 'tree -FC'

    # calendar
    alias cal 'khal calendar'

    # uberspace connections
    alias uber-cloud 'mosh -p 41240 gsxcloud'
    alias uber-gsx 'mosh -p 41400 gsx'

    # don't show the banner for ffmpeg stuff
    alias ffmpeg 'ffmpeg -hide_banner'
    alias ffplay 'ffplay -hide_banner'
    alias ffprobe 'ffprobe -hide_banner'

    # get help from cht.sh
    function cht
        curl https://cht.sh/$argv | less -R
    end

    # enable any-nix-shell
    any-nix-shell fish --info-right | source

    # enable atuin
    atuin init fish | source
end
