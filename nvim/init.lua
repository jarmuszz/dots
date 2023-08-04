local kbd = require("kbd")
local fennel = require("fennel")
local function _1_()
  local in_2_auto = io.open("/home/jarmusz/.config/nvim/fnl/init.fnl", "r")
  local out_3_auto = io.open("/home/jarmusz/.config/nvim/init.lua", "w")
  local function close_handlers_10_auto(ok_11_auto, ...)
    out_3_auto:close()
    in_2_auto:close()
    if ok_11_auto then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _3_()
    local function _5_()
      local _4_ = fennel.compileString(in_2_auto:read("*a"))
      return _4_
    end
    return out_3_auto:write(_5_())
  end
  return close_handlers_10_auto(_G.xpcall(_3_, (package.loaded.fennel or debug).traceback))
end
vim.api.nvim_create_user_command("CompileInit", _1_, {})
local function _6_()
  local in_2_auto = io.open("/home/jarmusz/.config/nvim/fnl/kbd.fnl", "r")
  local out_3_auto = io.open("/home/jarmusz/.config/nvim/lua/kbd.lua", "w")
  local function close_handlers_10_auto(ok_11_auto, ...)
    out_3_auto:close()
    in_2_auto:close()
    if ok_11_auto then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _8_()
    local function _10_()
      local _9_ = fennel.compileString(in_2_auto:read("*a"))
      return _9_
    end
    return out_3_auto:write(_10_())
  end
  return close_handlers_10_auto(_G.xpcall(_8_, (package.loaded.fennel or debug).traceback))
end
vim.api.nvim_create_user_command("CompileKbd", _6_, {})
local function _11_()
  local regstart = vim.fn.getpos("'<")
  local regend = vim.fn.getpos("'>")
  local _13_
  do
    local t_12_ = regstart31
    _13_ = t_12_
  end
  return print(_13_, regend)
end
vim.api.nvim_create_user_command("Foo", _11_, {})
local packer = require("packer")
local function _14_(use_2_auto)
  _G.assert((nil ~= use_2_auto), "Missing argument use_2_auto on unknown:36")
  for __3_auto, repo_4_auto in ipairs({"wbthomason/packer.nvim", "sainnhe/everforest", "nvim-treesitter/nvim-treesitter", "jaawerth/fennel.vim", "neovim/nvim-lspconfig", "junegunn/goyo.vim", "kyazdani42/nvim-tree.lua", "kyazdani42/nvim-web-devicons", "pigpigyyy/Yuescript-vim", "lukas-reineke/indent-blankline.nvim", "tpope/vim-repeat", "ggandor/leap.nvim", "anuvyklack/hydra.nvim", "cshuaimin/ssr.nvim", "ziglang/zig.vim"}) do
    use_2_auto(repo_4_auto)
  end
  return nil
end
packer.startup(_14_)
do end (require("nvim-treesitter.configs")).setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "lua", "commonlisp", "rust", "c", "cpp", "scala", "fennel", "ocaml", "haskell", "elvish"}})
do end (require("nvim-tree")).setup({open_on_tab = true, renderer = {indent_width = 1, icons = {webdev_colors = true}}, diagnostics = {enable = true}})
do end (require("indent_blankline")).setup({char = "\226\148\138", filetype_exclude = {"lisp", "scheme", "racket", "fennel", "help", "md"}})
do local _ = (require("leap"))[add_default_mappings] end
do
  local lsp_req = require("lspconfig")
  local on_attach
  local function _15_(client, bufn)
    _G.assert((nil ~= bufn), "Missing argument bufn on unknown:91")
    _G.assert((nil ~= client), "Missing argument client on unknown:91")
    vim.api.nvim_buf_set_option(bufn, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufn, "formatexpr", "v:lua.vim.lspformatexpr")
    return kbd.lsp({noremap = true, buffer = bufn})
  end
  on_attach = _15_
  lsp_req.clangd.setup({on_attach = on_attach})
  lsp_req.metals.setup({on_attach = on_attach, init_options = {compilerOptions = {snippetAutoIndent = true}}})
  lsp_req.ocamllsp.setup({on_attach = on_attach})
  lsp_req.rust_analyzer.setup({on_attach = on_attach})
  lsp_req.hls.setup({on_attach = on_attach, filetypes = {"haskell", "lhaskell", "cabal"}})
end
do
  local hydra = require("hydra")
  local hint = "\n      ^   Options\n      ^ \n      _s_ %{spell} spell\n      _p_: polski\n      _e_: english\n      _d_: Deutsch\n      ^\n      ^                 _<Esc>_\n      "
  local function _16_()
    vim.o.spell = not vim.o.spell
    return nil
  end
  local function _17_()
    vim.opt_local.spelllang = "pl"
    return nil
  end
  local function _18_()
    vim.opt_local.spelllang = "en_us"
    return nil
  end
  local function _19_()
    vim.opt_local.spelllang = "de"
    return nil
  end
  hydra({name = "Spell", hint = hint, config = {invoke_on_body = true, hint = {border = "rounded", position = "middle"}}, mode = "n", body = "<M-s>", heads = {{"s", _16_}, {"p", _17_}, {"e", _18_}, {"d", _19_}}})
end
vim.g.mapleader = " "
for __2_auto, v_3_auto in ipairs({"wildmenu", "termguicolors", {"number", "relativenumber"}, "hlsearch", "incsearch", "magic", "showmatch", "noexpandtab", "smarttab", {"tabstop", "=2"}, {"softtabstop", "=2"}, {"shiftwidth", "=2"}, "wrap", "autoindent", "smartindent", "splitbelow", "splitright", {"complete", "+=kspell"}, {"shortmess", "-=S"}, {"mouse", "=a"}}) do
  local function _20_(...)
    if (type(v_3_auto) == "table") then
      return table.concat(v_3_auto, " ")
    else
      return v_3_auto
    end
  end
  vim.cmd(("set " .. _20_(...)))
end
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25
vim.opt_global.completeopt = {"menuone", "noinsert", "noselect"}
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
for __2_auto, v_3_auto in ipairs({{"background", "=light"}}) do
  local function _21_(...)
    if (type(v_3_auto) == "table") then
      return table.concat(v_3_auto, " ")
    else
      return v_3_auto
    end
  end
  vim.cmd(("set " .. _21_(...)))
end
vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
vim.cmd("colo everforest")
for __2_auto, v_3_auto in ipairs({{"laststatus", "=2"}, {"statusline", "=%f%r%m\\ [%l/%L]\\ [%c]"}}) do
  local function _22_(...)
    if (type(v_3_auto) == "table") then
      return table.concat(v_3_auto, " ")
    else
      return v_3_auto
    end
  end
  vim.cmd(("set " .. _22_(...)))
end
return nil