;; Imports
(local kbd (require :kbd))
(local fennel (require :fennel))

;; Config auto compilation
;;; TODO: compiles only once for a session (?)
(macro compile [in out]
   `(with-open [in# (io.open ,(.. "/home/jarmusz/.config/nvim/fnl/" in) :r)
                out# (io.open ,(.. "/home/jarmusz/.config/nvim/" out) :w)]
     (out#:write (pick-values 1 (fennel.compileString (in#:read :*a))))))

(vim.api.nvim_create_user_command 
  "CompileInit"
  (fn [] (compile "init.fnl" "init.lua")) {})

(vim.api.nvim_create_user_command 
  "CompileKbd"
  (fn [] (compile "kbd.fnl" "lua/kbd.lua")) {})


(vim.api.nvim_create_user_command 
  "Foo"
  (fn []
    (let [regstart (vim.fn.getpos "'<")
          regend   (vim.fn.getpos "'>")]
      (print (?. regstart31) regend)))
  {})

;; Packages
(local packer (require :packer))

;;; Definitions
;; TODO: dependencies
(macro packages [...]
  `((. packer :startup)
     (λ [use#]
       (each [_# repo# (ipairs [,...])]
         (use# repo#)))))

(packages
  "wbthomason/packer.nvim"
  "sainnhe/everforest"
  "nvim-treesitter/nvim-treesitter"
  "jaawerth/fennel.vim"
  "neovim/nvim-lspconfig"
  "junegunn/goyo.vim"
  "kyazdani42/nvim-tree.lua"
  "kyazdani42/nvim-web-devicons"
  "pigpigyyy/Yuescript-vim"
  "lukas-reineke/indent-blankline.nvim"
  "tpope/vim-repeat"
  "ggandor/leap.nvim"
  "anuvyklack/hydra.nvim"
  "cshuaimin/ssr.nvim"
  "ziglang/zig.vim"
  )

;;; Setup 
(macro setup [pkg tree]
  `((. (require ,pkg) :setup) ,tree))

(setup :nvim-treesitter.configs
 {:highlight {:enable true}
  :indent {:enable true}
  :ensure_installed 
    ["bash"    "lua"     "commonlisp"
     "rust"    "c"       "cpp"
     "scala"   "fennel"  "ocaml"
     "haskell" "elvish"
     ]})

(setup :nvim-tree
 {:open_on_tab true
  :renderer
   {:indent_width 1
    :icons
    {:webdev_colors true}}
   :diagnostics
    {:enable true}})

(setup :indent_blankline
  {:char "┊"
   :filetype_exclude
    ["lisp" "scheme" "racket" "fennel" "help" "md"]})

(. (require :leap) add_default_mappings)

;;; LSP 
(let [lsp-req (require :lspconfig)
      on-attach 
        (λ [client bufn] 
          (vim.api.nvim_buf_set_option bufn "omnifunc" "v:lua.vim.lsp.omnifunc")
          (vim.api.nvim_buf_set_option bufn "formatexpr" "v:lua.vim.lspformatexpr")
          (kbd.lsp 
            {:noremap true
             :buffer bufn}))]
  (lsp-req.clangd.setup {:on_attach on-attach})
  (lsp-req.metals.setup 
    {:on_attach on-attach
     :init_options 
      {:compilerOptions 
       {:snippetAutoIndent true}}})
  (lsp-req.ocamllsp.setup {:on_attach on-attach})
  (lsp-req.rust_analyzer.setup {:on_attach on-attach})
  (lsp-req.hls.setup 
    {:on_attach on-attach 
     :filetypes ["haskell" "lhaskell" "cabal"]}))

;;; Hydra
(let [hydra (require :hydra)
      hint "
      ^   Options
      ^ 
      _s_ %{spell} spell
      _p_: polski
      _e_: english
      _d_: Deutsch
      ^
      ^                 _<Esc>_
      "
      ]
  (hydra {:name "Spell"
          :hint hint
          :config {:invoke_on_body true
                   :hint {:border :rounded
                          :position :middle}}
          :mode :n
          :body :<M-s>
          :heads
            [[:s (fn [] (set vim.o.spell (not vim.o.spell)))]
             [:p (fn [] (set vim.opt_local.spelllang "pl"))]
             [:e (fn [] (set vim.opt_local.spelllang "en_us"))]
             [:d (fn [] (set vim.opt_local.spelllang "de"))]
             ]}))

;; Options
(macro vset [...]
  `(each [_# v# (ipairs ,[...])]
     (->>
       (if (= (type v#) "table")
         (table.concat v# " ")
         v#)
       (.. "set ")
       (vim.cmd))))

(set vim.g.mapleader " ")
(vset
  :wildmenu                   ; Better menu
  :termguicolors              ; Better colors
  [:number :relativenumber]
  :hlsearch                   ; Hl all search results
  :incsearch                  ; Incremental search
  :magic                      ; Better reges
  :showmatch
  :noexpandtab                ; Tabs instead of spaces
  :smarttab
  [:tabstop :=2]
  [:softtabstop :=2]
  [:shiftwidth :=2]
  :wrap
  :autoindent
  :smartindent
  
  :splitbelow
  :splitright
  [:complete :+=kspell]
  [:shortmess :-=S]
  [:mouse :=a]
  )

;;; Netrw
(set vim.g.netrw_liststyle 3)
(set vim.g.netrw_banner 0)
(set vim.g.netrw_browse_split 4)
(set vim.g.netrw_winsize 25)
(set vim.opt_global.completeopt ["menuone" "noinsert" "noselect"])
(set vim.g.loaded 1)
(set vim.g.loaded_netrwPlugin 1)


;; Appearance
;;; Theme
(vset 
  [:background :=light]
  )
(set vim.g.everforest_background :hard)
(set vim.g.everforest_better_performance 1)
(vim.cmd "colo everforest")

;;; Statusline
(vset
  [:laststatus :=2]
  [:statusline "=%f%r%m\\ [%l/%L]\\ [%c]"]
  )
