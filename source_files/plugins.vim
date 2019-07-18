let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.vim/plugged')
" Basics
Plug 'scrooloose/nerdtree' "file navigation
Plug 'scrooloose/nerdcommenter' "comment lines/blocks
Plug 'tpope/vim-surround' "handle brackets, html tags

" Note taking
Plug 'Alok/notational-fzf-vim'

" Tmux Replacement
Plug 'christoomey/vim-tmux-navigator' "use ctrl-hjkl and sync with tmux

"Niceties
Plug 'sickill/vim-pasta' "paste from clipboard and respect indentation
Plug 'Yggdroot/indentLine' "show indent markers
Plug 'tpope/vim-abolish' "toggle words into camel/snake/underscore case
Plug 'simnalamburt/vim-mundo' "UI for navigating vim's branching undo history
Plug 'godlygeek/tabular' "align things with 2 sides, e.g. JSON colons
Plug 'AndrewRadev/splitjoin.vim' "split and join code blocks/bracketed content into multiple lines / 1 line
Plug 'szw/vim-maximizer'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Color
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim'

"Statusline
Plug 'vim-airline/vim-airline'

"General Language Utilities (syntax highlighting, autoformatting)
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale', {'for': ['elixir', 'ruby', 'python']}

"Plug 'zxqfl/tabnine-vim', {'for': ['ruby', 'python', 'javascript', 'elixir']}

"JS
Plug 'Galooshi/vim-import-js'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Python
Plug 'tmhedberg/SimpylFold'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rhysd/git-messenger.vim'

call plug#end()
