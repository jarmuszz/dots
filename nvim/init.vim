""""""""""""""""""""""""""""""
"  General 
""""""""""""""""""""""""""""""

" Remap leader to a space
let mapleader =" "

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

" Spaces instead of tabs ;)
set expandtab

" Be smart about tabs
set smarttab

" 1 tab -> 2 spaces
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

" Statusline
set laststatus=2
set statusline=%f%m\ [l%l/%L]\ [c%c]
hi statusline cterm=NONE ctermbg=0 ctermfg=1

""""""""""""""""""""""""""""""
" Kbds
""""""""""""""""""""""""""""""

" Buffers
nmap <leader>,  :bn<CR>
nmap <leader>.  :bp<CR>
nmap <leader>bb :buffers<CR>
nmap <leader>B  :buffer
nmap <leader>bd :bd<CR>
nmap <leader>bD :bd!<CR>

" Copying into system clipboard
vmap <C-y> "+y

" Clearing search highlight
nmap <leader>/ :noh<CR>

" Add semicolon on the eol
autocmd FileType c,h,cpp,hpp,java let g:eolString = ";"
nmap <leader>; :exe "normal! $a" . eolString<CR>

" Spellcheck
nmap <leader>senus :setlocal spell! spelllang=en_us<CR>
nmap <leader>spl   :setlocal spell! spelllang=pl<CR>
nmap <leader>sde   :setlocal spell! spelllang=de<CR>
nmap <leader>sno   :set nospell<CR>

" Make
nmap <leader>m :mak<CR>

" Tex
function TexBinds()
  nmap <leader>bf a\textbf{}<Esc>i
  nmap <leader>it a\textit{}<Esc>i
  nmap <leader>tmi a\(  \)<Esc>hhi
  nmap <leader>tmo a\[  \]<Esc>hhi
  nmap <leader>tbe a\begin{}<Esc>i
  nmap <leader>ten a\end{}<Esc>i
endfunction
autocmd FileType tex call TexBinds()

" Lisps
function LispBinds() 
  " Prev )
  nmap <leader>9 ?[\(\[]<CR>:noh<CR>
  " Next )
  nmap <leader>o /[\(\[]<CR>:noh<CR>

  " Prev (
  nmap <leader>p ?[\)\]]<CR>:noh<CR>
  " Next (
  nmap <leader>0 /[\)\]]<CR>:noh<CR>
  
  " Next Keyword
  nmap <leader>k h<leader>9l
  " Prev Keyword
  nmap <leader>K l<leader>ol
endfunction
autocmd FileType lisp,scheme call LispBinds()
