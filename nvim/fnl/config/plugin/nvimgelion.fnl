(module config.plugin.nvimgelion)

(def- cmd vim.api.nvim_command)

;; ColorScheme
(cmd "set termguicolors")
(cmd "colorscheme nvimgelion")

