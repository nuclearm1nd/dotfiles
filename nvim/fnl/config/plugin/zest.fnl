(module config.plugin.zest
  {autoload {nvim aniseed.nvim
             zest zest}})

(zest.setup)

(import-macros {:def-autocmd autocmd
                :def-augroup augroup} :zest.macros)

(augroup :filetype-settings
  (autocmd :FileType [:fennel :clojure] "nnoremap <buffer> <localleader>cc I;; <esc>"))

