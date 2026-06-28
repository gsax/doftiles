function nix --description 'nix wrapper that tracks nix shell packages'
    if test "$argv[1]" = shell
        set -l pkgs
        for arg in $argv[2..-1]
            if string match -qr '^nixpkgs#' "$arg"
                set -a pkgs (string replace 'nixpkgs#' '' "$arg")
            end
        end

        set -l pkgs_str (string join ' ' $pkgs)

        set -l prev_data
        if test -n "$_FISH_NLVL_FILE" -a -f "$_FISH_NLVL_FILE"
            set prev_data (cat "$_FISH_NLVL_FILE")
        end

        set -l new_file (mktemp /tmp/fish_nix_lvl_XXXXXX)
        if test (count $prev_data) -gt 0
            printf '%s\n' $prev_data > "$new_file"
        end
        echo "$pkgs_str" >> "$new_file"

        set -lx _FISH_NLVL_FILE "$new_file"

        command nix $argv
        rm -f "$new_file"
    else
        command nix $argv
    end
end