-- [nfnl] Compiled from fnl/plugins/nerdtree.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  return nvim.set_keymap("n", "<leader>nt", ":NERDTreeToggle<CR>", {noremap = true})
end
return {{"preservim/nerdtree", config = _2_}}
