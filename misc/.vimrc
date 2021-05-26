"" .vimrc
set nocompatible

" OS(unix/win32) setting 
if has("win32") && has("gui_running")
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

" coding system
set encoding=utf-8
set fileencodings=utf-8-bom,ucs-bom,utf-8,cp936,gb18030,ucs,big5

" coding for term
let &termencoding=&encoding

" Font setting
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=WenQuanYi\ Zen\ Hei\ Mono\ 15
  elseif has("gui_macvim")
    set guifont=Anonymous\ Pro\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
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

if has("win32") && has("gui_running")
  set number
  set lines=27 columns=108  
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
set statusline+=[%{strftime(\"%H:%M,%d/%m/%Y\")}]

set laststatus=2
set cmdheight=1
set ruler

" Default the statusline when entering Vim
hi statusline ctermfg=green guibg=gray

" Diff setting
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

