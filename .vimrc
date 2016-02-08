" ----- Initialize Plugins -----

call plug#begin('~/.vim/plugged')

" Syntax
Plug 'tpope/vim-git'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'gavocanov/vim-js-indent'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'StanAngeloff/php.vim'
Plug 'pearofducks/ansible-vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'jwalton512/vim-blade'
Plug 'wizicer/vim-jison'

" Actual Plugins
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
"Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'christoomey/vim-tmux-runner'
"Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'gorkunov/smartpairs.vim'
"Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sleuth'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'airblade/vim-gitgutter'
Plug 'takac/vim-hardtime'
Plug 'xolox/vim-misc'
Plug 'shuber/vim-promiscuous'
Plug 'diepm/vim-rest-console'
Plug 'justinmk/vim-sneak'
Plug 'kurkale6ka/vim-pairs'
Plug 'suan/vim-instant-markdown'
Plug 'ervandew/supertab'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/Colorizer'

call plug#end()


" ----- General Config -----

autocmd!
filetype off

" Enable per-file indenting and highlighting
set nocompatible
filetype plugin indent on
syntax on
set background=dark

" Stop vim dying with long lines
set synmaxcol=250

" Show relative line numbers
set number
set relativenumber

" Linebreaking options
set linebreak
set textwidth=100
set backspace=indent,eol,start

" Jump to matching bracket when closing
set showmatch

" Flash screen instead of audible error bell
set visualbell

" Options for searching in files
set nohlsearch
set smartcase
set ignorecase
set incsearch
set gdefault

" Indenting options
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set shiftround

" Automatically write and read
set autowriteall
set autoread

" Show cursor position in statusbar
set ruler

" Undo
if exists("&undodir")
  set undofile
  let &undodir=&directory
  set undolevels=500
  set undoreload=500
endif

" Show status bar at all times
set laststatus=2

" Use system clipboard by default
set clipboard^=unnamed

" Rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable spellcheck
set spelllang=en_us
syntax spell toplevel

" Disable backups and swap
set nobackup
set nowritebackup
set noswapfile

" Disable comment prefix after newline
" autocmd FileType * setlocal formatoptions-=r formatoptions-=o


" ----- Filetype-Specific Config -----

" Make php use 4 spaces for tabs
"autocmd FileType php setlocal shiftwidth=4 tabstop=4

" Custom handling of blade templates
"autocmd FileType blade setlocal ft=html syntax=blade shiftwidth=2 tabstop=2

" Custom handling of typescript
"autocmd FileType typescript setlocal shiftwidth=4 tabstop=4

" Make jison use 4 spaces for tabs
"autocmd FileType yacc setlocal shiftwidth=4 tabstop=4

" Automatically set marks for certain files and filetypes
autocmd BufLeave *.scss normal! mS
autocmd BufLeave *.html normal! mH
autocmd BufLeave *.js normal! mJ
autocmd BufLeave *Controller.php normal! mC
autocmd BufLeave *Repo*.php normal! mR
autocmd BufLeave routes.php normal! mE


" ----- Custom mappings -----

" Disable ex mode
nnoremap Q <Nop>

" Make Y consistent with C and D
nnoremap Y y$

" Pinky savers
let mapleader = ","
noremap ; :

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap H ^
nnoremap L $

" Window resizing
nnoremap <Leader>k <C-w>=
nnoremap K <C-w>5>

" Save easily
nnoremap <Leader>s :w<Cr>
nnoremap <Leader>v :source $MYVIMRC<Cr>

" File navigation
cnoremap %% <C-R>=expand('%:h').'/'<Cr>
nnoremap <Leader>ew :e %%
nnoremap <Leader>es :sp %%
nnoremap <Leader>ev :vsp %%

" Use jk to esc out of insert/command mode
inoremap jk <Esc>
cnoremap jk <C-U><BS>

" Shortcut to clear highlighting
nnoremap <Esc> :noh<Cr><Esc>

" Range commands while searching
cnoremap $t <Cr>:t''<Cr>
cnoremap $m <Cr>:m''<Cr>
cnoremap $d <Cr>:d<Cr>``

" Run phpcbf
nnoremap <Leader>pf :%! phpcbf --standard=~/.elite50-phpcs-ruleset.xml<Cr><Cr>:w<Cr>

" Magic regex
noremap :s/ :s/\V
noremap :g/ :g/\V
noremap :%s/ :%s/\V
noremap :%g/ :%g/\V
noremap :sv/ :s/\v
noremap :gv/ :g/\v
noremap :%sv/ :%s/\v
noremap :%gv/ :%g/\v

" Toggle spellcheck
nnoremap <Leader>c :setlocal spell!<Cr>


" ----- Custom Commands -----

" Shortcut to toggle commented php logs
command! UncommentLogs %s/\/\/\\L/\\L/ | noh
command! CommentLogs %s/\\L/\/\/\\L/ | noh

" Shortcut to expand tabs from 2 to 4 spaces
command! Georgetabs %s/  /    /e | noh

" Shortcut to remove trailing spaces
command! -bar TrailingSpaces %s/\s\+$//e | noh
command! W TrailingSpaces | w | exe "normal ``"

" Shortcut to build/migrate projects
command! Build !./build.sh
command! Migrate !./migrate.sh

" Command to re-run grunt dev:watch
command! Grunt !screen -S cs-front-grunt -p 0 -X stuff "grunt dev:watch$(printf \\r)"

