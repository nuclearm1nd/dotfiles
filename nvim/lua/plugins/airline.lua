-- [nfnl] Compiled from fnl/plugins/airline.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  vim.cmd("set termguicolors")
  vim.cmd("let g:airline_theme='minimalist'")
  vim.cmd("let g:airline#extensions#tabline#enabled = 1")
  return vim.cmd("let g:airline#extensions#whitespace#checks = ['indent', 'trailing']")
end
return {{"vim-airline/vim-airline", priority = 1001, dependencies = {"vim-airline/vim-airline-themes"}, config = _2_, lazy = false}}
