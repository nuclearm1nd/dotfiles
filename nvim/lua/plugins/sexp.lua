-- [nfnl] Compiled from fnl/plugins/sexp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  nvim.g.sexp_enable_insert_mode_mappings = 0
  nvim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"
  return nil
end
return {{"guns/vim-sexp", lazy = true, ft = {"clojure", "scheme", "lisp", "timl", "fennel", "janet"}, init = _2_}}
