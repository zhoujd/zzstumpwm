"" .vimrc
set nocompatible

" Language
if !has("gui_running")
  language en_US.utf8
else
  set langmenu=en_US
  let $LANG='en_US'
endif

" OS setting
if has("win32")
  if has("gui_running")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
  endif
endif

" Coding setting
set encoding=utf-8
set fileencodings=utf-8-bom,ucs-bom,utf-8,cp936,gb18030,ucs,big5
set termencoding=utf-8

" Font setting
if has("gui_running")
  if has("gui_gtk")
    set guifont=SF\ Mono\ 13
    set guifontwide=SF\ Mono\ SC\ 13
  elseif has("gui_macvim")
    set guifont=SF\ Mono\ SC:h11
  elseif has("gui_win32")
    set guifont=SF\ Mono\ SC:h11
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

" Background
set background=dark

" Color scheme setting
let g:gruvbox_contrast_dark='black'
colorscheme gruvbox

" No temp files
set noundofile
set nobackup
set noswapfile

" Enable syntax highlighting if available
if has("syntax")
  syntax on
endif

" Other settings
set novisualbell
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set history=1000
set ignorecase
set incsearch
set gdefault

" Highlight all matched terms
set hlsearch
" Pressing return clears highlighted search
:nnoremap <CR> :nohlsearch<CR>/<BS>

" Configure title to look like: Vim /path/to/file
"set title
"set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" No sound
if !has("gui_running")
  set vb t_vb=
  set noeb
endif

if has("win32")
  if has("gui_running")
    set lines=27 columns=100
  endif
endif

" Auto copy to system clipboard, press 'p' to paste
if has("clipboard")
  if has("macunix") || has("win32")
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif

" Disable netrw save no history or bookmarks
let g:netrw_dirhistmax=0

" Default the statusline when entering Vim
set laststatus=2
set cmdheight=1
set ruler

" Default statusline color
" 0: Black        │   8: Bright Black (dark gray)
" 1: Red          │   9: Bright Red
" 2: Green        │  10: Bright Green
" 3: Yellow       │  11: Bright Yellow
" 4: Blue         │  12: Bright Blue
" 5: Magenta      │  13: Bright Magenta
" 6: Cyan         │  14: Bright Cyan
" 7: White (gray) │  15: Bright White
if has("gui_running")
  set termguicolors
  hi User1 guifg=#d0d0d0 guibg=#444444
else
  set notermguicolors
  hi User1 ctermfg=0 ctermbg=2
endif

" Default statusline
set statusline+=%1*
set statusline+=\[%n]                                   "Buffernr
set statusline+=\ %<%F\                                 "File+path
set statusline+=\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\  "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\             "Encoding2
set statusline+=\ %{&ff}\                               "FileFormat (dos/unix..)
set statusline+=\ row:%l/%L\ col:%c\ (%p%%)\            "Rownumber/total (%)
set statusline+=\ %m%r%w\                               "Modified? Readonly?
set statusline+=\ %P                                    "Top/Bot/All
