" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

runtime! ftplugin/man.vim
set foldmethod=indent
set foldlevelstart=0
set foldcolumn=2
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set nu

autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

nnoremap <Space> za

let $PAGER=''
runtime! ftplugin/man.vim

syntax enable
set t_Co=16
set background=dark
colorscheme solarized

highlight Normal ctermbg=none
highlight NonText ctermbg=none
hi perlVarPlain ctermbg=none
hi perlStatementFileDesc ctermbg=none

nnoremap <S-a> zR
nnoremap <S-s> zM

set t_ut=

filetype plugin indent on

" Bind <f2> key to running the python interpreter on the currently active
" file.  (curtesy of Steve Howell from email dated 1 Feb 2006).
map <f2> :w\|!python2 % <cr>
" Bind <f3> key to run python3
map <f3> :w\|!python3 % <cr>
" Bind <f4> key to run doctests in a python3 module
map <f4> :w\|!python2 -m doctest % <cr>
" Bind <f5> key to run doctests with verbose output 
map <f5> :w\|!python2 -m doctest -v % <cr>
" Bind <f8> key to run pep8 Python style checker 
map <f8> :w\|!pep8 % <cr>
