starship init fish | source
zoxide init fish | source
fish_add_path /usr/local/bin 
fish_add_path ~/.cargo/bin

set fish_greeting ""
if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end
alias g git
alias lg lazygit
alias t tmux
command -qv nvim && alias vim nvim

