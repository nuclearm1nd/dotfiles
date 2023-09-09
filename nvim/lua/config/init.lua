-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
local util = autoload("config.util")
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
nvim.g.loaded_perl_provider = 0
nvim.g.loaded_python3_provider = 0
local function set_flags(flags)
  for _, flag in ipairs(flags) do
    nvim.ex.set(flag)
  end
  return nil
end
local function set_options(options)
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
  return nil
end
set_flags({"hidden", "number", "splitright", "splitbelow", "expandtab", "nowrap", "ttyfast", "autowrite", "mousehide"})
set_options({mouse = "a", tabstop = 2, shiftwidth = 2, softtabstop = 2, shortmess = "atOI", scrolloff = 3, listchars = "tab:\226\134\146\\ ,eol:\226\134\181,trail:\194\183,extends:\226\134\183,precedes:\226\134\182"})
_G.toggle_signcolumn = function()
  if (nvim.wo.signcolumn == "no") then
    nvim.wo.signcolumn = "auto"
    return nil
  else
    nvim.wo.signcolumn = "no"
    return nil
  end
end
_G.toggle_nonprintable_characters = function()
  if (nvim.o.list == true) then
    nvim.o.list = false
    return nil
  else
    nvim.o.list = true
    return nil
  end
end
local keymap = util.keymap
keymap("n", "<leader>tt", ":call v:lua.toggle_signcolumn()<CR>", {silent = true})
keymap("n", "<leader>tc", ":call v:lua.toggle_nonprintable_characters()<CR>", {silent = true})
keymap("v", "<c-c>", "\"+y")
keymap("n", "<c-s-v>", "<esc>\"+p")
keymap("i", "<c-v>", "<esc>\"+pi")
keymap("n", "<c-d>", "yyp")
keymap("i", "<c-d>", "<esc>yypi")
keymap("n", "<c-del>", "<esc>VG$dzb")
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")
keymap("n", "\\", ",")
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("v", "j", "gj")
keymap("v", "k", "gk")
keymap("n", "gj", "j")
keymap("n", "gk", "k")
keymap("v", "gj", "j")
keymap("v", "gk", "k")
keymap("n", "w", "W")
keymap("n", "W", "w")
keymap("v", "w", "W")
keymap("v", "W", "w")
keymap("o", "iw", "iW")
keymap("o", "iW", "iw")
keymap("o", "aw", "aW")
keymap("o", "aW", "aw")
keymap("n", "b", "B")
keymap("n", "B", "b")
keymap("v", "b", "B")
keymap("v", "B", "b")
keymap("o", "b", "B")
keymap("o", "B", "b")
keymap("n", "e", "E")
keymap("n", "E", "gE")
keymap("v", "e", "E")
keymap("v", "E", "gE")
keymap("o", "e", "E")
keymap("o", "E", "gE")
keymap("v", "v", "<Esc>")
keymap("n", "H", "^")
keymap("v", "H", "^")
keymap("o", "H", "^")
keymap("n", "L", "$")
keymap("v", "L", "$")
keymap("o", "L", "$")
keymap("n", "Y", "y$")
keymap("v", "Y", "y$")
keymap("o", "Y", "y$")
keymap("n", "U", "<C-r>")
keymap("n", "<leader>sc", ":nohlsearch<CR>", {silent = true})
keymap("n", "[b", ":bprevious<CR>", {silent = true})
keymap("n", "]b", ":bnext<CR>", {silent = true})
keymap("n", "<leader>ww", "<c-w>k<c-w>o")
keymap("n", "<leader>ch", ":checkhealth<CR>")
keymap("n", "<leader>pu", ":Lazy update<CR>")
keymap("n", "<leader>pi", ":Lazy install<CR>")
keymap("n", "<leader>pc", ":Lazy clean<CR>")
keymap("n", "<leader>pC", ":Lazy check<CR>")
keymap("n", "<leader>ps", ":Lazy sync<CR>")
keymap("n", "<leader>pp", ":Lazy <CR>")
local function _4_()
  if (vim.o.filetype == "help") then
    return vim.cmd.wincmd("L")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"BufWinEnter"}, {group = vim.api.nvim_create_augroup("help_window_right", {}), pattern = {"*.txt"}, callback = _4_})
return {}
