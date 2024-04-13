function nvim-chad
    env NVIM_APPNAME=nvim-chad nvim $argv
end

function nvim-astro
    env NVIM_APPNAME=nvim-astro nvim $argv
end

function nvim-scratch
    env NVIM_APPNAME=nvim-scratch nvim $argv
end

function nvim-go
    env NVIM_APPNAME=nvim-go nvim $argv
end

function nvim-mini
    env NVIM_APPNAME=nvim-mini nvim $argv
end

function nvim-lunar
    env NVIM_APPNAME=nvim-lunar nvim $argv
end

function nvims
    set items nvim-astro nvim-chad nvim-scratch nvim-go nvim-mini nvim-lunar
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = "default" ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

bind \ca nvims
