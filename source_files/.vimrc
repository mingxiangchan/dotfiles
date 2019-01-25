if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Basics
Plug 'scrooloose/nerdtree' "file navigation
Plug 'scrooloose/nerdcommenter' "comment lines/blocks
Plug 'tpope/vim-surround' "handle brackets, html tags
Plug 'djoshea/vim-autoread' "autoread from file if changed from outside vim
Plug 'takac/vim-hardtime' "prevent repeating hjkl and arrows
Plug 'Konfekt/FastFold'

"Niceties
Plug 'christoomey/vim-tmux-navigator' "use ctrl-hjkl and sync with tmux
Plug 'sickill/vim-pasta' "paste from clipboard and respect indentation
Plug 'Yggdroot/indentLine' "show indent markers
Plug 'tpope/vim-abolish' "toggle words into camel/snake/underscore case
Plug 'simnalamburt/vim-mundo' "UI for navigating vim's branching undo history
Plug 'godlygeek/tabular' "align things with 2 sides, e.g. JSON colons
Plug 'AndrewRadev/splitjoin.vim' "split and join code blocks/bracketed content into multiple lines / 1 line
Plug 'kana/vim-textobj-user' "req from vim-rails
Plug 'justinmk/vim-sneak' "easy navigation

" Color
Plug 'hzchirs/vim-material'

"Statusline
Plug 'vim-airline/vim-airline'

"General Language Utilities (syntax highlighting, autoformatting)
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'powerman/vim-plugin-AnsiEsc' "req from lsp
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'zxqfl/tabnine-vim'

"Ruby/Elixir
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

"JS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Galooshi/vim-import-js'

"Python
Plug 'tmhedberg/SimpylFold'
Plug 'bfredl/nvim-ipy'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'

" Misc
Plug 'vimwiki/vimwiki'
call plug#end()

" Palenight
if has("termguicolors")
  set termguicolors
  set t_Co=256
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
endif


autocmd ColorScheme * hi SneakLabel cterm=bold ctermfg=15 ctermbg=4 gui=bold guifg=white guibg=Black
let g:hardtime_default_on = 1

"autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
colorscheme vim-material
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:NERDTreeChDirMode = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'material'
let g:airline#extensions#ale#enabled = 1
"let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript.tsx': ['tslint'],
\   'typescript': ['tslint'],
\   'javascript': ['eslint'],
\   'json': ['fixjson'],
\   'ruby': ['rufo'],
\   'python': ['black']
\}
let g:ale_linters = {
\   'typescript.tsx': ['tslint', 'tsserver'],
\   'typescript': ['tslint', 'tsserver'],
\   'javascript': ['eslint'],
\   'json': ['fixjson', 'jsonlint'],
\   'ruby': ['rubocop', 'solargraph'],
\   'python': ['pycodestyle']
\}
let g:ale_set_signs = 0
hi link ALEErrorLine ErrorMsg
hi link ALEWarningLine WarningMsg
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:autoformat_autoindent = 0
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_retab = 0
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
let mapleader = "\<Space>"
let g:sneak#label = 1
let g:hardtime_ignore_quickfix = 1
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <C-F> :Fzf
nnoremap <C-P> :FZF<CR>
nnoremap <Leader>ft :FzfTags<CR>
nnoremap <Leader>fl :FzfLines<CR>
nnoremap <Leader>ff :FzfAg
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader><Leader>f :NERDTreeFind<CR>
nnoremap <Leader><Leader>u :MundoToggle<CR>
nnoremap <Leader><Leader>i :ImportJSFix<CR>
nnoremap <silent> <F1> :Twiggy<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>dd :!xdg-open "https://devdocs.io"<CR><CR>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap Q <Nop>
nnoremap W <Nop>
nnoremap gd :ALEGoToDefinitionInTab<cr>
nnoremap gh :ALEHover<cr>

set background=dark
set clipboard=unnamedplus
set cmdheight=2
set expandtab
set foldlevel=1
set hlsearch
set foldmethod=syntax
set linebreak
"set nohlsearch
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
" prevent auto opening preview menu on autocomplete
set completeopt-=preview

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
