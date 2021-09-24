" vim: ts=2 sw=2 noexpandtab
" maintainer: jarmusz (jarmusz at tuta dot io)
" repo: `https://github.com/jarmuszz/dots/tree/master/nvim/colors/min.vim'
"
" Distraction free coding. Uses color 1 as an accent and color 7 as a
" foreground.

hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "min2"

"syn match String "[\"']\.\*[\"']"

hi Comment ctermbg=7

hi Constant cterm=bold
hi String ctermfg=2

hi Function cterm=bold

hi Identifier cterm=NONE
hi Statement cterm=bold

hi PreProc ctermfg=1

hi Type ctermfg=2 cterm=NONE


hi	Title				ctermfg=0
hi	MoreMsg			ctermfg=0
hi	Search			ctermfg=0		ctermbg=2
hi	Special			ctermfg=0		         	cterm=bold
hi	Error				ctermfg=0		ctermbg=1		cterm=bold
hi	Todo				ctermfg=0		ctermbg=1
hi	Directory		ctermfg=0
hi	CursorLineNr cterm=reverse
hi	CursorLine	ctermfg=0
hi	Visual			ctermfg=0		ctermbg=2

"hi	String	ctermfg=1

" Pmenu
hi	Pmenu			ctermfg=0	ctermbg=7
hi	PmenuSel	ctermfg=2	ctermbg=7 cterm=underline
hi	PmenuSbar	ctermfg=0	ctermbg=0
hi	PmenuThumb	ctermfg=0	ctermbg=0

" WildMenu
hi	WildMenu	ctermfg=0	ctermbg=7

" Spell
" TODO
hi	SpellCap	ctermfg=2	ctermbg=7	cterm=italic
hi	SpellRare	ctermfg=7		ctermbg=0
hi	SpellLocal	ctermfg=0	ctermbg=1
hi	SpellBad	ctermfg=1		ctermbg=7

" Parens
hi	MatchParen	ctermfg=7	ctermbg=1
hi	MatchParenError	ctermfg=1	ctermbg=7

" Statusline
hi	StatusLine		ctermfg=0		ctermbg=7  cterm=bold
hi	StatusLineNC	ctermfg=0		ctermbg=NONE	 cterm=none

" Msgs
hi	ErrorMsg			ctermfg=0		ctermbg=1
hi	WarningMsg				ctermfg=0		ctermbg=1
hi	Question			ctermfg=0		ctermbg=7
hi	NvimInternalError	ctermfg=0	ctermbg=1

" Tabs
hi	TabLine				ctermfg=NONE		ctermbg=7		cterm=none
hi	TabLineFill		ctermfg=NONE		ctermbg=7		cterm=none
hi	TabLineSel		ctermfg=2		ctermbg=7		cterm=underline

" C
function! HiC()
	syn match cFunction			"\w\+("me=e-1
	syn match cField				"\.\w"me=e-1
	syn match cPtrField			"->"
	syn match cPtr					"[\*\&]\+\(\w\|,\|(\|)\|\n\)"me=e-1

	hi	def	link	cFunction	Function
	hi	cField	ctermfg=1	
	hi	def	link	cPtrField	cField
	hi	def	link	cPtr	cField
endfun

autocmd BufEnter *.c,*.h,*.cpp,*.hpp call HiC()
