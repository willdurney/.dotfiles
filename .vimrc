if has('python3')
  silent! python3 1
endif

" ----- Initialize Plugins -----

call plug#begin('~/.vim/plugged')

" Syntax
Plug '2072/PHP-Indenting-for-VIm'
Plug 'StanAngeloff/php.vim'
Plug 'derekelkins/agda-vim'
Plug 'gavocanov/vim-js-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'jwalton512/vim-blade'
Plug 'kylef/apiblueprint.vim'
Plug 'leafgarland/typescript-vim'
Plug 'leshill/vim-json'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'wizicer/vim-jison'

" Editing
Plug 'AaronLasseigne/yank-code'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-sort-motion'
Plug 'joereynolds/place.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'xtal8/traces.vim'

" Completion & analysis
Plug 'SirVer/ultisnips'
Plug 'ajh17/VimCompletesMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'

" Project navigation
Plug 'Olical/vim-enmasse'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-eunuch'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'shuber/vim-promiscuous'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-fugitive'

" PHP
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'joonty/vdebug'
Plug 'phpactor/phpactor', { 'do': 'composer install' }
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'
Plug 'tyru/current-func-info.vim'

" JavaScript
" Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Quramy/tsuquyomi'

" HTML
Plug 'mattn/emmet-vim'

" UI
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Miscellaneous
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'metakirby5/codi.vim'
Plug 'rizzatti/dash.vim'
Plug 'segeljakt/vim-silicon'
Plug 'tpope/vim-dadbod'
Plug 'zenbro/mirror.vim'

call plug#end()


" ----- General Config -----

" Stop vim dying with long lines
set synmaxcol=250

" Show relative line numbers
set number relativenumber
augroup NumberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave * set norelativenumber
augroup END

" Linebreaking options
set linebreak
set textwidth=100
set backspace=indent,eol,start

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
set smarttab
set shiftround

" Automatically write and read
set autowriteall
set autoread

" Show cursor position in statusbar
set ruler

" Don't redraw in the middle of macros
set lazyredraw

" Persistent undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir/
  set undolevels=500
  set undoreload=500
endif

" Show status bar at all times
set laststatus=2

" Use system clipboard by default
set clipboard^=unnamed

" Rebalance windows on vim resize
augroup AutoResize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Enable spellcheck
set spelllang=en_us
syntax spell toplevel

" Disable backups and swap
set nowritebackup
set noswapfile

" Don't show mode
set noshowmode

" Reset cursor position on files if it's remembered
augroup ResetCursor
  autocmd!
  autocmd BufReadPost * if &filetype != "gitcommit" && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Allow filename completion to be relative to current file
augroup RelativeFilenames
  autocmd!
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
augroup END


" ----- Filetype-Specific Config -----

" Remove trailing spaces automatically on save
augroup TrailingSpaces
  autocmd!
  autocmd BufWritePre *.js,*.ts,*.php,*.html,*.css,*.scss,*.jison,*.yml,*.sh :%s/\s\+$//e
augroup END

" " Agda folds
" augroup AgdaFolds
"   autocmd!
"   autocmd FileType agda setlocal commentstring={-%s-}
"   autocmd FileType agda setlocal foldtext=v:folddashes
" augroup END

" Better matching tag nagivation
runtime macros/matchit.vim

" Proper commentstring
augroup CommentString
  autocmd!
  autocmd FileType php setlocal commentstring=/*\ %s\ */
  autocmd FileType javascript setlocal commentstring=//\ %s
augroup END


" ----- Custom mappings -----

" Repeat last macro
nnoremap Q @@

" Make Y consistent with C and D
nnoremap Y y$

" Pinky savers
let mapleader = ","
map ; :
nmap :: :%
nmap :; :%

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <Leader>k <C-w>=
nnoremap K <C-w>5><C-w>5+

" Line nagivation
nnoremap H ^
nnoremap L $

" Store relative line number jumps in the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Save easily
nnoremap <Leader>s :up<Cr>
nnoremap <Leader>S :Wall<Cr>

" File navigation
cnoremap %% <C-R>=expand('%:h').'/'<Cr>

" Use jk to esc out of insert/command mode
inoremap jk <Esc>
cnoremap jk <C-U><BS>

" Magic regex
function! MagicRegex(prefix, char) abort
  return a:prefix . a:char . ('sgG' =~# a:char ? '-MR-' : '')
endfunction
cnoremap -MR-/ /\V
cnoremap -MR-v/ /\v
cnoremap -MR-// //
cnoremap -MR- <Nop>
map <expr> : MagicRegex(':', nr2char(getchar()))
nmap <expr> :% MagicRegex(':%', nr2char(getchar()))
cmap G-MR-/ g!-MR-/
cmap G-MR-v/ g!-MR-v/
cmap G-MR-// g!-MR-//

" Run command mappings
nnoremap <Leader>rt :execute "!phpunit --filter" cfi#get_func_name() "%"<Cr>
nnoremap <Leader>rT :!phpunit %<Cr>
nnoremap <Leader>rc :Silent !open -a "Google Chrome" "file://%:p"<Cr>
nnoremap <Leader>rf :call CodeFixer()<Cr>
nnoremap <Leader>rgr :Silent !screen -r cs-front-grunt<Cr>
nnoremap <Leader>rgg :call Grunt()<Cr>
" nnoremap <Leader>rgG :call Grunt()<Cr>:Silent !screen -r cs-front-grunt<Cr>
" nnoremap <Leader>rga :call GruntAll()<Cr>
nnoremap <Leader>rgs :call GruntStop()<Cr>
nnoremap <Leader>rs :Silent !stree<Cr>
nnoremap <Leader>rb :execute "!./build.sh && ./migrate.sh"<Cr>
nnoremap <Leader>ro :Silent !open %<Cr>

" Quickly format things
nnoremap <Leader>=j ggVG:!jq '.'<Cr>
nnoremap <Leader>=m :%s/\v\\| +(.*) \\|\n/\1,/<Cr>$x0

" Quickly fix lint issues
nnoremap <Leader>ly :s/\v\((.*) ([!\=]\=\=) (.*)\)/(\3 \2 \1)/<Cr>
nnoremap <Leader>l[ %kA,<Esc>
nnoremap <Leader>ln :s/\vis_null\(([^)]+)\)/null === \1/ \| s/\v!null \=\=\=/null !==/<Cr>
nnoremap <Leader>l( :s/\vnew ([a-zA-Z\\]*)/new \1()/<Cr>


" ----- Custom Commands -----

" Run commands silently with screen redraw
command! -nargs=1 Silent
\ | execute ':silent '.<q-args>
\ | execute ':redraw!'

" Quickly source vimrc
command! SourceVimrc source $MYVIMRC

" Command to re-run grunt commands
function! GruntStop() abort
  Silent !screen -S cs-front-main -p 0 -X stuff ""
  Silent !screen -S cs-front-legacy -p 0 -X stuff ""
endfunction
function! Grunt() abort
  call GruntStop()
  Silent !screen -S cs-front-main -p 0 -X stuff "npm run start:dev$(printf \\r)"
  Silent !screen -S cs-front-legacy -p 0 -X stuff "npm run start:dev:legacy$(printf \\r)"
endfunction
command! Grunt call Grunt()
command! GruntStop call GruntStop()

" Code style fixers
function! CodeFixer() abort
  if (&ft=='php')
    Silent %!phpcbf --standard=~/.phpcs.xml
  elseif (&ft=='javascript')
    Silent !eslint --fix %:p
    edit
  endif
  update
endfunction


" ----- Plugins -----

" --- Syntax ---

" -- PHP Syntax --
function! PhpSyntaxOverride() abort
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
augroup PhpSyntax
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" -- Javascript Libraries Syntax --
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs,underscore'

" --- Editing ---

" -- YankCode --
map <leader>y <Plug>YankCode

" -- DelimitMate --
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <Leader>, <Plug>delimitMateJumpMany

" -- Place --
let g:place_blink = 0
nmap <Leader>i <Plug>(place-insert)
nmap <Leader>I <Plug>(place-insert-multiple)

" -- Sneak --
" Make nN behave like ;, when sneaking
function! SmartNEnable() abort
  map n <Plug>SneakNext
  map N <Plug>SneakPrevious
endfunction
" Make nN behave normally
function! SmartNDisable() abort
  silent! unmap n
  silent! unmap N
endfunction
" Make sneaking enable smart nN
nmap f :call SmartNEnable()<Cr><Plug>Sneak_f
nmap F :call SmartNEnable()<Cr><Plug>Sneak_F
nmap t :call SmartNEnable()<Cr><Plug>Sneak_t
nmap T :call SmartNEnable()<Cr><Plug>Sneak_T
nmap s :call SmartNEnable()<Cr><Plug>Sneak_s
nmap S :call SmartNEnable()<Cr><Plug>Sneak_S
" Make searching return nN to normal
noremap v/ :call SmartNDisable()<Cr>/\v
noremap / :call SmartNDisable()<Cr>/\V
noremap ? :call SmartNDisable()<Cr>?\V
noremap * :call SmartNDisable()<Cr>*``

" -- Undotree --
nnoremap <Leader>u :UndotreeToggle<Cr>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 50

" --- Completion & Analysis ---

" -- UltiSnips --
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '`'
let g:UltiSnipsJumpForwardTrigger = '`'
let g:UltiSnipsJumpBackwardTrigger = '~'

" -- VimCompletesMe --
let g:vcm_direction = 'p'
set completeopt=menu,menuone,longest,preview,noselect

" -- Gutentags --
let g:gutentags_ctags_exclude = ['*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules']

" -- ALE --
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'php': ['php', 'phpcs', 'phpstan'],
  \ 'scss': ['scsslint'],
  \ 'html': ['alex', 'htmlhint', 'proselint', 'write-good'],
\ }
" let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 1000
" let g:ale_lint_on_insert_leave = 1
let g:ale_php_phpcs_standard = '~/.phpcs.xml'
let g:ale_php_phpcs_executable = 'phpcs -s'
let g:ale_php_phpstan_configuration = 'phpstan.neon'
let g:ale_php_phpstan_level = 7
" let g:ale_completion_enabled = 1
nnoremap <Leader>al :ALELint<Cr>
nnoremap <Leader>ai :ALEInfo<Cr>
nnoremap <Leader>an :ALENext<Cr>
nnoremap <Leader>ap :ALEPrevious<Cr>

" --- Project navigation ---

" -- FZF --
nnoremap <Leader>/ :BLines<Cr>
nnoremap <Leader>ff :Files<Cr>
nnoremap <Leader>fb :Buffers<Cr>
nnoremap <Leader>ft :Tags<Cr>
nnoremap <Leader>f/ :Ag<Space>
nnoremap <Leader>f? :Ag <C-r><C-w><Cr>
nnoremap <Leader>fs :Snippets<Cr>
nnoremap <Leader>fc :Commits<Cr>
nnoremap <Leader>fh :Helptags<Cr>

" -- Dirvish --
augroup DirvishEvents
  autocmd!
  " Sort folders at the top
  autocmd FileType dirvish
    \ sort r /[^\/]*$/
augroup END
nmap <Leader>fnn -
nmap <Leader>fns :sp<Cr>-
nmap <Leader>fnv :vsp<Cr>-

" -- Tagbar --
let g:tagbar_left = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_type_php  = {
  \ 'ctagstype' : 'php',
  \ 'kinds'     : [
    \ 'i:interfaces',
    \ 'c:classes',
    \ 'd:constant definitions',
    \ 'f:functions',
    \ 'j:javascript functions:1'
  \ ]
\ }
nnoremap <Leader>t :TagbarOpenAutoClose<Cr>

" --- Git ---

" -- GitGutter --
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_map_keys = 0
nnoremap <Leader>gg :GitGutterToggle<Cr>

" -- Promiscuous --
nnoremap <Leader>gO :Promiscuous<Cr>
nnoremap <Leader>gB :Promiscuous -<Cr>

" -- Fugitive --
nnoremap <Leader>gA :Silent Git add -A<Cr>
nnoremap <Leader>gs :Gstatus<Cr>
nnoremap <Leader>gS :GV<Cr>
nnoremap <Leader>gc :Gcommit<Cr>
nnoremap <Leader>gC :Gcommit -a<Cr>
nnoremap <Leader>gdd :Gvdiff!<Cr>
nnoremap <Leader>gdh :diffget //2<Cr>:diffupdate<Cr>
nnoremap <Leader>gdl :diffget //3<Cr>:diffupdate<Cr>
noremap <Leader>gD :Gbrowse<Cr>
nnoremap <Leader>gl :Gblame<Cr>
nnoremap <Leader>gr :Gread<Cr>
nnoremap <Leader>gR :Git reset<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gm :Gmerge<Space>
nnoremap <Leader>gf :Gfetch<Cr>
nnoremap <Leader>gt :Git tag<Space>
nnoremap <Leader>gpl :Gpull<Cr>
nnoremap <Leader>gps :Gpush<Cr>
nnoremap <Leader>gpu :execute "Silent Gpush -u origin" fugitive#head()<Cr>
" Delete local fully-merged branches
nnoremap <Leader>gnl :execute "Silent !git branch --merged \| tr -d '*' \| grep -v '^\\s*\\(master\\\|spec\\)' \| xargs -n1 git branch -d"<Cr>
" Delete remote fully-merged branches
nnoremap <Leader>gnr :execute "Silent !git branch -r --merged \| sed -e 's/origin\\///' \| grep -v '^\\s*\\(master\\\|HEAD\\\|spec\\)' \| xargs -n1 git push origin --delete"<Cr>
nnoremap <Leader>gnn :call GitFreshenRepo()<Cr>
function! GitFreshenRepo() abort
  Silent Git checkout master
  normal ,gpl
  normal ,gnl
  normal ,gnr
endfunction
augroup FugitiveClose
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
nnoremap <Leader>gpr :execute "Silent !open https://bitbucket.org/elite50/" . substitute(getcwd(), '^.*/', '', '') . "/pull-requests/new"<Cr>

" --- PHP ---

" -- VIM Php Refactoring Toolbox --
let g:vim_php_refactoring_use_default_mapping = 0
nnoremap <Leader>prv :call PhpRenameLocalVariable()<Cr>
nnoremap <Leader>prp :call PhpRenameClassVariable()<Cr>
nnoremap <Leader>prm :call PhpRenameMethod()<Cr>
nnoremap <Leader>peu :call PhpExtractUse()<Cr>
xnoremap <Leader>pec :call PhpExtractConst()<Cr>
nnoremap <Leader>pep :call PhpExtractClassProperty()<Cr>
xnoremap <Leader>pem :call PhpExtractMethod()<Cr>
nnoremap <Leader>pap :call PhpCreateProperty()<Cr>
nnoremap <Leader>pdu :call PhpDetectUnusedUseStatements()<Cr>

" -- Vdebug --
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options['ide_key'] = 'xdebug'
let g:vdebug_options['path_maps'] = {
  \'/var/crowdskout/api/': '/Users/willdurney/Web/Crowdskout/crowdskout-back/',
  \'/var/crowdskout/cerebro': '/Users/willdurney/Web/Crowdskout/cerebro-api/',
  \'/var/crowdskout/analytics': '/Users/willdurney/Web/Crowdskout/crowdskout-analytics/'
  \}

" -- Phpactor
augroup PhpactorComplete
  autocmd!
  autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END
nmap <Leader>pcc :call phpactor#ClassExpand()<Cr>
nmap <Leader>pp :call phpactor#ContextMenu()<Cr>
nmap <Leader>pg] :call phpactor#GotoDefinition()<Cr>
nmap <Leader>pmf :call phpactor#MoveFile()<Cr>
nmap <Leader>pcf :call phpactor#CopyFile()<Cr>
nmap <Leader>pac :call phpactor#ClassNew()<Cr>
nmap <Leader>pfr :call phpactor#FindReferences()<Cr>

