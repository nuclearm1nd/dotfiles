-- [nfnl] Compiled from fnl/plugins/retrail.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local retrail = autoload("retrail")
  return retrail.setup({hlgroup = "Search", pattern = "\\v((.*%#)@!|%#)\\s+$", filetype = {strict = true, include = {"clojure", "fennel"}, exclude = {"", "help"}}, trim = {whitespace = true, blanklines = false}})
end
return {{"zakharykaplan/nvim-retrail", branch = "main", config = _2_}}
