" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

"  ## Plugins ##
"
call plug#begin('~/.vim/plugged')

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" A project which translate Vim documents into Japanese.
Plug 'vim-jp/vimdoc-ja'

" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

call plug#end()

" ## Plubin conf ##

" -- vimdoc-ja
set helplang=ja,en

" -- solarized
set background=dark
try
    colorscheme solarized
catch
endtry

" ## Personal conf ##

if has("vms")
  " do not keep a backup file, use versions instead
  set nobackup
else
  " keep a backup file (restore to previous version)
  set backup
  if has('persistent_undo')
    " keep an undo file (undo changes after closing)
    set undofile
    set undodir=~/.tmp
  endif
  set backupdir=~/.tmp
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Every tab will be displayed as ">---" (with more or less "-")
set list
set listchars=tab:>-

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to xx characters.
  autocmd FileType text setlocal textwidth=99

  augroup END

else

  " always set autoindenting on
  set autoindent

endif " has("autocmd")

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

