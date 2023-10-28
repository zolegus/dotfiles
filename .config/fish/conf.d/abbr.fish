# https://fishshell.com/docs/current/cmds/abbr.html
abbr :GoToCommand "nvim +GoToCommand"
abbr :GoToFile "nvim +GoToFile"
abbr :Grep "nvim +Grep"

#abbr ast "aw set -t (aw list | fzf-tmux -p --reverse --preview 'aw set -t {}')"
#abbr bc "brew cleanup"
#abbr bd "brew doctor"
abbr bi "brew install"
abbr bic "brew install --cask"
abbr bif "brew info"
abbr bifc "brew info --cask"
#abbr bo "brew outdated"
abbr bs "brew search"
abbr bup "brew update"
abbr bupg "brew upgrade"
abbr c clear
abbr cb "cargo build"
abbr cbr "cargo build --release"
abbr claer clear
abbr clera clear
abbr cdoc "cargo doc --open"
abbr ci "cargo install"
abbr cf "cargo fix"
abbr cr "cargo run"
abbr crr "cargo run --release"
abbr cup "cargo install-update -l"
abbr ct "cargo test"
abbr cx "chmod +x"
#abbr dc "docker compose"
#abbr dcd "docker compose down"
#abbr dcdv "docker compose down -v"
#abbr dcr "docker compose restart"
#abbr dcu "docker compose up -d"
#abbr dps "docker ps --format 'table {{.Names}}\t{{.Status}}'"
abbr e exit
#abbr ee "espanso edit"
#abbr er "espanso restart"
#abbr g "git status"
#abbr ga "git add ."
#abbr gb "git branch -v"
#abbr gc "git commit"
#abbr gca "git commit -av"
abbr gcl "git clone"
#abbr gco "git checkout -b"
#abbr gcom "~/bin/git-to-master-cleanup-branch.sh"
#abbr gd "nvim +DiffviewOpen"
#abbr gf "git fetch --all"
#abbr gl "git pull"
#abbr gma "git merge --abort"
#abbr gmc "git merge --continue"
#abbr gp "git push"
#abbr gpom "git pull origin main"
#abbr gpr "gh pr create"
#abbr gpum "git pull upstream master"
#abbr gr "git remote"
#abbr gra "git remote add"
#abbr grao "git remote add origin"
#abbr grau "git remote add upstream"
#abbr grv "git remote -v"
abbr gs "git status"
#abbr gst "git status"
abbr hd "history delete --exact --case-sensitive \'(history | fzf-tmux -p -m)\'"
#abbr kn "killall node"
abbr l "lsd  --group-dirs first -A"
#abbr ld lazydocker
abbr lg lazygit
#abbr ll "lsd  --group-dirs first -Al"
abbr ll "exa -l -g --icons"
abbr lld "exa -l -g -s=date --icons"
abbr llz "exa -l -g -s=size --icons"
abbr lla "exa -l -a -g --icons"
abbr llad "exa -l -a -g -s=date --icons"
abbr llaz "exa -l -a -g -s=size --icons"
abbr lt "lsd  --group-dirs last -A --tree"
abbr mm "termusic"
#abbr nb "npm run build"
#abbr nd "npm run dev"
abbr nf neofetch
#abbr ni "npm install"
#abbr nt "npm run test"
#abbr nxdg "nx dep-graph"
#abbr os "overmind start"
#abbr pb "pnpm build"
#abbr pd "pnpm dev"
abbr pfzf "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
#abbr pg "pnpm generate"
#abbr pi "pnpm install"
#abbr pw "pnpm web"
abbr rmr "rm -rf"
#abbr sa "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
#abbr sai "SwitchAudioSource -t input -s (SwitchAudioSource -t input -a | fzf-tmux -p --reverse)"
#abbr sao "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
#abbr sb "sam build"
abbr sf "source ~/.config/fish/config.fish"
abbr sfa "source ~/.config/fish/conf.d/abbr.fish"
abbr st "tmux source ~/.config/tmux/tmux.conf"
abbr t "tmux"
#abbr ta "tmux a"
abbr ta "tmux attach -t"
#abbr td "t dotfiles"
abbr tk "tmux kill-server"
abbr tl "tmux list-sessions"
abbr tr "tldr --list | fzf --header 'tldr (tealdeer)' --reverse --preview 'tldr {1} --color=always' --preview-window=right,80% | xargs tldr"
abbr tn "tmux new -s (basename (pwd))"
#abbr u "~/bin/update.sh"
abbr unset "set --erase"
abbr vfzf "nvim (fd --type f --hidden --follow --exclude .git | fzf-tmux -p -w 100 --reverse --preview 'bat --color=always --style=numbers --line-range=:500 {}')"
abbr va "nvim ~/.config/alacritty/alacritty.yml"
abbr vf "nvim ~/.config/fish/config.fish"
abbr vfa "nvim ~/.config/fish/conf.d/abbr.fish"
abbr vlf "nvim ~/.config/lf/lfrc"
abbr vt "nvim ~/.config/tmux/tmux.conf"
abbr vp "nvim package.json"
#abbr vpc "nvim +PlugClean"
#abbr vpi "nvim +PlugInstall"
#abbr vpu "nvim +PlugUpdate"
#abbr vpug "nvim +PlugUpgrade"
#abbr y yarn
#abbr ya "yarn add"
#abbr yad "yarn add -D"
#abbr yb "yarn build"
#abbr yd "yarn dev"
#abbr ye "yarn e2e"
#abbr yg "yarn generate"
#abbr yi "yarn install --frozen-lockfile"
#abbr yl "yarn lint"
#abbr yp "yarn plop"
#abbr ypm "yarn plop model"
#abbr ys "yarn server"
#abbr yt "yarn test"
#abbr yu "yarn ui"
#abbr yw "yarn web"
