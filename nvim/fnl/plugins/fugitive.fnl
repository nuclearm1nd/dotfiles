(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :tpope/vim-fugitive
  :init (fn []
          (let [util (require :config.util)]
            (util.keymap :n :<leader>gg ":Git<CR>:only<CR>")
            (util.keymap :n :<leader>gt ":tabe<CR>:Git<CR>:only<CR>")
            (util.keymap :n :<leader>gw ":Gwrite<CR>")

            (vim.api.nvim_create_autocmd
              [:FileType]
              {:pattern [:fugitive]
               :callback
                 (fn [{: buf}]
                   (nvim.buf_set_keymap
                     buf :n :dd
                     "<Plug>fugitive:dv<C-W>_"
                     {:noremap false}))})))}]

