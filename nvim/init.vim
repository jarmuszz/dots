""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""

call plug#begin(stdpath('data'))
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch' : '0.5-compat'}
 Plug 'rose-pine/neovim'
 Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()

lua <<EOF
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = nil,
	},
	indent = {
		enable = false,
		disable = true,
	},
	ensure_installed = {
		"bash",
		"lua",
		"commonlisp",
		"rust",
		"c"
		}
}
EOF

" CHADTree
let g:chadtree_settings = { 'view.open_direction': 'right', 'view.width': 30 }

""""""""""""""""""""""""""""""
"  General 
""""""""""""""""""""""""""""""

" Remap leader to a space
let mapleader=" "

" Turn on the wildmenu
set wildmenu

" Relative numbers
set number relativenumber

" Highlight search results
set hlsearch

" Increment search
set incsearch

" Magic regex
set magic

" Show matching braces
set showmatch

" Tabs instead of spaces, makes files
" easier to read for visually impared
set noexpandtab

" Be smart about tabs
set smarttab

" Tabs are width of 2 chars
set tabstop=2
set shiftwidth=2

" Wrap lines
set wrap

" Auto indent
set autoindent

" Smart indent
set smartindent

" Tab stop width = 2
set softtabstop=2

" Window splits
set splitbelow
set splitright

" Complete
set complete+="kspell"

" Show search count
set shortmess-=S

" Enable mouse
set mouse=a

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""

" Theme
colorscheme rose-pine

" Statusline
set laststatus=2
set statusline=%f%r%m\ [%l/%L]\ [%c]

""""""""""""""""""""""""""""""
" Kbds
""""""""""""""""""""""""""""""

" Buffers
nmap <leader>,	:bn<CR>
nmap <leader>.	:bp<CR>
nmap <leader>bb :buffers<CR>
nmap <leader>B	:buffer<space>
nmap <leader>bd :bd<CR>
nmap <leader>bD :bd!<CR>

" Tabs
nmap <m-1>	1gt
nmap <m-2>	2gt
nmap <m-3>	3gt
nmap <m-4>	4gt
nmap <m-5>	5gt
nmap <m-6>	6gt
nmap <m-7>	7gt
nmap <m-8>	8gt
nmap <m-9>	9gt
nmap <m-0>	0gt
nmap <m-->	:tabclose<CR>
nmap <m-=>	:tabnew<CR>
nmap <m-+>	:tabedit

" Cmdline
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-f> <right>
cnoremap <C-b> <left>
cnoremap <m-f> <S-right>
cnoremap <m-b> <S-left>

" Copying into system clipboard
vmap <C-y> "+y

" Clearing search highlight
nmap <leader>/ :noh<CR>

" Add semicolon on the eol
autocmd FileType c,h,cpp,hpp,java let g:eolString = ";"
nmap <leader>; :exe "normal! $a" . eolString<CR>

" Spellcheck
nmap <leader>senus :setlocal spell! spelllang=en_us<CR>
nmap <leader>spl	 :setlocal spell! spelllang=pl<CR>
nmap <leader>sde	 :setlocal spell! spelllang=de<CR>
nmap <leader>sno	 :set nospell<CR>

" Make
nmap <leader>m :mak<CR>

" Tex
function TexBinds()
	nmap <leader>bf a\textbf{}<Esc>i
	nmap <leader>it a\textit{}<Esc>i
	nmap <leader>im a\(	\)<Esc>hhi
	nmap <leader>om a\[	\]<Esc>hhi
	nmap <leader>eg a\begin{}<Esc>i
	nmap <leader>en a\end{}<Esc>i
endfunction
autocmd FileType tex call TexBinds()

" Lisps
function LispBinds() 
	" Prev opening bracket 
	nmap <leader>9 ?[\(\[]<CR>:noh<CR>
	" Next opening bracker
	nmap <leader>o /[\(\[]<CR>:noh<CR>

	" Prev closing bracket
	nmap <leader>p ?[\)\]]<CR>:noh<CR>
	" Next closing bracket
	nmap <leader>0 /[\)\]]<CR>:noh<CR>
	
	" Prev Keyword
	nmap <leader>k h<leader>9l
	" Next Keyword
	nmap <leader>K l<leader>ol
endfunction
autocmd FileType lisp,scheme call LispBinds()

" Emacs-like kbds in insert
function EmacsBinds()
	imap <C-a> <Esc>^i
	imap <C-e> <Esc>$a
	imap <C-f> <Esc>la
	imap <C-b> <Esc>ha
	imap <A-f> <Esc>ea
	imap <A-b> <Esc>bi
	imap <A-k> <Esc>d$a
	imap <C-d> <Esc>lxi
endfunction
call EmacsBinds()
