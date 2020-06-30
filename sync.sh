#!bin/bash
set -euo pipefail
IFS=$'\n\t'

# neovim
# ranger
# git-delta
# nvr (via pip -> neovim-remote)
# fzf
# ripgrep
# abduco
# fish
# ohmyfish -> spacefish

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source_files_map=(
    ".gemrc"
    ".pryrc"
    ".npmrc"
    ".gitconfig"
    ".vim/coc-settings.json"
    ".config/alacritty/alacritty.yml"
    ".config/nvim/plugins.vim"
    ".config/nvim/init.vim"
    ".config/fish/config.fish"
)

source_files_path() {
    filename=$(basename "$HOME/$1")
    echo "$DIR/source_files/$filename"
}


if [[ $1 == "copy_from_existing" ]]; then
    for filepath in ${source_files_map[@]}; do
        origin="$HOME/$filepath"
        destination=$(source_files_path $filepath)
        cp $origin $destination
        echo "Copied $filepath"
    done
fi

if [[ $1 == "symlink_source_files" ]]; then
    for filepath in ${source_files_map[@]}; do
        origin=$(source_files_path $filepath)
        destination="$HOME/$filepath"
        rm -f $destination
        ln -s $origin $destination
        echo "Symlinked $filepath"
    done
fi



