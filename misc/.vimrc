"" .vimrc
set nocompatible

" Language
if !has("gui_running")
  language en_US.utf8
else
  set langmenu=en_US
  let $LANG='en_US'
endif

" OS(unix/win32) setting
if has("win32")
  if has("gui_running")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
  endif
endif

" coding for system
set encoding=utf-8
set fileencodings=utf-8-bom,ucs-bom,utf-8,cp936,gb18030,ucs,big5

" coding for term
let &termencoding=&encoding

" Font setting
if has("gui_running")
  if has("gui_gtk")
    set guifont=SF\ Mono\ 13
    set guifontwide=SF\ Mono\ SC\ 13
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

" Set Vim-specific sequences for RGB colors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" Color scheme setting
colorscheme desert

" No temp files
set noundofile
set nobackup
set noswapfile

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
set statusline+=\[%n]                                   "Buffernr
set statusline+=\ %<%F\                                 "File+path
set statusline+=\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\  "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\             "Encoding2
set statusline+=\ %{&ff}\                               "FileFormat (dos/unix..)
set statusline+=\ row:%l/%L\ col:%c\ (%p%%)\            "Rownumber/total (%)
set statusline+=\ %m%r%w\ %P\                           "Modified? Readonly? Top/Bot/All

" Default the statusline when entering Vim
set laststatus=2
set cmdheight=1
set ruler

" Default the statusline when entering Vim
hi statusline ctermfg=green guibg=grey
