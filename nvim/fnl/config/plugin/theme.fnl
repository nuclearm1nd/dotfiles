(module config.plugin.theme
  {autoload {theme vim-afterglow}})

;(theme.setup {:theme_style "dark"
;              :comment_style "italic"})

(def- cmd vim.api.nvim_command)

;; Semitransparent backgroud
;(cmd "let tgc=1")
;(cmd "let g:afterglow_inherit_background=1")

;; ColorScheme
(cmd "colorscheme afterglow")

;; Transparent menu
;(cmd "hi Pmenu ctermbg=none guibg=none")

