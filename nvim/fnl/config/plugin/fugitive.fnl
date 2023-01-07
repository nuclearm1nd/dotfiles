(module config.plugin.fugitive
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>gg ":Git<CR>:only<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gw ":Gwrite<CR>" {:noremap true})

