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
Plug 'scrooloose/nerdcommenter' "comment lines/blocks
Plug 'tpope/vim-surround' "handle brackets, html tags

" Tmux Replacement
Plug 'christoomey/vim-tmux-navigator' "use ctrl-hjkl and sync with tmux

"Niceties
Plug 'sickill/vim-pasta' "paste from clipboard and respect indentation
Plug 'Yggdroot/indentLine' "show indent markers
Plug 'simnalamburt/vim-mundo' "UI for navigating vim's branching undo history
Plug 'godlygeek/tabular' "align things with 2 sides, e.g. JSON colons
Plug 'szw/vim-maximizer' "maximize or minimize current buffer 
Plug 'junegunn/vim-peekaboo' "show registers when press @ or ctrl+r

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Color and StatusLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim'

"General Language Utilities (syntax highlighting, autoformatting)
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale', {'for': ['elixir', 'ruby', 'python']}

"JS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Python
Plug 'tmhedberg/SimpylFold'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

"Coc
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
