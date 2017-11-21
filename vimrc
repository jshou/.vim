set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles here
" repos on github
Bundle 'chriskempson/base16-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'powerline/powerline'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'sjl/gundo.vim'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
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
autocmd BufNewFile,BufRead *.scala set filetype=scala
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

" highlight tabs and trailing spaces
set list listchars=tab:\ \ ,trail:·

""" powerline
set nocompatible " disable vi-compatibility
set laststatus=2 " always show the statusline
set t_Co=256 " 256 colors

" colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

" set lower timeout so that shift-O doesn't take as long
set timeout timeoutlen=5000 ttimeoutlen=100

" vimux
let g:VimuxHeight = "30"
let g:VimuxOrientation = "h"
let g:vimux_ruby_cmd_all_tests = 'bundle exec rake test'
autocmd FileType ruby map <leader>vs :RunRubyFocusedTest<CR>
autocmd FileType ruby map <leader>vf :RunAllRubyTests<CR>
map <leader>va :call VimuxRunCommand("bundle exec rspec\n")<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vc :VimuxPromptCommand<CR>
map <leader>vq :VimuxCloseRunner<CR>

" vs: run this test
" vf: run all tests in file
" va: run all tests ever
" vl: vimux run last command
" vc: vimux prompt command
" vq: vimux close window
