set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles here
" repos on github
Bundle 'noahfrederick/Hemisu'
Plugin 'chriskempson/base16-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'powerline/powerline'
Bundle 'tsaleh/vim-supertab'
Bundle 'vim-scripts/VimClojure'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-haml'
Bundle "pangloss/vim-javascript"
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'othree/html5.vim'
Bundle 'sjl/gundo.vim'
Bundle 'digitaltoad/vim-jade'
" vim-scripts repos
" Bundle 'name-of-vim-script-repo'
Bundle 'bufkill.vim'
Bundle 'LargeFile'
Bundle 'paredit.vim'

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

imap <C-a> <Esc>0i
imap <C-e> <Esc>$a

""" filetype, syntax/color settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.prawn set filetype=ruby
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd FileType ruby,eruby,yaml set sw=2 sts=2 expandtab
autocmd FileType coffee set sw=2 sts=2 expandtab
autocmd FileType javascript set sw=2 sts=2 expandtab
autocmd FileType css,html,sass,haml set sw=2 sts=2 expandtab
autocmd FileType php set sw=2 sts=2 noexpandtab
autocmd FileType python set sw=4 sts=4 expandtab
autocmd Filetype cs set expandtab
autocmd Filetype php set noexpandtab

""" tab completion
set wildmode=longest,list
set wildmenu

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

" highlight anything longer than 120 chars
" match ErrorMsg '\%>120v.\+'

" colors
set bg=dark
let base16colorspace=256
colors base16-grayscale

set backspace=indent,eol,start

" visual beep, so that there's no annoying beep
set vb

""" Nerdtre
map <F2> :NERDTreeToggle<CR>

set splitbelow
set splitright

" coffeetags for TagBar
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif


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
  \ 'dir': '\v[\/](vendor|node_modules|venv)$',
  \ }
set wildignore+=*/tmp/*,*.pyc,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
