if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Basics
Plug 'tpope/vim-sensible'
Plug 'matze/vim-move'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'

"Niceties
Plug 'tmhedberg/matchit'
Plug 'easymotion/vim-easymotion'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'slashmili/alchemist.vim'
Plug 'godlygeek/tabular'

" Color
Plug 'dikiaap/minimalist'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'KeitaNakamura/neodark.vim'
Plug 'AlessandroYorba/Sidonia'
Plug 'arcticicestudio/nord-vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'joshdick/onedark.vim'

"Statusline
Plug 'vim-airline/vim-airline'

" language or filetype specific
Plug 'vim-ruby/vim-ruby',          { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rails',            { 'for': ['ruby', 'eruby'] }
Plug 'nelstrom/vim-markdown-folding',{ 'for': 'markdown' }
Plug 'tpope/vim-markdown'
Plug 'elixir-lang/vim-elixir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'keith/swift.vim'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'kchmck/vim-coffee-script'
Plug 'pearofducks/ansible-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/gitv'

" Others
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'neomake/neomake'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/devdocs.vim'
Plug 'kana/vim-textobj-user'
Plug 'andyl/vim-projectionist-elixir'
Plug 'andyl/vim-textobj-elixir'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'Shougo/echodoc.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'suan/vim-instant-markdown'
Plug 'isRuslan/vim-es6'
Plug 'justinj/vim-react-snippets'
Plug 'greyblake/vim-preview'
Plug 'benmills/vimux'
Plug 'spiegela/vimix'
Plug 'jkramer/vim-checkbox'
Plug 'mklabs/split-term.vim'
Plug 'w0rp/ale'
call plug#end()

colorscheme onedark
if has("termguicolors")
    set termguicolors
endif

let mapleader = "\<Space>"
" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number

" disable swapfiles, use Git!
set noswapfile

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
set foldlevel=1


let $FZF_DEFAULT_COMMAND="ack -l ''"
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-P> :FZF<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <Leader><Leader>u :MundoToggle<CR>
nnoremap <Leader>dd :DevDocs<Space>
nnoremap <Leader>DD :DevDocs <C-r><C-w><CR>
nnoremap <Leader>rt  :VimuxRunCommand<Space>
nnoremap <Leader>rr  :VimuxRunLastCommand<CR>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <Leader>jj :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'spring_night'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_refresh_delay = 50
let g:NERDTreeChDirMode = 2
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:mundo_prefer_python3 = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ruby = ['omni']
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:ale_lint_on_text_changed = 'normal'
"let g:neomake_open_list=2
"let g:neomake_elixir_enabled_makes=['credo']
"let g:neomake_javascript_enabled_makers = ['eslint']
set completeopt-=preview
"autocmd! BufWritePost * Neomake
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:jsx_ext_required = 0
let g:indentLine_color_gui = '#5b5e73'
let g:indentLine_char = '¦'
let g:vimix_map_keys = 1
let g:vimwiki_foldings='list'
"autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
nmap <buffer> <C-c><C-c> <Plug>(xmpfilter-run)
xmap <buffer> <C-c><C-c> <Plug>(xmpfilter-run)
imap <buffer> <C-c><C-c> <Plug>(xmpfilter-run)

nmap <buffer> <C-c><C-v> <Plug>(xmpfilter-mark)
xmap <buffer> <C-c><C-v> <Plug>(xmpfilter-mark)
imap <buffer> <C-c><C-v> <Plug>(xmpfilter-mark)
