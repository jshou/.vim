filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles here
" repos on github
Bundle 'noahfrederick/Hemisu'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-supertab'
Bundle 'tpope/vim-unimpaired'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-afterimage'
Bundle 'vim-scripts/VimClojure'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos

syntax on
filetype indent on
set fileencodings=utf8 ",latin1
set encoding=utf8
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set ruler
set hlsearch

let mapleader = ","

""" fuzzy finder bindings
map <leader>t :FufFile <CR>
map <leader>w :FufRenewCache <CR>
map <leader>l :TagbarToggle <CR>

imap <C-a> <Esc>0i
imap <C-e> <Esc>$a

""" filetype, syntax/color settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.prawn set filetype=ruby
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd FileType ruby,eruby,yaml set sw=2 sts=2
autocmd FileType coffee set sw=2 sts=2


" hide abandon buffers in order to not lose undo history
set hid

""" pastemode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" map f8 to show the syntax coloring for a character
map <F8> :echo synIDattr(synID(line("."),col("."),1),"name")<cr>

" highlight tabs and trailing spaces
set listchars=tab:>✖,trail:✖
set list

""" powerline
set nocompatible " disable vi-compatibility
set laststatus=2 " always show the statusline
set t_Co=256 " 256 colors

" highlight anything longer than 120 chars
match ErrorMsg '\%>120v.\+'

" colors
set bg=dark
colors hemisu

set backspace=indent,eol,start

" visual beep, so that there's no annoying beep
set vb

""" Nerdtre
map <F2> :NERDTreeToggle<CR>

" deleting buffer without closing the window
" proper attribution: http://superuser.com/questions/289285/how-to-close-buffer-without-closing-the-window
map <F4> :bp<bar>sp<bar>bn<bar>bd<CR>

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
