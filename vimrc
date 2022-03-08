let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" my bundles here
" repos on github
Plug 'danilo-augusto/vim-afterglow'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'sjl/gundo.vim'
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
Plug 'dense-analysis/ale'
Plug 'JulesWang/css.vim'
Plug 'preservim/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let mapleader = ","
source ~/.vim/coc.vim

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
set nomodeline

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
autocmd FileType git set keywordprg=git\ show

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
" set t_Co=256 " 256 colors

" colors
hi Normal ctermbg=none
hi NonText ctermbg=none
set termguicolors
colors afterglow

set backspace=indent,eol,start

" visual beep, so that there's no annoying beep
set vb

set splitbelow
set splitright

if has('mouse')
  set mouse=a
endif

set nu

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](build|vendor|node_modules|venv|build|htmlcov|dist|public)$',
  \ }
set wildignore+=*/tmp/*,*.pyc,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
set wildmenu

" set lower timeout so that shift-O doesn't take as long
set timeout timeoutlen=5000 ttimeoutlen=100

" vimux
let g:VimuxHeight = "40"
let g:VimuxOrientation = "v"
let g:vimux_ruby_cmd_all_tests = 'bundle exec rake test'
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vc :VimuxPromptCommand<CR>
map <leader>vq :VimuxCloseRunner<CR>
map <leader>vr :call VimuxRunCommand("bundle exec rubocop\n")<CR>
map <leader>va :TestSuite<CR>
map <Leader>vf :TestFile<CR>
map <Leader>vs :TestNearest<CR>
let test#strategy = 'vimux'

" vs: run this test
" vf: run all tests in file
" va: run all tests ever
" vl: vimux run last command
" vc: vimux prompt command
" vq: vimux close window
" vr: vimux run rubocop

" nerdtree
map <silent> <leader>nt :NERDTreeToggle<CR>
map <silent> <leader>nr :NERDTree<CR>
map <silent> <leader>nf :NERDTreeFind<CR>

let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['prettier'],
      \ 'ruby': ['rubocop']
      \ }
let g:ale_linters_explicit = 1
let js_fixers =['eslint', 'prettier']
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': js_fixers,
      \ 'jsx': js_fixers,
      \ 'javascriptreact': js_fixers,
      \ 'typescript': js_fixers,
      \ 'typescriptreact': js_fixers,
      \ 'ruby': ['rubocop']
      \ }
let g:ale_fix_on_save = 1
noremap <Leader>f :ALEFix<CR>
set fdm=syntax
set foldmethod=syntax foldlevel=99

" workaround for bug where cursor disappears when running :CocList
" https://github.com/neoclide/coc.nvim/issues/1775
let g:coc_disable_transparent_cursor = 1
