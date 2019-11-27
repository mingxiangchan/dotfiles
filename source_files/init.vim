scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ============================================================================ "
" ColorScheme
" ============================================================================ "
if (has("termguicolors"))
  set termguicolors
endif

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

let g:material_terminal_italics = 1
let g:material_theme_style = 'dark'
set background=dark
colorscheme material

" ============================================================================ "
" Editor Settings
" ============================================================================ "

let mapleader = "\<Space>"
set clipboard=unnamedplus
"set cmdheight=2
set expandtab
set foldmethod=syntax
set foldlevel=1
"set hlsearch
set nohlsearch
set nolist
set number
set relativenumber
set shiftwidth=2
set smartcase
set t_ut=
set tabstop=2
set textwidth=0
set wrap
set wrapmargin=0
set completeopt-=preview
set shortmess+=c
" Automatically re-read file if a change was detected outside of vim
set autoread

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

autocmd ColorScheme * hi SneakLabel cterm=bold ctermfg=15 ctermbg=4 gui=bold guifg=white guibg=Black
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx

" ============================================================================ "
" FZF
" ============================================================================ "

let g:fzf_command_prefix = 'Fzf'

" ============================================================================ "
" NERDTree
" ============================================================================ "
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowMinimalUI = 1

" ============================================================================ "
" ALE
" ============================================================================ "
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'ruby': ['rufo'],
\   'python': ['black'],
\}

" ============================================================================ "
" Airline
" ============================================================================ "
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview = 1
let g:airline_theme = 'hybridline'
let g:NERDTreeStatusLine = ''


" ============================================================================ "
" IndentLine
" ============================================================================ "
let g:indentLine_char = '¦'
let g:indentLine_color_gui = '#5b5e73'

" ============================================================================ "
" Coc
" ============================================================================ "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set shortmess+=c
set updatetime=300

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

nmap <leader>rn <Plug>(coc-rename)
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Format :call CocAction('format')
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ============================================================================ "
" Misc
" ============================================================================ "
"
let g:nv_default_extension = '.md'
let g:nv_search_paths = ['/home/mingxiangchan/wiki']
let g:nv_include_hidden = 1
let g:nv_use_ignore_files = 0
let g:nv_use_short_pathnames=1
let g:used_javascript_libs = 'react,ramda'
" Highlight jsx even in non .jsx files
let g:jsx_ext_required = 0
let g:mundo_prefer_python3 = 1
let g:tagbar_autofocus = 1
let g:sneak#label = 1

" ============================================================================ "
" KeyMappings
" ============================================================================ "

nnoremap <C-T> :tabnew <CR>:te<CR>i
nnoremap <C-F> :Fzf
nnoremap <C-P> :FZF<CR>
nnoremap <Leader>ft :FzfTags<CR>
nnoremap <Leader>fl :FzfLines<CR>
nnoremap <Leader>ff :FzfAg
"nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :CocCommand explorer<CR>
"nnoremap <Leader><Leader>f :NERDTreeFind<CR>
nnoremap <Leader><Leader>u :MundoToggle<CR>
nnoremap <Leader><Leader>i :ImportJSFix<CR>
nnoremap <silent> <F1> :Twiggy<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>dd :!xdg-open "https://devdocs.io"<CR><CR>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap Q <Nop>
nnoremap W <Nop>
cmap w!! w !sudo tee %
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif