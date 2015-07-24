" ----- General Config -----

" Enable per-file indenting and highlighting
set nocompatible
filetype plugin indent on
syntax on
set background=dark

" Show line numbers
set number

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


" ----- Filetype-Specific Config -----

" Make php use 4 spaces for tabs
augroup filetype_php
  autocmd!
  autocmd FileType php setlocal shiftwidth=4 tabstop=4
augroup END

" Custom handling of blade templates
augroup filetype_blade
  autocmd!
  autocmd FileType blade setlocal ft=html syntax=blade shiftwidth=2 tabstop=2
augroup END

" Make jison use 4 spaces for tabs
augroup filetype_jison
  autocmd!
  autocmd FileType yacc setlocal shiftwidth=4 tabstop=4
augroup END


" ----- Custom mappings -----

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


" ----- Custom Commands -----

" Shortcut to save as sudo
command! Sudow w !sudo tee % >/dev/null

" Shortcut to toggle commented php logs
command! UncommentLogs %s/\/\/\\L/\\L/ | noh
command! CommentLogs %s/\\L/\/\/\\L/ | noh

" Shortcut to expand tabs from 2 to 4 spaces
command! Georgetabs %s/  /    /e | noh

" Shortcut to remove trailing spaces
command! -bar TrailingSpaces %s/\s\+$//e | noh
command! W TrailingSpaces | w | exe "normal ``"

" Shortcut to fix php function brackets
command! -bar FunctionBrackets  %s/^\(\s*\)\(.*\%(function\|class\|interface\).*\) {$/\1\2\r\1{/ | noh

" Shortcut to dump-autoload
command! DumpAutoload !composer -o dump-autoload; php artisan dump-autoload

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

" Initialize Pathogen for plugins
execute pathogen#infect()
call pathogen#helptags()

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

" --- CtrlP ---
"let g:ctrlp_by_filename = 1
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git ' .
  \ '--ignore .svn --ignore .hg --ignore .DS_Store -g ""'
nnoremap <Leader>f :CtrlP<Cr>
nnoremap <Leader>b :CtrlPBuffer<Cr>

" --- EasyMotion ---
map <Space> <Plug>(easymotion-prefix)

" --- Sneak ---
let g:sneak#s_next = 1
let g:sneak#streak = 1
" Make nN behave like ;, when sneaking
function! SmartFEnable()
  map n <Plug>SneakNext
  map N <Plug>SneakPrevious
endfun
" Make nN behave normally
function! SmartFDisable()
  silent! unmap n
  silent! unmap N
endfun
" Make sneaking enable smart nN
nmap f :call SmartFEnable()<Cr><Plug>Sneak_f
nmap F :call SmartFEnable()<Cr><Plug>Sneak_F
nmap t :call SmartFEnable()<Cr><Plug>Sneak_t
nmap T :call SmartFEnable()<Cr><Plug>Sneak_T
nmap s :call SmartFEnable()<Cr><Plug>Sneak_s
nmap S :call SmartFEnable()<Cr><Plug>Sneak_S
" Make searching return nN to normal
noremap / :call SmartFDisable()<Cr>/
noremap ? :call SmartFDisable()<Cr>?

" --- Syntastic ---
let g:syntastic_enable_signs = 1
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_checkers = []
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--report=csv --standard=~/.elite50-phpcs-ruleset.xml"

" --- YouCompleteMe ---
augroup you_complete_me
  autocmd!
  autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup END

" --- PHPCompleteExtended ---
let g:phpcomplete_index_composer_command = 'composer'
augroup php_complete_extended
  autocmd!
  autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
augroup END

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
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction
augroup ultisnips
  autocmd!
  autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<Cr>"
augroup END
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

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
nnoremap <Leader>gf :Gfetch<Cr>
nnoremap <Leader>gt :Git tag<Space>
nnoremap <Leader>gpl :Gpull<Cr>
nnoremap <Leader>gps :Gpush<Cr>
nnoremap <Leader>gpt :Gpush --tags<Cr>
nnoremap <Leader>gpu :execute "Gpush -u origin" fugitive#head()<Cr>
nnoremap <Leader>gpo :Gpush origin<Space>
nnoremap <Leader>p :Ggrep<Space>

" --- GitGutter ---
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_map_keys = 0
nnoremap <Leader>gg :GitGutterToggle<Cr>

" --- Mirror ---
nnoremap <Leader>mc :MirrorConfig<Cr>
nnoremap <Leader>me :MirrorEdit staging
nnoremap <Leader>mv :MirrorVEdit staging
nnoremap <Leader>md :MirrorDiff staging
nnoremap <Leader>ms :MirrorSSH staging

" --- Surround ---
augroup surround
  autocmd!
  autocmd FileType php let b:surround_47 = "/* \r */"
  autocmd FileType javascript let b:surround_47 = "/* \r */"
  autocmd FileType scss let b:surround_47 = "/* \r */"
  autocmd FileType html let b:surround_47 = "<!-- \r -->"
augroup END

" --- DelimitMate ---
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <Leader>g <Plug>delimitMateJumpMany

" --- SkipIt ---
imap <Leader>l <Plug>SkipIt

" --- Gundo ---
nnoremap <Leader>u :GundoToggle<Cr>
let g:gundo_right = 1

" --- Emmet ---
let g:use_emmet_complete_tag = 1

" --- ConqueTerm ---
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_PromptRegex = '^bash\-3\.2\$'
nnoremap <Leader>cc :ConqueTerm bash<Cr>
nnoremap <Leader>cv :ConqueTermVSplit bash<Cr>
nnoremap <Leader>cs :ConqueTermSplit bash<Cr>

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
let g:hardtime_maxcount = 5

