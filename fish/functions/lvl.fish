function lvl --description 'Display nested nix shell packages'
    if test -z "$_FISH_NLVL_FILE" -o ! -f "$_FISH_NLVL_FILE"
        return
    end

    set -l lines (cat "$_FISH_NLVL_FILE")
    set -l depth (count $lines)
    if test $depth -eq 0
        return
    end

    echo -n (set_color yellow)(string repeat -n $depth '(')

    set -l first true
    for line in $lines
        if test -n "$line"
            if test $first = true
                echo -n (set_color blue)$line
                set first false
            else
                echo -n (set_color blue)" $line"
            end
        end
        echo -n (set_color yellow)')'
    end

    echo -n (set_color normal)
end