" -- PDV --
let g:pdv_template_dir = $HOME . '/.vim/plugged/pdv/templates_snip/'
nnoremap <Leader>pad :call pdv#DocumentWithSnip()<Cr>

" --- JavaScript ---

" -- Tsuquyomi --
let g:tsuquyomi_disable_quickfix = 1

" --- HTML ---

" -- Emmet --
let g:use_emmet_complete_tag = 1

" --- UI ---

" -- Solarized --
colorscheme solarized

" -- Vim Indent Guides --
nmap <silent> cot <Plug>IndentGuidesToggle
let g:indent_guides_default_mapping = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=grey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" -- Airline --
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{fugitive#head()}'
let g:airline_section_y = "%{gutentags#statusline('Indexing...')}"

" --- Miscellaneous ---

" -- Codi --
function! CodiSplit(paste) abort
  let ft = &filetype
  tabe
  setlocal buftype=nofile
  let g:codi#width = winwidth(winnr()) / 2
  execute "Codi " . ft
  sleep 2
  if ft ==# "php"
    normal! i<?php
  endif
  let b:ale_enabled = 0
  execute "set ft=" . ft
  nnoremap <buffer> gq :q!<Cr>
  if a:paste
    normal V]p
  else
    startinsert
  endif
endfunction
nnoremap <Leader>c :call CodiSplit(0)<Cr>
vnoremap <Leader>c y:call CodiSplit(1)<Cr>
let g:codi#use_buffer_dir = 0
let g:codi#rightalign = 0
let g:codi#interpreters = {
    \ 'php': {
      \ 'bin': ['php', 'artisan', 'tinker'],
      \ 'prompt': '^\(>>>\|\.\.\.\) ',
    \ },
    \ 'typescript': {
      \ 'bin': ['ts-node'],
      \ 'prompt': '^\(>\|\.\.\.\+\) ',
    \ },
  \ }
