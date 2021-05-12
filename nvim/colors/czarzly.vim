" vim: ts=2 sw=2
" Maintainer: jarmusz (jarmusz at tuta dot io)
" Repo: `https://github.com/jarmuszz/dots/tree/master/nvim/colors/czarzly.vim'
"
" Works fine with pywal, I don't know how it will work without
" external theming or in a GUI. Written for NeoVim.

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "czarzly"

hi  Search      ctermfg=0  ctermbg=3
hi  Function    ctermfg=4  ctermbg=0  cterm=italic
hi  Comment     ctermfg=9             cterm=italic
hi  Constant    ctermfg=14
hi  Identifier  ctermfg=6
hi  Statement   ctermfg=3             cterm=bold
hi  PreProc     ctermfg=10            cterm=italic
hi  Type        ctermfg=2             cterm=italic
hi  Special     ctermfg=12
hi  Error                   ctermbg=9  cterm=bold
hi  Todo        ctermfg=0   ctermbg=3
hi  Directory   ctermfg=2
hi  CursorLineNr  ctermfg=1

" Pmenu
hi  Pmenu         ctermfg=8   ctermbg=0
hi  PmenuSel      ctermfg=0   ctermbg=1

" Spell
hi  SpellCap                  ctermbg=3

" Statusline
hi  StatusLine    ctermfg=1   ctermbg=0  cterm=none
hi  StatusLineNC  ctermfg=0   ctermbg=8

" Msgs
highlight ErrorMsg      ctermfg=0   ctermbg=1

" C-like syntaxes
" Made specially for my C style.
function HiC()
    syn match cFunction     "\w\+("me=e-1
    syn match cFunctionDef  "^\w\+("me=e-1
    syn match cField        "\.\w"me=e-1
    syn match cPtrField     "->"
    syn match cIncDec       "++\|--"
    syn match cPtr          "\*\+\(\w\|,\|(\|)\)"me=e-1

    hi def link cFunction Function
    hi def link cFunctionDef Identifier
    hi def link cField    Type
    hi def link cPtrField cField
    hi def link cIncDec   Function
    hi def link cPtr      Special
endfun
autocmd BufEnter *.c,*.h,*.cpp,*.hpp call HiC()
