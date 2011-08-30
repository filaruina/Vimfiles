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

call pathogen#infect()

" Tamanho do tab
set tabstop=4
set shiftwidth=4

" Liga o Color highlight
syntax on

" Sempre vem com números
set number

" Tela preta For The Win!
set background=dark

" Pra ele nao criar aqueles arquivinhos de backup
set nobackup

" Tamanho da coluna mostrando o folding
set foldcolumn=2 

" Método de Folding. A doumentaçao explica todos os outros.
set foldmethod=indent 

set lazyredraw

exe "set tags=~/.vim/tags/bolsa6"

map <F2> :NERDTreeToggle<CR>

" Exibe o menu quando for fazer o complete nos :
set wildmenu

" Autocomplete do PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Fazendo com que arquivos do twig usem o syntax do jinja
au BufRead,BufNewFile *.twig setfiletype htmljinja

" Mapeamento de teclas maiusculas digitadas incorretamente
" Afinal Segurar o shift causa isso :)
" Filipe La Ruina
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q
