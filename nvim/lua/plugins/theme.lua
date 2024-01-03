-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  vim.cmd("set termguicolors")
  vim.cmd("set background=dark")
  return vim.cmd("colorscheme gruvbox")
end
return {{"ellisonleao/gruvbox.nvim", priority = 1000, dependencies = {"nvim-tree/nvim-web-devicons"}, config = _2_, lazy = false}}
