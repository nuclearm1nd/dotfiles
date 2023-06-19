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
         buf :n :dv
         ":<C-U>execute <SNR>116_StageDiff('Gvdiffsplit')<CR>99<C-W>_"
         {:noremap true}))})

