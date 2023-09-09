-- [nfnl] Compiled from fnl/plugins/fugitive.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local util = require("config.util")
  util.keymap("n", "<leader>gg", ":Git<CR>:only<CR>")
  util.keymap("n", "<leader>gt", ":tabe<CR>:Git<CR>:only<CR>")
  util.keymap("n", "<leader>gw", ":Gwrite<CR>")
  local function _5_(_3_)
    local _arg_4_ = _3_
    local buf = _arg_4_["buf"]
    return nvim.buf_set_keymap(buf, "n", "dd", "<Plug>fugitive:dv<C-W>_", {noremap = false})
  end
  return vim.api.nvim_create_autocmd({"FileType"}, {pattern = {"fugitive"}, callback = _5_})
end
return {{"tpope/vim-fugitive", init = _2_}}