" Destroy all hidden buffers
command! -bang Wipeout :call Wipeout(<bang>0)
function! Wipeout(bang)
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  let l:cmd = 'bw'
  if a:bang
    let l:cmd .= '!'
  endif
  for b in range(1, bufnr('$'))
    if buflisted(b) && !has_key(visible, b)
      let l:tally += 1
      exe l:cmd . ' ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun


" ----- Plugins -----

" --- Solarized ---
colorscheme solarized

" --- Airline ---
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" --- NERDTree ---
let NERDTreeAutoDeleteBuffers = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
noremap <Leader>n :NERDTreeFind<Cr>

" --- FZF ---
nnoremap <Leader>f :Files<Cr>
nnoremap <Leader>b :Buffers<Cr>
" nmap <Leader><Tab> <Plug>(fzf-maps-n)
" xmap <Leader><Tab> <Plug>(fzf-maps-x)
" omap <Leader><Tab> <Plug>(fzf-maps-o)
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" --- Sneak ---
let g:sneak#s_next = 1
let g:sneak#streak = 1
" Make nN behave like ;, when sneaking
function! SmartFEnable()
  "map n <Plug>SneakNext
  "map N <Plug>SneakPrevious
  map n <Plug>SneakNext zzzv
  map N <Plug>SneakPrevious zzzv
endfun
" Make nN behave normally
function! SmartFDisable()
  "silent! unmap n
  "silent! unmap N
  noremap n nzzzv
  noremap N Nzzzv
endfun
" Make sneaking enable smart nN
nmap f :call SmartFEnable()<Cr><Plug>Sneak_f
nmap F :call SmartFEnable()<Cr><Plug>Sneak_F
nmap t :call SmartFEnable()<Cr><Plug>Sneak_t
nmap T :call SmartFEnable()<Cr><Plug>Sneak_T
nmap s :call SmartFEnable()<Cr><Plug>Sneak_s
nmap S :call SmartFEnable()<Cr><Plug>Sneak_S
" Make searching return nN to normal
noremap / :call SmartFDisable()<Cr>/\V
noremap ? :call SmartFDisable()<Cr>?\V

" --- Syntastic ---
let g:syntastic_enable_signs = 1
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_checkers = []
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--report=csv --standard=~/.elite50-phpcs-ruleset.xml"

" --- Javascript Libraries Syntax ---
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" --- PHP Indenting ---
let g:PHP_vintage_case_default_indent = 1

" --- YouCompleteMe ---
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" --- PHPCompleteExtended ---
"let g:phpcomplete_index_composer_command = 'composer'
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

" --- Tags ---
set tags=tags
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
"let g:easytags_on_cursorhold = 0
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1
nnoremap <Leader>t :TagbarToggle<Cr>

" --- Snippets ---
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" --- Fugitive ---
nnoremap <Leader>ga :Git add %:p<Cr><Cr>
nnoremap <Leader>gA :Git add -A<Cr><Cr>
nnoremap <Leader>gs :Gstatus<Cr>
nnoremap <Leader>gc :Gcommit<Cr>
nnoremap <Leader>gC :Gcommit -a<Cr>
nnoremap <Leader>gd :Gdiff<Cr>
nnoremap <Leader>ge :Gedit<Cr>
nnoremap <Leader>gr :Gread<Cr>
nnoremap <Leader>gw :Gwrite<Cr>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gm :Gmerge<Space>
nnoremap <Leader>gf :Gfetch --prune --tags<Cr>
nnoremap <Leader>gt :Git tag<Space>
nnoremap <Leader>gpl :Gpull<Cr>
nnoremap <Leader>gps :Gpush<Cr>
nnoremap <Leader>gpt :Gpush --tags<Cr>
nnoremap <Leader>gpu :execute "Gpush -u origin" fugitive#head()<Cr>
nnoremap <Leader>gpo :Gpush origin<Space>
nnoremap <Leader>gpn :execute "!git branch --merged \| tr -d '*' \| grep -v 'feature/components' \| grep -v 'master' \| xargs -n1 git branch -d"<Cr><Cr>
nnoremap <Leader>/ :Ggrep<Space>

" -- Promiscuous --
nnoremap <Leader>gO :Promiscuous<Space>
nnoremap <Leader>gB :Promiscuous -<Cr>

" --- GitGutter ---
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_map_keys = 0
nnoremap <Leader>gg :GitGutterToggle<Cr>

" --- DelimitMate ---
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <Leader>g <Plug>delimitMateJumpMany

" --- Gundo ---
nnoremap <Leader>u :GundoToggle<Cr>
let g:gundo_right = 1

" --- Emmet ---
let g:use_emmet_complete_tag = 1

" --- Vim REST Console ---
let g:vrc_set_default_mapping = 0
function! CloseVRC()
  normal j
  q
  wq
endfun
function! OpenVRC()
  vsp .rest
  below sp __REST_response__
  set buftype=nofile
  normal k
  nnoremap <buffer> <Leader>h :call CloseVRC()<Cr>
  nnoremap <buffer> <Cr> :call VrcQuery()<Cr>
endfun
nnoremap <Leader>h :call OpenVRC()<Cr>

" --- Instant Markdown ---
let g:instant_markdown_slow = 1

" --- Hardtime ---
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "Tagbar", ".git", "rest" ]
let g:hardtime_allow_different_key = 1
"let g:hardtime_maxcount = 5

" -- PHP Syntax ---
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
autocmd FileType php call PhpSyntaxOverride()
