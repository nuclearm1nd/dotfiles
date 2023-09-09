-- [nfnl] Compiled from fnl/plugins/bbye.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  return nvim.set_keymap("n", "<leader>q", ":Bd<CR>", {noremap = true})
end
return {{"moll/vim-bbye", init = _2_, lazy = false}}
