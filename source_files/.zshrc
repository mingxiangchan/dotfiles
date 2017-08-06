#! /bin/zsh
ZGEN_PREZTO_LOAD_DEFAULT=false
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
source "${HOME}/.zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"
    # prezto options
    zgen prezto editor key-bindings 'vi'
    zgen prezto editor dot-expansion 'yes'

    zgen prezto prompt theme 'pristine'
    zgen prezto terminal auto-title 'yes'
    zgen prezto utility:ls color 'yes'
    zgen prezto syntax-highlighting color 'yes'
    zgen prezto syntax-highlighting highlighters 'main' 'brackets'

    # prezto and modules
    zgen prezto
    zgen prezto environment
    zgen prezto utility
    zgen prezto terminal
    zgen prezto editor
    zgen prezto history
    zgen prezto directory
    zgen prezto spectrum
    zgen prezto completion                     # must be loaded after utility
    zgen prezto archive                        # lsarchive and unarchive commands
    zgen prezto git                            # git aliases
    zgen prezto ruby
    zgen prezto node
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto history-substring-search
    zgen prezto autosuggestions

    # plugins
    zgen load djui/alias-tips
    zgen load rimraf/k

    zgen load unixorn/tumult.plugin.zsh
    zgen load sharat87/pip-app
    zgen load peterhurford/git-it-on.zsh
    zgen load unixorn/git-extra-commands
    zgen load paulirish/git-open

    zgen prezto prompt          # prompt must be the last module to load
    zgen save                   # save all to init script
fi

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

bindkey -s '^O' 'ranger-cd\n'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_TMUX=1
export EDITOR=nvim
alias be="bundle exec"
alias vim="nvim"
