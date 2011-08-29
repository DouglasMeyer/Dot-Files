set nocompatible " don't make VIM compatible with VI
set modelines=0  " some security thing

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

set nowrap
set dir=/tmp
set mouse=nv
set title
set wildmenu
set wildmode=list:longest
set clipboard=unnamed
"colorscheme evening "comment
set scrolloff=2
" get rif of a bunch of confirmation messages
set shortmess=atI
let mapleader = ","
set list " show Tabs and EOL     
set listchars=tab:>⋅,trail:␣
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
  autocmd FileType gitcommit set spell

  autocmd FileType help nnoremap <buffer><CR> <C-]>   " Enter selects subject
  autocmd FileType help nnoremap <buffer><BS> <C-T>   " Backspace to go back
else
  set autoindent
endif

noremap <F3> :set spell!<CR>     " toggle spelling

autocmd BufWrite *.rb,*.js,*.html,*.sql,*.py,*.php,*.rhtml,*.erb :%s/\s\+$//e

map <silent> <Leader>r
  \ :!./% 2>&1 \| tee /tmp/run.out<CR>
  \ :if !bufloaded('/tmp/run.out')<CR>
  \   sview /tmp/run.out<CR>
  \   set autoread<CR>
  \   set filetype=output<CR>
  \   nnoremap <buffer> <silent> <expr> q ":q\r"<CR>
  \ endif<CR><CR>
autocmd FileType ruby :map <silent> <Leader>r
  \ :!ruby % 2>&1 \| tee /tmp/run.out<CR>
  \ :if !bufloaded('/tmp/run.out')<CR>
  \   sview /tmp/run.out<CR>
  \   set autoread<CR>
  \   set filetype=output<CR>
  \   nnoremap <buffer> <silent> <expr> q ":q\r"<CR>
  \ endif<CR><CR>
autocmd FileType php :map <F5> :!phpunit %\| tee /tmp/test.out<CR>

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

map <Leader>m :FuzzyFinderTextMate<CR>

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
