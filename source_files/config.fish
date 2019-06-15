# disable fish greeting message
set fish_greeting

set --export EDITOR nvim
set --export GIT_EDITOR nvim
set --export VIMCONFIG $HOME/.vim
set -U fish_user_paths $HOME/.local/bin
set --export MANPAGER "nvim -c 'set ft=man' -"
#set --export FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set --export FZF_DEFAULT_COMMAND  'rg --files'

abbr -a gco 'git checkout'
abbr -a gfm "git pull"
abbr -a gitkraken "env SHELL /bin/bash gitkraken"
abbr -a prpm 'poetry run python manage.py'
abbr -a rcd 'ranger-cd'
abbr -a mucks "~/Desktop/utils/mucks/mucks ~/muckssrc"
abbr -a mux "tmuxp load ~/tmuxp/"
alias atodos="tb -t @wip"
alias be="bundle exec"
alias cmus='tmux attach-session -t cmus; or tmux new-session -A -D -s cmus "/usr/bin/cmus"'
alias dokku="bash $HOME/.dokku/contrib/dokku_client.sh"
alias gst="git status"
alias todos="tb --list pending wip"
alias vi="nvim"
alias vim="nvim"
alias cls="clear"


fish_vi_key_bindings
set -g theme_color_scheme terminal
function fish_greeting; end
set -g theme_display_ruby no

function ranger-cd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end
source ~/.asdf/asdf.fish
