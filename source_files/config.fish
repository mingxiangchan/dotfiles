# disable fish greeting message
set fish_greeting

set --export EDITOR nvim
set --export GIT_EDITOR nvim
set --export VIMCONFIG $HOME/.vim
set -U fish_user_paths $HOME/.local/bin

alias be="bundle exec"
alias vim="nvim"
alias vi="nvim"
abbr gco='git checkout'
abbr gfm="git pull"
abbr gitkraken="env SHELL=/bin/bash gitkraken"
alias tb="taskbook"
alias todos="tb --list pending"
alias addtodos="tb -t @wip"

fish_vi_key_bindings
set -g theme_color_scheme terminal
function fish_greeting; end
set -g theme_display_ruby no

source ~/.asdf/asdf.fish

function ranger-cd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end
