"" .vimrc
set nocompatible

" OS(unix/win32) setting
if has("win32")
  if has("gui_running")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
  endif
endif

" coding system
set encoding=utf-8
set fileencodings=utf-8-bom,ucs-bom,utf-8,cp936,gb18030,ucs,big5

" coding for term
let &termencoding=&encoding

" Font setting
if has("gui_running")
  if has("gui_gtk")
    set guifont=IBM\ Plex\ Mono\ 12
    set guifontwide=Droid\ Sans\ Fallback\ 14
  elseif has("gui_macvim")
    set guifont=SF\ Mono:h12
  elseif has("gui_win32")
    set guifont=Microsoft\ YaHei\ Mono:h12
  endif
endif

" UI setting
set shortmess=atI
set gcr=n:block-blinkon0
set listchars=tab:\^\ ,trail:.,extends:>,precedes:<,eol:$

" Allow backspacing over everything in insert mode
set bs=indent,eol,start

if !has("win32")
  " No scrollbar
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R

  " No menu toolbar
  set guioptions-=m
  set guioptions-=T
endif

" Color scheme setting
if has("gui_running")
  colo desert
endif

" No temp files
set noundofile
set nobackup
set noswapfile

" Persistent undo
"set undodir=~/.vim/undodir
"set undofile
"set undolevels=1000  "maximum number of changes that can be undone
"set undoreload=10000 "maximum number lines to save for undo on a buffer reload

syntax on

" Other setting"
set novisualbell
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" no sound
if !has("gui_running")
  set vb t_vb=
  set noeb
endif

if has("win32")
  if has("gui_running")
    set number
    set lines=27 columns=108
  endif
endif

set history=1000
set ignorecase
set hlsearch
set incsearch
set gdefault

" Status line setting
set statusline=
set statusline+=%f%m%r
set statusline+=\ %y
set statusline+=\ (%{&fileformat})
set statusline+=\ (ascii=\%b,hex=\%B)
set statusline+=\ (%l,%c)
set statusline+=\ %p%%
set statusline+=%=
if has("win32")
  set statusline+=%{strftime(\"%a\ %b\ %d\ %H:%M\")}
else
  set statusline+=%{strftime(\"%a\ %b\ %d\ %l:%M\ %p\")}
endif
set statusline+=\ %=

set laststatus=2
set cmdheight=1
set ruler

" Default the statusline when entering Vim
hi statusline ctermfg=green guibg=grey
