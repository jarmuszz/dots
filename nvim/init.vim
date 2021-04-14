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
set splitright
set splitbelow

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""

" Statusline
set laststatus=2
set statusline=%f%m\ [l%l/%L]\ [c%c]
hi statusline cterm=NONE ctermbg=0 ctermfg=1


" Complete
set complete+="kspell"

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
map <C-y> <Esc>"+y

" Clearing search highlight
nmap <leader>/ :noh<CR>

" Add semicolon on the eol
autocmd FileType c,h,cpp,hpp,java let g:eolString = ";"
nmap <leader>; :exe "normal! $a" . eolString<CR>

" Spellcheck
nmap <leader>enuss :setlocal spell! spelllang=en_us<CR>
nmap <leader>pls   :setlocal spell! spelllang=pl<CR>
nmap <leader>des   :setlocal spell! spelllang=de<CR>
nmap <leader>nos   :set nospell<CR>

" Make
nmap <leader>m :mak<CR>

" Tex
function TexBinds()
  nmap <leader>bf a\textbf{}<Esc>i
  nmap <leader>it a\textit{}<Esc>i
  nmap <leader>tmi a\(  \)<Esc>hhi
  nmap <leader>tmo a\[  \]<Esc>hhi
endfunction
autocmd FileType tex call TexBinds()
