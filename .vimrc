" Taken from an Ubuntu default vimrc removed somethings and lost the author,
" sorry, Filipe

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" From now on, Filipe La Ruina rules

" Pathogen setup
call pathogen#infect()

" Tabs as spaces, 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4 

" Syntax highlight
syntax on

" File numbering
set number

" Black background is the best, everyone knows that
set background=dark

" No backup files, yet there is still swp
set nobackup

" Indentation folding as default
set foldmethod=indent 
set foldcolumn=2 

" Really dont remember what this does but ive found it makes
" things faster so it stays
set lazyredraw

" Mapping <F2> for NerdTree open/close
map <F2> :NERDTreeToggle<CR>

" showing the autocomplete menu for : when tab pressed
set wildmenu

" Autocomplete for PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" I use twig, which uses the jinja syntax
au BufRead,BufNewFile *.twig setfiletype htmljinja

" Common typos fixed
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q
