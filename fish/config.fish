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
    abbr --add UG mosh -p 41400 gsx
    abbr --add UC mosh -p 41240 gsxcloud

    # don't show the banner for ffmpeg stuff
    alias ffmpeg 'ffmpeg -hide_banner'
    alias ffplay 'ffplay -hide_banner'
    alias ffprobe 'ffprobe -hide_banner'

    # we use nmap with capabilities, so we don't need root
    alias nmap 'nmap --privileged'

    ## system administration
    # change global config
    abbr --add nuc sudo -E vi \
        /etc/nixos/flake.nix \
        /etc/nixos/configuration.nix \
        /etc/nixos/hardware-configuration.nix
    # update config
    abbr --add nup sudo nixos-rebuild switch
    # upgrade system
    # abbr --add nus sudo nixos-rebuild switch --upgrade
    abbr --add nus "cd /etc/nixos && nix flake update"

    ## sync
    # get password database
    abbr --add PS rsync pc:Passwords/Passwords.kdbx /secrets/Passwords.kdbx
    # update videos
    abbr --add VU rsync -ruP pc:media/14/Videos/ ~/Videos/
    abbr --add VUD rsync -rP pc:media/14/Videos/ ~/Videos/
    # sync videos
    abbr --add VS rsync --delete -ruP pc:media/14/Videos/ ~/Videos/
    abbr --add VSD rsync --delete -rP pc:media/14/Videos/ ~/Videos/
    # update music
    abbr --add MU rsync -ruP pc:media/14/audio/ ~/Music/
    abbr --add MUD rsync -rP pc:media/14/audio/ ~/Music/
    # sync music
    abbr --add MS rsync --delete -ruP pc:media/14/audio/ ~/Music/
    abbr --add MSD rsync --delete -rP pc:media/14/audio/ ~/Music/

    # get help from cht.sh
    function cht
        curl https://cht.sh/$argv | less -R
    end

    # enable any-nix-shell
    # any-nix-shell fish --info-right | source

    # enable atuin
    # atuin init fish | source

    # enable zoxide
    zoxide init fish | source
end
