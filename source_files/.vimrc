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
Plug 'w0rp/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tagprefix'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

"ctags
Plug 'majutsushi/tagbar'

"Ruby/Elixir
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" JS
Plug 'galooshi/vim-import-js'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'

Plug 'vimwiki/vimwiki'
Plug 'kana/vim-textobj-user'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/Colorizer'
call plug#end()

" Palenight
if has("termguicolors")
  set termguicolors
  set t_Co=256
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
endif

autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufWritePre * %s/\s\+$//e
colorscheme vim-material
let g:wiki_root = '~/wiki'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:NERDTreeChDirMode = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'material'
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rufo'],
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:autoformat_autoindent = 0
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_retab = 0
let g:autotagTagsFile=".git/tags"
let g:cm_refresh_default_min_word_len=1
let g:formatters_ruby = ["rubocop"]
let g:fzf_command_prefix = 'Fzf'
let g:indentLine_char = '¦'
let g:indentLine_color_gui = '#5b5e73'
let g:jsx_ext_required = 0
let g:material_style='palenight'
let g:mundo_prefer_python3 = 1
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:tagbar_autofocus = 1
let g:vimwiki_foldings='expr'
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['tcp://127.0.0.1:2089'],
  \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
  \ 'ruby': ['solargraph', 'stdio']
  \ }
let mapleader = "\<Space>"

inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <C-T> :TagbarToggle<CR>
nnoremap <C-F> :Fzf
nnoremap <C-P> :FZF<CR>
nnoremap <Leader>ft :FzfTags<CR>
nnoremap <Leader>ff :FzfAg
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader><Leader>f :NERDTreeFind<CR>
nnoremap <Leader><Leader>u :MundoToggle<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <F1> :Twiggy<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit %<CR>
nnoremap <Leader>gd :Gdiff

nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>dd :!xdg-open "https://devdocs.io"<CR><CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap Q <Nop>
nnoremap W <Nop>

set background=dark
set clipboard=unnamedplus
set cmdheight=2
set expandtab
set foldlevel=1
set foldmethod=syntax
set linebreak
set nohlsearch
set nolist
set noswapfile
set number
set relativenumber
set shiftwidth=2
set smartcase
set t_ut=
set tabstop=2
set textwidth=0
set wrap
set wrapmargin=0

"ncm2 config
set shortmess+=c
set completeopt=noinsert,menuone,noselect

" remap navigation to be based on screen lines instead of file lines
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
