""""""""""""""""""""""""""""""
"  General 
""""""""""""""""""""""""""""""

" Remap leader to a space
let mapleader=" "

" Turn on the wildmenu
set wildmenu

" Relative numbers
set number relativenumber

" Ignore case when searching
set ignorecase

" Highlight search resoults
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

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""

" Theme
colorscheme czarzly

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
	" Prev (
	nmap <leader>9 ?[\(\[]<CR>:noh<CR>
	" Next (
	nmap <leader>o /[\(\[]<CR>:noh<CR>

	" Prev )
	nmap <leader>p ?[\)\]]<CR>:noh<CR>
	" Next )
	nmap <leader>0 /[\)\]]<CR>:noh<CR>
	
	" Next Keyword
	nmap <leader>k h<leader>9l
	" Prev Keyword
	nmap <leader>K l<leader>ol
endfunction
autocmd FileType lisp,scheme call LispBinds()
