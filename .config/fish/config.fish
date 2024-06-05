starship init fish | source
zoxide init fish | source

# clang xtools
# fish_add_path /Library/Developer/CommandLineTools/usr/bin
# fish_add_path /Library/Developer/CommandLineTools/usr/lib
# fish_add_path /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib

# scripts path
fish_add_path ~/bin
# brew path
fish_add_path /usr/local/bin
# rust path
fish_add_path ~/.cargo/bin
# LLDB debugger
fish_add_path /usr/local/opt/llvm/bin
set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
# Solana
fish_add_path ~/.local/share/solana/install/active_release/bin

command -qv nvim && alias vim nvim

set -Ux EDITOR nvim
set -Ux PAGER /usr/local/bin/moar
set -Ux VISUAL nvim
set -Ux fish_greeting
set -Ux BAT_THEME Nord
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"

set -Ux FZF_DEFAULT_OPTS "--reverse"
set -Ux FZF_CTRL_R_OPTS "--reverse --border-label=' History: '"
set -Ux FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {}' --border \
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)'"
# --bind 'ctrl-e:execute(nvim -f <(cat {}) < /dev/tty > /dev/tty 2>&1)'"
set -Ux FZF_TMUX_OPTS "-p 80%,70%"
set -gx GPG_TTY (tty)

# set -x http_proxy http://127.0.0.1:1087; set -x https_proxy http://127.0.0.1:1087
load_ssh_keys

# if type -q exa
# 	alias ll "exa -l -g --icons"
# 	alias lla "ll -a"
# end
