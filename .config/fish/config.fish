# Fish syntax highlighting
# set -g fish_color_autosuggestion '555'  'brblack'
# set -g fish_color_cancel -r
# set -g fish_color_command --bold
# set -g fish_color_comment red
# set -g fish_color_cwd green
# set -g fish_color_cwd_root red
# set -g fish_color_end brmagenta
# set -g fish_color_error brred
# set -g fish_color_escape 'bryellow'  '--bold'
# set -g fish_color_history_current --bold
# set -g fish_color_host normal
# set -g fish_color_match --background=brblue
# set -g fish_color_normal normal
# set -g fish_color_operator bryellow
# set -g fish_color_param cyan
# set -g fish_color_quote yellow
# set -g fish_color_redirection brblue
# set -g fish_color_search_match 'bryellow'  '--background=brblack'
# set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
# set -g fish_color_user brgreen
# set -g fish_color_valid_path --underline
#

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

# if type -q exa
# 	alias ll "exa -l -g --icons"
# 	alias lla "ll -a"
# end
