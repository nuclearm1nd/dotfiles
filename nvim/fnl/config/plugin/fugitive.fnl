(module config.plugin.fugitive
  {autoload {nvim aniseed.nvim
             util config.util}})

(util.keymap :n :<leader>gg ":Git<CR>:only<CR>")
(util.keymap :n :<leader>gw ":Gwrite<CR>")

(vim.api.nvim_create_autocmd
  [:FileType]
  {:pattern [:fugitive]
   :callback
     (fn [{: buf}]
       (nvim.buf_set_keymap
         buf :n :dd
         "<Plug>fugitive:dv99<C-W>_"
         {:noremap false}))})

