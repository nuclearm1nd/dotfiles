(module config.plugin.theme)

(def- cmd vim.api.nvim_command)

;; ColorScheme
(cmd "let g:gruvbox_contrast_dark='hard'")
(cmd "colorscheme gruvbox")

;; Transparent menu
;(cmd "hi Pmenu ctermbg=none guibg=none")

