" Vim color file
" Maintainer: Joshua Hou
" Last Change: Feb 02, 2012

hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "josh"

" fuzzy finder menu
highlight Search ctermfg=black
highlight Pmenu ctermbg=23 ctermfg=white
highlight PmenuSel ctermbg=white ctermfg=black

" cursorline
hi CursorLine cterm=NONE ctermbg=236

" yellow from 8bit terminal Statement color
highlight Statement ctermfg=220