" let g:codi#aliases = {
"     \ 'typescript': 'javascript',
"   \ }

" -- Dash --
nnoremap <Leader>rd :Dash<Space>
nmap <Leader>rD <Plug>DashSearch

" -- Silicon --
function! TakeScreenshot(snippet, highlight) abort
  if a:snippet
    let g:silicon = {
        \ 'theme': 'Dracula',
        \ 'font': 'Fira Code',
        \ 'background': '#00aeef',
        \ 'shadow-color': '#555555',
        \ 'line-pad': 2,
        \ 'pad-horiz': 40,
        \ 'pad-vert': 40,
        \ 'shadow-blur-radius': 0,
        \ 'shadow-offset-x': 0,
        \ 'shadow-offset-y': 0,
        \ 'line-number': v:false,
        \ 'round-corner': v:true,
        \ 'window-controls': v:true,
      \ }
    '<,'>Silicon /tmp/silicon.png
  else
    let g:silicon = {
        \ 'theme': 'Dracula',
        \ 'font': 'Fira Code',
        \ 'background': '#00aeef',
        \ 'shadow-color': '#555555',
        \ 'line-pad': 2,
        \ 'pad-horiz': 40,
        \ 'pad-vert': 40,
        \ 'shadow-blur-radius': 0,
        \ 'shadow-offset-x': 0,
        \ 'shadow-offset-y': 0,
        \ 'line-number': v:true,
        \ 'round-corner': v:true,
        \ 'window-controls': v:true,
      \ }
    if a:highlight
      '<,'>SiliconHighlight /tmp/silicon.png
    else
      Silicon /tmp/silicon.png
    endif
  endif
  Silent !~/.dotfiles/scripts/file-to-clipboard /tmp/silicon.png
endfunction
nnoremap <Leader>Y :call TakeScreenshot(0, 0)<Cr>
vnoremap <Leader>Y :call TakeScreenshot(1, 0)<Cr>
vnoremap <Leader>H :call TakeScreenshot(0, 1)<Cr>

" -- Dadbod --
let g:dbmysql = 'mysql://vagrant:uhTd%40T5pBk!5@local.cskout.com/local_crowdskout'
let g:dbmongo = 'mongodb://root:root12@local.cskout.com/Queue'
noremap <Leader>ds :DB g:dbmysql<Cr>
noremap <Leader>dS :DB g:dbmysql<Space>
noremap <Leader>dm :DB g:dbmongo<Cr>
noremap <Leader>dM :DB g:dbmongo<Space>

" -- Mirror --
nnoremap <Leader>me :MirrorEdit<Space>
nnoremap <Leader>md :MirrorDiff<Space>
nnoremap <Leader>mpl :MirrorPull<Space>
nnoremap <Leader>mps :MirrorPush<Space>
