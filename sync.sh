#!bin/bash
set -euo pipefail
IFS=$'\n\t'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo $1

if [[ $1 == "copy_from_existing" ]]; then
  cp "$HOME/.gemrc" "$DIR/source_files/.gemrc"
  cp "$HOME/.pryrc" "$DIR/source_files/.pryrc"
  cp "$HOME/.npmrc" "$DIR/source_files/.npmrc"
  cp "$HOME/.gitconfig" "$DIR/source_files/.gitconfig"
  cp "$HOME/.config/alacritty/alacritty.yml" "$DIR/source_files/alacritty.yml"
  cp "$HOME/.config/fish/config.fish" "$DIR/source_files/config.fish"
  cp "$HOME/.config/nvim/plugins.vim" "$DIR/source_files/plugins.vim"
  cp "$HOME/.config/nvim/init.vim" "$DIR/source_files/init.vim"
  cp "$HOME/.vim/coc-settings.json" "$DIR/source_files/coc-settings.json"
fi
