# disable fish greeting message
set fish_greeting

set --export EDITOR nvim
set --export GIT_EDITOR nvim
set --export VIMCONFIG $HOME/.vim
set -U fish_user_paths $HOME/.local/bin
set -U fish_user_paths $HOME/.poetry/bin
set --export MANPAGER "nvim -c 'set ft=man' -"
set --export FZF_DEFAULT_COMMAND  'rg --files'
set fish_color_command --bold cyan

abbr -a gco 'git checkout'
abbr -a gfm "git pull"
abbr -a rcd 'ranger-cd'
abbr -a abd 'abduco'

alias be="bundle exec"
alias cmus='tmux attach-session -t cmus; or tmux new-session -A -D -s cmus "/usr/bin/cmus"'
alias vi="nvim"
alias vim="nvim"
alias cls="clear"
alias pr="poetry run"

fish_vi_key_bindings

function ranger-cd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

function vmux
  abduco -e '^g' -A $argv nvim
end

source ~/.asdf/asdf.fish
