" Sergii Golovatiuk's .vimrc
" Inspired by https://github.com/vgod/vimrc/blob/master/vimrc
" https://github.com/derekwyatt/vim-config/blob/master/vimrc
" http://spf13.com/post/perfect-vimrc-vim-config-file/

set nocompatible " not compatible with old-fashion vi mode
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 't9md/vim-chef'

" General Settings

set history=100 " keep 100 lines of last commands in history
"set ruler " show the cursor position in status line everytime
set autoread " automatically read a file that is changed from outside

filetype on " enable filetype detection
filetype plugin on " enable filetype-specific indenting
filetype indent on " Enable filetype-specific plugins

syntax on " syntax highlight
set hlsearch " search highlighting

" On Windows, use $HOME/.vim instead of vimfiles
if has('win32') || has ('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

if has("gui_running") " GUI colors and font settings
    set guifont=Consolas:h12
    set background=dark
    colorscheme solarized 
    set guioptions-=r "Removing right scroll bar
endif

set clipboard+=unnamed " yank to the system register (*) by default
set wildmenu " wild char completion menu

" Ingore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set number "Line numbering is on
set autoindent " auto indentation
set incsearch " incremental search
set nobackup " no *~ backup files
set copyindent " copy the previous indentation on autoindenting
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab " insert tabs on start of line according to context

set backspace=2 " allow backspacing over everything including indent, eol in insert mode
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Language Settings
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set spelllang=ru_yo,en_us
highlight lCursor guifg=NONE guibg=Blue

" ENCODING SETTINGS
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
    set encoding=utf-8
    set termencoding=big5
endfun

fun! UTF8()
    set encoding=utf-8
    set termencoding=big5
    set fileencoding=utf-8
    set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
    set encoding=big5
    set fileencoding=big5
endfun
