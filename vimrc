set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles here
" repos on github
Bundle 'noahfrederick/Hemisu'
Bundle 'chriskempson/base16-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'powerline/powerline'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-haml'
Bundle "pangloss/vim-javascript"
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'othree/html5.vim'
Bundle 'sjl/gundo.vim'
Bundle 'Valloric/YouCompleteMe'
" vim-scripts repos
" Bundle 'name-of-vim-script-repo'
Bundle 'bufkill.vim'
Bundle 'LargeFile'

syntax on
filetype indent on
set fileencodings=utf8 ",latin1
set encoding=utf8
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set ruler
set hlsearch

let mapleader = ","

""" ctrl-p bindings
let g:ctrlp_map = ",t"

""" filetype, syntax/color settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.prawn set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd FileType ruby,eruby,yaml set sw=2 sts=2 expandtab
autocmd FileType javascript set sw=2 sts=2 expandtab
autocmd FileType css,html,sass,haml set sw=2 sts=2 expandtab
autocmd FileType php set sw=2 sts=2 noexpandtab
autocmd FileType python set sw=4 sts=4 expandtab


" hide abandon buffers in order to not lose undo history
set hid

""" pastemode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" map f8 to show the syntax coloring for a character
map <F8> :echo synIDattr(synID(line("."),col("."),1),"name")<cr>
nnoremap <leader>g :GundoToggle<CR>

" highlight tabs and trailing spaces
set list listchars=tab:\ \ ,trail:·

""" powerline
set nocompatible " disable vi-compatibility
set laststatus=2 " always show the statusline
set t_Co=256 " 256 colors


" colors
set bg=dark
let base16colorspace=256
colors base16-railscasts

set backspace=indent,eol,start

" visual beep, so that there's no annoying beep
set vb

set splitbelow
set splitright

if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

set nu

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](build|vendor|node_modules|venv|build|htmlcov)$',
  \ }
set wildignore+=*/tmp/*,*.pyc,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

set colorcolumn=120

" set lower timeout so that shift-O doesn't take as long
set timeout timeoutlen=5000 ttimeoutlen=100
