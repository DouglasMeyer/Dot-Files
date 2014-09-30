set nocompatible " don't make VIM compatible with VI
filetype off " required by vundle

" vundle setup
set rtp+=/home/douglas/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'slim-template/vim-slim'
Bundle 'digitaltoad/vim-jade'

" vim bundles

" fancy status bar
Bundle 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': { 'filename': '%f' },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \}

" coffee script syntax and stuff
Bundle 'kchmck/vim-coffee-script'

" <c-p> fuzzy file finding
Bundle 'kien/ctrlp.vim'

set wildignore+=*/node_modules/*
set wildignore+=*/build/*
set wildignore+=*/spec_build/*
"let g:ctrlp_custom_ignore = '/build/'
let g:ctrlp_map = '<c-o>'
"let g:ctrlp_open_multiple_files = ''
"let g:ctrlp_prompt_mappings = {
"  \ 'PrtBS()':              ['<bs>', '<c-]>'],
"  \ 'PrtDelete()':          ['<del>'],
"  \ 'PrtDeleteWord()':      ['<c-w>'],
"  \ 'PrtClear()':           ['<c-u>'],
"  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
"  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
"  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
"  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
"  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
"  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
"  \ 'PrtHistory(-1)':       ['<c-n>'],
"  \ 'PrtHistory(1)':        ['<c-p>'],
"  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
"  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
"  \ 'AcceptSelection("t")': ['<c-t>'],
"  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
"  \ 'ToggleFocus()':        ['<s-tab>'],
"  \ 'ToggleRegex()':        ['<c-r>'],
"  \ 'ToggleByFname()':      ['<c-d>'],
"  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
"  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
"  \ 'PrtExpandDir()':       ['<tab>'],
"  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
"  \ 'PrtInsert()':          ['<c-\>'],
"  \ 'PrtCurStart()':        ['<c-a>'],
"  \ 'PrtCurEnd()':          ['<c-e>'],
"  \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
"  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
"  \ 'PrtClearCache()':      ['<F5>'],
"  \ 'PrtDeleteEnt()':       ['<F7>'],
"  \ 'CreateNewFile()':      ['<c-y>'],
"  \ 'MarkToOpen()':         ['<c-z>'],
"  \ 'OpenMulti()':          ['<c-o>'],
"  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
"  \ }


filetype plugin indent on " also required by vundle

"syntax on
syntax enable

"tabbing
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

"searching
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <C-L> :nohlsearch<CR><C-L>
nnoremap <C-P> :set paste!<CR><C-L>

" Save more than 20 records in history
set history=200
set nowrap
set dir=/tmp
" Only use the mouse for moving the cursor, no visual stuff, no moving the input
set mouse=
" Don't show the stupid "Thanks for flying Vim" message on exit
"set title
set wildmenu
set wildmode=list:longest
set clipboard=unnamed
"colorscheme evening "comment
set scrolloff=2
" get rif of a bunch of confirmation messages
set shortmess=atI
let mapleader = ","
"set list " show Tabs and EOL     
"set listchars=tab:>⋅,trail:␣
set fileformats=unix " force files to not support MS-DOS files
" I have no clude what this does.
" #{file_name}(#{buf_index}) #{formats:[unix,MS-dos]:[sh]:[utf-8]}
"     [#{line_number},#{col_number}]  [#{page_percent}]
set statusline=%f(%1.3n)%m%r%{VarExists('b:gzflag','\ [GZ]')}%h%w\ %([%{&ff}]%)%(:%y%)%(:[%{&fenc}]%)\ %=[%1.7l,%1.7c]\ \ [%p%%]
function! VarExists(var, val)
  if exists(a:var) | return a:val | else | return '' | endif
endfunction
set laststatus=2

if &diff
  "setup for diff mode
  set diffopt=filler,icase,iwhite
else
  "setup for non-diff mode
endif

set t_Co=256
colorscheme default

"if &t_Co == 256 || has("gui_running")
"  colorscheme railscasts
"endif

if has("gui_running")
  set guioptions-=r " no scrollbar on the right
  set guioptions-=m " no menu
  set guioptions-=T " no toolbar
"  colorscheme xoria256
endif

if has("autocmd")
  filetype on
  filetype plugin on " load filetype plugins
  autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)

  " jump to last position when reopening a file
  autocmd BufReadPost *
  \ if &filetype != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

  " automatically turn on spelling for git commit messages
  autocmd FileType gitcommit setlocal spell

  autocmd FileType help nnoremap <buffer><CR> <C-]>   " Enter selects subject
  autocmd FileType help nnoremap <buffer><BS> <C-T>   " Backspace to go back
else
  set autoindent
endif

noremap <F3> :setlocal spell!<CR>     " toggle spelling

autocmd BufWrite *.rb,*.js,*.html,*.sql,*.py,*.php,*.rhtml,*.erb :%s/\s\+$//e

autocmd BufEnter *.slim set ft=slim

map <silent> <Leader>r :call RunFile()<CR>

function! RunFile()
  let file = expand('%')
  if filereadable("./.run")
    let cmd = './.run '.file.' '.line('.')
  elseif &filetype == 'cucumber'
    let cmd = 'cucumber '.file
  elseif &filetype == 'ruby'
    let cmd = 'ruby '.file
  elseif &filetype == 'javascript'
    let cmd = 'node '.file
  elseif &filetype == 'coffee'
    let cmd = 'coffee '.file
  else
    let cmd = './'.file
  endif
  let pid = getpid()
  let file = '/tmp/run.out'
  let cmd = cmd.' 2>&1 | tee '.file
  exe "normal :!".cmd."\<CR>"
  if !bufloaded(file)
   exe "sview ".file
   set autoread
   set filetype=output
   nnoremap <buffer> <silent> <expr> q ":q\r"
  else
    :checktime
  endif
endfun

vmap <silent> <Leader>f c<C-R><C-R>=substitute(@", "\\([^,]*\\),\\(\\s\\?\\)\\(.*\\)", "\\3,\\2\\1", "")<CR><ESC>
iabbrev <silent> UNICODESNOWMAN ☃
iabbrev <silent> INTERROBANG ‽
iabbrev <silent> SADFACE ☹
iabbrev <silent> CHECK ✓
"iabbrev <silent> #\!ruby "#!/usr/bin/env ruby"
iabbrev <silent> env_ruby #!/usr/bin/env ruby
map <C-C> <C-A>

" save a file, even if you forgot "sudo vim"
cmap w!! w !sudo tee % >/dev/null

" ftplugin options
let g:git_diff_spawn_mode = 1

function! GitDiff(files)
  aboveleft new
  silent! setlocal filetype=diff previewwindow bufhidden=delete nobackup noswf nobuflisted nowrap buftype=nofile
  exe "normal :r!git diff --ignore-all-space HEAD -- ".a:files."\<CR>"
"  call feedkeys("godd", "n")
  noremap <buffer> q :bw<CR>
endfun
command! -narg=* -complete=custom,ListGitDiff GitDiff call GitDiff(<q-args>)
function! ListGitDiff(A,L,P)
  return system("git status | grep modified | cut -c 15-")
endfun

":edit **/adm*trol<CTRL_D>
