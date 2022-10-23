(set vim.g.mapleader " ")

(macro kmap [t ?mode ?opts]
  `(each [k# v# (pairs ,t)]
    (vim.keymap.set 
      ,(or ?mode "")
      k# 
      v#
      ,(or ?opts {:noremap false}))))

(macro ikmap [t ?opts] `(kmap ,t "i" ,(or ?opts nil)))
(macro nkmap [t ?opts] `(kmap ,t "n" ,(or ?opts nil)))
(macro vkmap [t ?opts] `(kmap ,t "v" ,(or ?opts nil)))
(macro tkmap [t ?opts] `(kmap ,t "t" ,(or ?opts nil)))

(fn lsp [?opts]
  ;(ikmap
  ;  {:<C-n> vim.lsp.buf.completion})
  (nkmap 
    {:gd        vim.lsp.buf.declaration 
     :gD        vim.lsp.buf.definition
     :<space>ls vim.lsp.buf.signature_help
     :<space>lt vim.lsp.buf.type_definition
     :<space>o  vim.diagnostic.open_float
     :K         vim.lsp.buf.hover
     :<space>R  vim.lsp.buf.references
     }
    (or opts {:noremap false}))
  (ikmap
    {:<C-n> "<C-x><C-o>"}
    {:noremap true}))

(nkmap
 {;; Buffers
  "<space>," ":bn<CR>"
  :<space>. ":bp<CR>"
  :<space>bb ":buffers<CR>"
  :<space>B  ":buffer "
  :<space>bd ":bd<CR>"
  :<space>bD ":bd!<CR>"

  ;; Windows
  :<m-h>  "<C-w>h"
  :<m-j>  "<C-w>j"
  :<m-k>  "<C-w>k"
  :<m-l>  "<C-w>l"

  ;; Tabs
  :<m-1>	"1gt"
  :<m-2>	"2gt"
  :<m-3>	"3gt"
  :<m-4>	"4gt"
  :<m-5>	"5gt"
  :<m-6>	"6gt"
  :<m-7>	"7gt"
  :<m-8>	"8gt"
  :<m-9>	"9gt"
  :<m-0>	"0gt"
  :<m-->	":tabclose<CR>"
  :<m-=>	":tabnew<CR>"
  :<m-+>	":tabedit"

  ;; Cmdline
  :<C-a> "<home>"
  :<C-e> "<end>"
  :<C-f> "<right>"
  :<C-b> "<left>"
  :<m-f> "<S-right>"
  :<m-b> "<S-left>"

  ;; Spellcheck
  :<leader>senus ":setlocal spell! spelllang=en_us<CR>"
  :<leader>spl	 ":setlocal spell! spelllang=pl<CR>"
  :<leader>sde	 ":setlocal spell! spelllang=de<CR>"
  :<leader>sno	 ":set nospell<CR>"

  ;; Leap
  :<C-s>     "<Plug>(leap-forward)"
  :<C-A-S>   "<Plug>(leap-backward)"
  :<space>s  "<Plug>(leap-cross-window)"


  ;; Misc
  :<space>/ ":noh<CR>"
  :<f12>    ":NvimTreeToggle<CR>"
  })

(vkmap
  {:<C-y> "\"+y"
   }
  {:noremap true})

(ikmap 
  {;; Shorthands
   :<C-\> "λ"
   :<C-q> "<Esc>{jV}kgq"

   ;; Emacs
   :<C-a> "<Esc>0i"
   :<C-e> "<Esc>$a"
   :<C-f> "<Esc>la"
   :<C-b> "<Esc>ha"
   :<A-f> "<Esc>ea"
   :<A-k> "<Esc>0d$a"
   :<C-d> "<Esc>lxi"
   })

(tkmap
 {;; Misc
  :<ESC>  "<C-\\><C-n>"

  ;; Tabs
  :<m-1>	"<ESC>1gt"
  :<m-2>	"<ESC>2gt"
  :<m-3>	"<ESC>3gt"
  :<m-4>	"<ESC>4gt"
  :<m-5>	"<ESC>5gt"
  :<m-6>	"<ESC>6gt"
  :<m-7>	"<ESC>7gt"
  :<m-8>	"<ESC>8gt"
  :<m-9>	"<ESC>9gt"
  :<m-0>	"<ESC>0gt"
  :<m-->	"<ESC>:tabclose<CR>"
  :<m-=>	"<ESC>:tabnew<CR>"
  :<m-+>	"<ESC>:tabedit"
  })

{:lsp lsp}
