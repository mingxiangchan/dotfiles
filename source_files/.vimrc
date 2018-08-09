if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Basics
Plug 'matze/vim-move'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-abolish'
Plug 'djoshea/vim-autoread'

"Niceties
Plug 'tmhedberg/matchit'
Plug 'easymotion/vim-easymotion'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'

" Color
Plug 'hzchirs/vim-material'

"Statusline
Plug 'vim-airline/vim-airline'

"General Language Utilities (syntax highlighting, autoformatting)
Plug 'sheerun/vim-polyglot'
Plug 'chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'

"Ruby/Elixir
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" JS
Plug 'galooshi/vim-import-js'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/gitv'

"Plug 'neomake/neomake'
Plug 'vimwiki/vimwiki'
Plug 'kana/vim-textobj-user'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/Colorizer'
call plug#end()

" Palenight
let g:material_style='palenight'
set background=dark
colorscheme vim-material
if has("termguicolors")
  set termguicolors
  set t_Co=256
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let mapleader = "\<Space>"
" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number

" disable swapfiles, use Git!
set noswapfile
set t_ut=

" Basic Formatting
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set tabstop=2
:set shiftwidth=2
set expandtab
" Search settings
set ignorecase
set smartcase
set incsearch
set nohlsearch
" Use system clipboard
set clipboard=unnamedplus
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set foldmethod=syntax
set foldlevel=5
set autoread

let $FZF_DEFAULT_COMMAND="ack -l ''"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'material'
let g:NERDTreeChDirMode = 2
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:mundo_prefer_python3 = 1
let g:ale_lint_on_text_changed = 'normal'
set completeopt-=preview
let g:jsx_ext_required = 0
let g:indentLine_color_gui = '#5b5e73'
let g:indentLine_char = '¦'
let g:vimwiki_foldings='expr'
let g:cm_refresh_default_min_word_len=1
let b:ale_linters = ['eslint']

au BufWrite * :Autoformat
let g:formatters_ruby = ["rubocop"]
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"disable entering Ex mode
:nnoremap Q <Nop>
:nnoremap W <Nop>

let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-P> :FZF<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <Leader><Leader>u :MundoToggle<CR>
nnoremap <Leader><Leader>f :NERDTreeFind<CR>
nnoremap <Leader>dd :!xdg-open "https://devdocs.io"<CR><CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
