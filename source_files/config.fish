# disable fish greeting message
set fish_greeting

set --export EDITOR nvim
set --export GIT_EDITOR nvim

alias be="bundle exec"
alias vim="nvim"

fish_vi_key_bindings
set -g theme_color_scheme terminal2
function fish_greeting; end
