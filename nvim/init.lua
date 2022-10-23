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
vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*init.fnl", callback = _1_})
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
vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*kbd.fnl", callback = _6_})
local function _11_()
  local in_2_auto = io.open("/home/jarmusz/.config/nvim/fnl/util.fnl", "r")
  local out_3_auto = io.open("/home/jarmusz/.config/nvim/lua/util.lua", "w")
  local function close_handlers_10_auto(ok_11_auto, ...)
    out_3_auto:close()
    in_2_auto:close()
    if ok_11_auto then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _13_()
    local function _15_()
      local _14_ = fennel.compileString(in_2_auto:read("*a"))
      return _14_
    end
    return out_3_auto:write(_15_())
  end
  return close_handlers_10_auto(_G.xpcall(_13_, (package.loaded.fennel or debug).traceback))
end
vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*util.fnl", callback = _11_})
local packer = require("packer")
local function _16_(use_2_auto)
  _G.assert((nil ~= use_2_auto), "Missing argument use_2_auto on unknown:36")
  for __3_auto, repo_4_auto in ipairs({"wbthomason/packer.nvim", "sainnhe/everforest", "nvim-treesitter/nvim-treesitter", "jaawerth/fennel.vim", "neovim/nvim-lspconfig", "junegunn/goyo.vim", "kyazdani42/nvim-tree.lua", "kyazdani42/nvim-web-devicons", "pigpigyyy/Yuescript-vim", "lukas-reineke/indent-blankline.nvim", "tpope/vim-repeat", "ggandor/leap.nvim"}) do
    use_2_auto(repo_4_auto)
  end
  return nil
end
packer.startup(_16_)
do end (require("nvim-treesitter.configs")).setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "lua", "commonlisp", "rust", "c", "scala", "fennel"}})
do end (require("nvim-tree")).setup({open_on_tab = true, renderer = {indent_width = 1, icons = {webdev_colors = true}}, diagnostics = {enable = true}})
do end (require("indent_blankline")).setup({char = "\226\148\138", filetype_exclude = {"lisp", "scheme", "racket", "fennel", "help", "md"}})
do local _ = (require("leap"))[add_default_mappings] end
do
  local lsp_req = require("lspconfig")
  local on_attach
  local function _17_(client, bufn)
    _G.assert((nil ~= bufn), "Missing argument bufn on unknown:88")
    _G.assert((nil ~= client), "Missing argument client on unknown:88")
    vim.api.nvim_buf_set_option(bufn, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufn, "formatexpr", "v:lua.vim.lspformatexpr")
    return kbd.lsp({noremap = true, buffer = bufn})
  end
  on_attach = _17_
  lsp_req.clangd.setup({on_attach = on_attach})
  lsp_req.metals.setup({on_attach = on_attach, init_options = {compilerOptions = {snippetAutoIndent = true}}})
  lsp_req.rust_analyzer.setup({on_attach = on_attach})
end
vim.g.mapleader = " "
for __2_auto, v_3_auto in ipairs({"wildmenu", "termguicolors", {"number", "relativenumber"}, "hlsearch", "incsearch", "magic", "showmatch", "noexpandtab", "smarttab", {"tabstop", "=2"}, {"softtabstop", "=2"}, {"shiftwidth", "=2"}, "wrap", "autoindent", "smartindent", {"foldmethod", "=syntax"}, "splitbelow", "splitright", {"complete", "+=kspell"}, {"shortmess", "-=S"}, {"mouse", "=a"}}) do
  local function _18_(...)
    if (type(v_3_auto) == "table") then
      return table.concat(v_3_auto, " ")
    else
      return v_3_auto
    end
  end
  vim.cmd(("set " .. _18_(...)))
end
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25
vim.opt_global.completeopt = {"menuone", "noinsert", "noselect"}
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.everforest_better_performance = 1
vim.cmd("colo everforest")
for __2_auto, v_3_auto in ipairs({{"laststatus", "=2"}, {"statusline", "=%f%r%m\\ [%l/%L]\\ [%c]"}}) do
  local function _19_(...)
    if (type(v_3_auto) == "table") then
      return table.concat(v_3_auto, " ")
    else
      return v_3_auto
    end
  end
  vim.cmd(("set " .. _19_(...)))
end
return nil