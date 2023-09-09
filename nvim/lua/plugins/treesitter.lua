-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "c", "clojure", "cmake", "css", "dockerfile", "fennel", "git_config", "git_rebase", "gitcommit", "gitignore", "html", "java", "javascript", "json", "latex", "lua", "markdown", "query", "sql", "vim", "vimdoc", "yaml"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
