starship init fish | source
zoxide init fish | source

fish_add_path ~/bin
fish_add_path ~/.cargo/bin

command -qv nvim && alias vim nvim

set -Ux EDITOR nvim
# set -Ux PAGER /usr/local/bin/moar
set -Ux PAGER moar
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

