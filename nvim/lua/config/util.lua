-- [nfnl] Compiled from fnl/config/util.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
local function merge(t1, _3ft2)
  do
    local t2 = (_3ft2 or {})
    for k, v in pairs(t2) do
      t1[k] = v
    end
  end
  return t1
end
local function keymap(mode, from, to, _3fopts)
  return nvim.set_keymap(mode, from, to, merge({noremap = true}, _3fopts))
end
return {merge = merge, keymap = keymap}
