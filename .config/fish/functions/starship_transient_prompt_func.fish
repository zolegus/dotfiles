# function starship_transient_prompt_func
#   # starship module character
#   # starship module directory
#   # starship module custom.transient_info
# end

function starship_transient_prompt_func
    set full_path (string replace $HOME "~" $PWD)
    set current_branch (git branch --show-current 2>/dev/null)
    set time_str (date "+%H:%M")

    set duration_ms $CMD_DURATION

    if test -n "$duration_ms"
        set duration_sec (math --scale=1 "$duration_ms / 1000")
        set duration_str "$duration_sec""s"
    else
        set duration_str ""
    end

    set_color --bold 'f5c2e7'
    echo -n ""
    set_color --background='f5c2e7'
    set_color --bold '11111b'
    echo -n " $USER@"(hostname)" "
    set_color normal

    set_color 'f5c2e7'
    echo -n ""
    set_color --background='cba6f7'
    set_color '11111b'
    echo -n ""
    set_color --background='cba6f7'
    set_color --bold '11111b'
    echo -n " $full_path "
    set_color normal

    if test -n "$current_branch"
        set_color 'cba6f7'
        echo -n ""
        set_color --background='a6e3a1'
        set_color '11111b'
        echo -n ""
        set_color --background='a6e3a1'
        set_color --bold '11111b'
        echo -n " $current_branch "
        set_color normal
    end

    set_color (test -n "$current_branch"; and echo 'a6e3a1'; or echo 'cba6f7')
    echo -n ""
    set_color --background='fab387'
    set_color '11111b'
    echo -n ""
    set_color --background='fab387'
    set_color --bold '11111b'
    if test -n "$duration_str"
        echo -n " $time_str ⏱ $duration_str "
    else
        echo -n " $time_str "
    end
    set_color normal

    set_color 'fab387'
    echo -n ""
    set_color normal
    echo ""

    set_color --bold 'f38ba8'
    echo -n "❯ "
    set_color normal
end

