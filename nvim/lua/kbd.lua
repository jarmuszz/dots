vim.g.mapleader = " "
local function lsp(_3fopts)
  for k_2_auto, v_3_auto in pairs({gd = vim.lsp.buf.declaration, gD = vim.lsp.buf.definition, ["<space>ls"] = vim.lsp.buf.signature_help, ["<space>lt"] = vim.lsp.buf.type_definition, ["<space>o"] = vim.diagnostic.open_float, K = vim.lsp.buf.hover, ["<space>R"] = vim.lsp.buf.references}) do
    vim.keymap.set("n", k_2_auto, v_3_auto, (opts or {noremap = false}))
  end
  for k_2_auto, v_3_auto in pairs({["<C-n>"] = "<C-x><C-o>"}) do
    vim.keymap.set("i", k_2_auto, v_3_auto, {noremap = true})
  end
  return nil
end
for k_2_auto, v_3_auto in pairs({["<space>,"] = ":bn<CR>", ["<space>."] = ":bp<CR>", ["<space>bb"] = ":buffers<CR>", ["<space>B"] = ":buffer ", ["<space>bd"] = ":bd<CR>", ["<space>bD"] = ":bd!<CR>", ["<m-h>"] = "<C-w>h", ["<m-j>"] = "<C-w>j", ["<m-k>"] = "<C-w>k", ["<m-l>"] = "<C-w>l", ["<m-1>"] = "1gt", ["<m-2>"] = "2gt", ["<m-3>"] = "3gt", ["<m-4>"] = "4gt", ["<m-5>"] = "5gt", ["<m-6>"] = "6gt", ["<m-7>"] = "7gt", ["<m-8>"] = "8gt", ["<m-9>"] = "9gt", ["<m-0>"] = "0gt", ["<m-->"] = ":tabclose<CR>", ["<m-=>"] = ":tabnew<CR>", ["<m-+>"] = ":tabedit", ["<C-a>"] = "<home>", ["<C-e>"] = "<end>", ["<C-f>"] = "<right>", ["<C-b>"] = "<left>", ["<m-f>"] = "<S-right>", ["<m-b>"] = "<S-left>", ["<leader>senus"] = ":setlocal spell! spelllang=en_us<CR>", ["<leader>spl"] = ":setlocal spell! spelllang=pl<CR>", ["<leader>sde"] = ":setlocal spell! spelllang=de<CR>", ["<leader>sno"] = ":set nospell<CR>", ["<C-s>"] = "<Plug>(leap-forward)", ["<C-A-S>"] = "<Plug>(leap-backward)", ["<space>s"] = "<Plug>(leap-cross-window)", ["<space>/"] = ":noh<CR>", ["<f12>"] = ":NvimTreeToggle<CR>"}) do
  vim.keymap.set("n", k_2_auto, v_3_auto, {noremap = false})
end
for k_2_auto, v_3_auto in pairs({["<C-y>"] = "\"+y"}) do
  vim.keymap.set("v", k_2_auto, v_3_auto, {noremap = true})
end
for k_2_auto, v_3_auto in pairs({["<C-\\>"] = "\206\187", ["<C-q>"] = "<Esc>{jV}kgq", ["<C-a>"] = "<Esc>0i", ["<C-e>"] = "<Esc>$a", ["<C-f>"] = "<Esc>la", ["<C-b>"] = "<Esc>ha", ["<A-f>"] = "<Esc>ea", ["<A-k>"] = "<Esc>0d$a", ["<C-d>"] = "<Esc>lxi"}) do
  vim.keymap.set("i", k_2_auto, v_3_auto, {noremap = false})
end
for k_2_auto, v_3_auto in pairs({["<ESC>"] = "<C-\\><C-n>", ["<m-1>"] = "<ESC>1gt", ["<m-2>"] = "<ESC>2gt", ["<m-3>"] = "<ESC>3gt", ["<m-4>"] = "<ESC>4gt", ["<m-5>"] = "<ESC>5gt", ["<m-6>"] = "<ESC>6gt", ["<m-7>"] = "<ESC>7gt", ["<m-8>"] = "<ESC>8gt", ["<m-9>"] = "<ESC>9gt", ["<m-0>"] = "<ESC>0gt", ["<m-->"] = "<ESC>:tabclose<CR>", ["<m-=>"] = "<ESC>:tabnew<CR>", ["<m-+>"] = "<ESC>:tabedit"}) do
  vim.keymap.set("t", k_2_auto, v_3_auto, {noremap = false})
end
return {lsp = lsp}